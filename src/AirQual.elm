module AirQual exposing (..)

import Xml.Decode exposing (..)


type alias AirQual =
    List Region


type alias Region =
    List Station


type alias Station =
    { name : String, index : Float }


type alias Data =
    { rating_name : String
    , measurement : Float
    }


dataDecoder : Decoder Data
dataDecoder =
    map2 Data
        (path [ "measurement" ] (single <| stringAttr "rating_name"))
        (path [ "measurement" ] (single float))
