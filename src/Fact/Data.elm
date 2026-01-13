module Fact.Data exposing (Fact, FactType(..), isCoexistant)


type FactType
    = Thing
    | Person


type alias Fact =
    { what : FactType
    , when : ( Int, Maybe Int )
    , label : String
    }


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
