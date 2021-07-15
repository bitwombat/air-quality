module Tests exposing (..)

import AirQual exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Xml.Decode exposing (..)


suite : Test
suite =
    describe "Basic XML decode"
        [ test "Measurement node decode" <|
            \_ ->
                """
                    <root>
                        <measurement name="Particle PM10" rating_name="Very Good" rating="1" index="18.8">9.4</measurement>
                    </root>
                    """
                    |> decodeString dataDecoder
                    |> Expect.equal (Ok { rating_name = "Very Good", measurement = 9.4 })
        ]
