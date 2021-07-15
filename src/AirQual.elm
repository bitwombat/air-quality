module AirQual exposing (..)

import Xml.Decode exposing (..)



-- type alias AirQual =
--     List Region
--
--
-- type alias Region =
--     List Station
--
--
-- type alias Station =
--     { name : String, index : Float }


type alias Data =
    { rating_name : String
    , measurement : Float
    }



-- type alias Measurements =
--     List Data


dataDecoder : Decoder Data
dataDecoder =
    map2 (::)
        (path [ "category", "region", "station", "measurement" ] (single <| stringAttr "rating_name"))
        (path [ "category", "region", "station", "measurement" ] (single float))
