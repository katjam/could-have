module Fact.View exposing (viewFacts, viewThingsCouldHave)

import Fact.Data
import Html
import Html.Events
import Msg
import TestData


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
viewThingsCouldHave person =
    Html.div []
        [ Html.h2 []
            [ Html.text (person.label ++ " could have: ") ]
        , Html.ul
            []
            (List.map
                (\thing ->
                    if Fact.Data.isCoexistant person thing then
                        Html.li [] [ Html.text thing.label ]

                    else
                        Html.text ""
                )
                (List.filter
                    (\aFact -> aFact.what == Fact.Data.Thing)
                    TestData.facts
                )
            )
        ]
