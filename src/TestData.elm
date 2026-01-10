module TestData exposing (facts)

import Fact.Data


facts : List Fact.Data.Fact
facts =
    [ { what = Fact.Data.Thing
      , when = ( 1900, 1920 )
      , label = "1900-1920 thing"
      }
    , { what = Fact.Data.Thing
      , when = ( 1911, 1920 )
      , label = "1911-1920 thing"
      }
    , { what = Fact.Data.Person
      , when = ( 1900, 1910 )
      , label = "1900-1910 person"
      }
    , { what = Fact.Data.Person
      , when = ( 1921, 1930 )
      , label = "1921-1930 person"
      }
    ]
