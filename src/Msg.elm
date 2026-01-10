module Msg exposing (Msg(..))

import Fact.Data


type Msg
    = ShowThings Fact.Data.Fact
