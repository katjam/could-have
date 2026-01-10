module KelmTest exposing (suite)

import Base
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "BaseStart"
        [ test "initial state" <|
            \() ->
                Base.init
                    |> Expect.equal
                        { value = 0
                        }
        ]
