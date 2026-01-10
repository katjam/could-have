module Main exposing (main)

import Browser
import Fact.Data
import Fact.View
import Html
import Msg
import TestData


type alias Flags =
    ()


main : Program Flags Model Msg.Msg
main =
    Browser.document
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = viewDocument
        }


type alias Model =
    { currentFact : Maybe Fact.Data.Fact }


init : () -> ( Model, Cmd Msg.Msg )
init _ =
    ( { currentFact = Nothing }
    , Cmd.none
    )


update : Msg.Msg -> Model -> ( Model, Cmd Msg.Msg )
update msg model =
    case msg of
        Msg.ShowThings fact ->
            ( { model | currentFact = Just fact }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg.Msg
subscriptions model =
    Sub.none


viewDocument : Model -> Browser.Document Msg.Msg
viewDocument model =
    { title = "Could have", body = [ view model ] }


view : Model -> Html.Html Msg.Msg
view model =
    Html.div
        []
        [ Html.text "Could have"
        , Fact.View.viewFacts TestData.facts
        , case model.currentFact of
            Just aFact ->
                Fact.View.viewThingsCouldHave aFact

            Nothing ->
                Html.text ""
        ]
