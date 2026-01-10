module Fact.Data exposing (Fact, FactType(..), personToThings)


type FactType
    = Thing
    | Person


type alias Fact =
    { what : FactType
    , when : ( Int, Int )
    , label : String
    }


personToThings : List Fact
personToThings =
    []
