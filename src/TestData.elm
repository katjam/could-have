module TestData exposing (facts)

import Csv.Decode
import Fact.Data


facts =
    case rawFacts of
        Ok someFacts ->
            someFacts

        Err error ->
            let
                _ =
                    Debug.log "Eroo" error
            in
            []


rawFacts : Result Csv.Decode.Error (List Fact.Data.Fact)
rawFacts =
    Csv.Decode.decodeCsv Csv.Decode.FieldNamesFromFirstRow Fact.Data.decoder csvData


csvData =
    "what,start,end,type\u{000D}\n1st wheel & axel,-3000,,Thing\u{000D}\n1st Writing Systems,-3200,,Thing\u{000D}\nGreat Pyramid of Giza built,-2560,,Thing\u{000D}\n1st Printing Press,1440,,Thing\u{000D}\nSigned Magna Carta,1215,,Thing\u{000D}\nBlack Death in Europe,1347,1351,Thing\u{000D}\n1st Gunpowder,800,,Thing\u{000D}\n1st Rail Transport,1802,,Thing\u{000D}\nWomen’s right to vote (US),1920,,Thing\u{000D}\nWomen’s right to vote (Ireland),1922,,Thing\u{000D}\nWomen’s right to vote (UK),1928,,Thing\u{000D}\nWomen’s right to vote (Kuwait),2005,,Thing\u{000D}\nWomen’s right to vote (Saudi Arabia),2015,,Thing\u{000D}\nCommunist Manifesto,1848,,Thing\u{000D}\nWomen’s right to vote (Australia),1903,,Thing\u{000D}\nBoston Tea Party,1773,,Thing\u{000D}\nIntegrated Circuit (microchip),1958,,Thing\u{000D}\nTelevision,1925,,Thing\u{000D}\nFacebook,2004,,Thing\u{000D}\nMuhammad,570,632,Person\u{000D}\nIsaac Newton,1642,1727,Person\u{000D}\nJesus of Nazareth,-5,30,Person\u{000D}\nBuddha,-563,-483,Person\u{000D}\nConfucius,-551,-479,Person\u{000D}\nSt Paul,5,67,Person\u{000D}\nTs’ai Lun,50,121,Person\u{000D}\nJohann Gutenberg,1395,1468,Person\u{000D}\nChristopher Columbus,1451,1506,Person\u{000D}\nAlbert Einstein,1879,1955,Person\u{000D}\nLouis Pasteur,1822,1895,Person\u{000D}\nGalileo Galilei,1564,1642,Person\u{000D}\nAristotle,-384,-322,Person\u{000D}\nEuclid,-325,-265,Person\u{000D}\nMoses,-1391,-1271,Person\u{000D}\nCharles Darwin,1809,1882,Person\u{000D}\nShih Huang Ti,-259,-210,Person\u{000D}\nAugustus Caesar,-63,14,Person\u{000D}\nNicolaus Copernicus,1473,1543,Person\u{000D}\nAntoine Laurent Lavoisier,1743,1794,Person\u{000D}\nConstantine the Great,272,337,Person\u{000D}\nJames Watt,1736,1819,Person\u{000D}\nMichael Faraday,1791,1867,Person\u{000D}\nJames Clerk Maxwell,1831,1879,Person\u{000D}\nMartin Luther,1483,1546,Person\u{000D}\nGeorge Washington,1732,1799,Person\u{000D}\nKarl Marx,1818,1883,Person\u{000D}\nOrville Wright,1871,1948,Person\u{000D}\nWilbur Wright,1867,1912,Person\u{000D}\nGenghis Kahn,1162,1227,Person\u{000D}\nAdam Smith,1723,1790,Person\u{000D}\nWilliam Shakespeare,1564,1616,Person\u{000D}\nJohn Dalton,1766,1844,Person\u{000D}\nAlexander the Great,-356,-323,Person\u{000D}\nNapoleon Bonaparte,1769,1821,Person\u{000D}\nThomas Edison,1847,1931,Person\u{000D}\nAntony van Leeuwenhoek,1632,1723,Person\u{000D}\nWilliam TG Morton,1819,1868,Person\u{000D}\nGuglielmo Marconi,1874,1937,Person\u{000D}\nAdolf Hitler,1889,1945,Person\u{000D}\nPlato,-424,-348,Person\u{000D}\nOliver Cromwell,1599,1658,Person\u{000D}\nAlexander Graham Bell,1847,1922,Person\u{000D}\nAlexander Fleming,1881,1955,Person\u{000D}\nJohn Locke,1632,1704,Person\u{000D}\nLudwig van Beethoven,1770,1827,Person\u{000D}\nWerner Heisenberg,1901,1976,Person\u{000D}\nLouis Daguerre,1787,1851,Person\u{000D}\nSimon Bolivar,1783,1830,Person\u{000D}\nRene Descartes,1596,1650,Person\u{000D}\n"


testFacts : List Fact.Data.Fact
testFacts =
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
