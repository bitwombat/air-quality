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


type alias Measurement =
    { rating_name : String
    , measurement : Float
    }



-- type alias Measurements =
--     List Measurement


oneLineDecoder : Decoder Measurement
oneLineDecoder =
    map2 Measurement
        (path [ "measurement" ] (single <| stringAttr "rating_name"))
        (path [ "measurement" ] (single float))


measurementDecoder : Decoder (List Measurement)
measurementDecoder =
    path [ "category", "region", "station" ] (list oneLineDecoder)
