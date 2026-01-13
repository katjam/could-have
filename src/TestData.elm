module TestData exposing (facts)

import Fact.Data


facts : List Fact.Data.Fact
facts =
    [ { what = Fact.Data.Thing
      , when = ( 1900, Just 1920 )
      , label = "1900-1920 thing"
      }
    , { what = Fact.Data.Thing
      , when = ( 1911, Just 1920 )
      , label = "1911-1920 thing"
      }
    , { what = Fact.Data.Thing
      , when = ( 1911, Just 1921 )
      , label = "1911-1921 thing"
      }
    , { what = Fact.Data.Thing
      , when = ( 1900, Nothing )
      , label = "1900-now thing"
      }
    , { what = Fact.Data.Person
      , when = ( 1900, Just 1910 )
      , label = "1900-1910 person"
      }
    , { what = Fact.Data.Person
      , when = ( 1921, Just 1930 )
      , label = "1921-1930 person"
      }
    , { what = Fact.Data.Person
      , when = ( 1921, Nothing )
      , label = "1921-now person"
      }
    , { what = Fact.Data.Person
      , when = ( 1800, Just 1899 )
      , label = "1800-1899 now person"
      }
    ]
