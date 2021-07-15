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
-- type alias Measurements =
--     List Measurement


type alias Measurement =
    { rating_name : String
    , measurement : Float
    }


oneLineDecoder : Decoder Measurement
oneLineDecoder =
    map2 Measurement
        (stringAttr "rating_name")
        float


measurementDecoder : Decoder (List Measurement)
measurementDecoder =
    path [ "category", "region", "station", "measurement" ] (list oneLineDecoder)


measurementSingleDecoder : Decoder Measurement
measurementSingleDecoder =
    path [ "category", "region", "station", "measurement" ] (single oneLineDecoder)
