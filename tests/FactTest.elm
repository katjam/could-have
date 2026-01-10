module FactTest exposing (suite)

import Expect
import Fact.Data
import Test exposing (Test, describe, test)
import TestData


suite : Test
suite =
    describe "Fact data"
        [ test "person can have things" <|
            \() ->
                Fact.Data.personToThings
                    |> Expect.equal
                        []
        ]
