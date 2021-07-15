module AirQual exposing (..)

import Xml.Decode exposing (..)


type alias AirQual =
    List Region


type alias Region =
    List Station


type alias Station =
    { name : String, index : Float }


type alias Data =
    { string : String
    , integers : List Int
    }


dataDecoder : Decoder Data
dataDecoder =
    map2 Data
        (path [ "path", "to", "string", "value" ] (single string))
        (path [ "path", "to", "int", "values" ] (list int))
