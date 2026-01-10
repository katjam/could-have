module Fact.View exposing (viewFacts, viewThingsCouldHave)

import Fact.Data
import Html
import Html.Events
import Msg


viewFacts : List Fact.Data.Fact -> Html.Html Msg.Msg
viewFacts facts =
    Html.ul [] (List.map (\fact -> viewFact fact) facts)


viewFact : Fact.Data.Fact -> Html.Html Msg.Msg
viewFact fact =
    Html.li []
        [ Html.text fact.label
        , if fact.what == Fact.Data.Person then
            Html.button [ Html.Events.onClick (Msg.ShowThings fact) ] [ Html.text "Show things could have" ]

          else
            Html.text ""
        ]


viewThingsCouldHave : Fact.Data.Fact -> Html.Html Msg.Msg
viewThingsCouldHave fact =
    Html.div [] [ Html.text fact.label ]
