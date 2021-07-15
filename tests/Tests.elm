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
                <airdata provider="Department of Environment and Science" state="Queensland" country="Australia">
                    <category name="Air Quality" measurementhour="13" measurementdate="2021-07-15">
                        <region name="Central Queensland" information="https://www.qld.gov.au/environment/pollution/monitoring/air/air-monitoring/network-stations/central-qld">
                            <station name="Moranbah (Utah Dr)" information="https://apps.des.qld.gov.au/air-quality/stations/?station=mor" longitude="148.071" latitude="-21.9995">
                                <measurement name="Particle PM10" rating_name="Very Good" rating="1" index="30">15</measurement>
                                <measurement name="Particle PM2.5" rating_name="Very Good" rating="1" index="19.6">4.9</measurement>
                            </station>
                        </region>
                    </category>
                </airdata>
                """
                    |> decodeString dataDecoder
                    |> Expect.equal
                        [ Ok
                            { rating_name = "Very Good", measurement = 15 }
                        , ( Ok
                          , { rating_name = "Very Good", measurement = 4.9 }
                          )
                        ]
        ]
