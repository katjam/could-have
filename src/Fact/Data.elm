module Fact.Data exposing (Fact, FactType(..), decoder, isCoexistant)

import Csv.Decode


type FactType
    = Thing
    | Person


type alias Fact =
    { what : FactType
    , when : ( Int, Maybe Int )
    , label : String
    }


decoder : Csv.Decode.Decoder Fact
decoder =
    Csv.Decode.into Fact
        |> Csv.Decode.pipeline
            (Csv.Decode.field "type" Csv.Decode.string
                |> Csv.Decode.andThen factTypeFromString
            )
        |> Csv.Decode.pipeline
            (Csv.Decode.map2 Tuple.pair
                (Csv.Decode.field "start" Csv.Decode.int)
                (Csv.Decode.blank (Csv.Decode.field "end" Csv.Decode.int))
            )
        --|> Csv.Decode.pipeline (Csv.Decode.succeed ( 0, Just 0 ))
        |> Csv.Decode.pipeline
            (Csv.Decode.field "what" Csv.Decode.string)


factTypeFromString : String -> Csv.Decode.Decoder FactType
factTypeFromString typeString =
    case String.toLower typeString of
        "person" ->
            Csv.Decode.succeed Person

        "thing" ->
            Csv.Decode.succeed Thing

        _ ->
            Csv.Decode.fail ("Invalid fact type: " ++ typeString)


isCoexistant : Fact -> Fact -> Bool
isCoexistant fact1 fact2 =
    -- Fact 1 starts existance before Fact 2 ceases to exist
    (case Tuple.second fact2.when of
        Just aYear ->
            Tuple.first fact1.when
                <= aYear

        Nothing ->
            True
    )
        -- Fact 2 starts existance before Fact 1 ceases to exist
        && (case Tuple.second fact1.when of
                Just aYear ->
                    Tuple.first fact2.when
                        <= aYear

                Nothing ->
                    True
           )
