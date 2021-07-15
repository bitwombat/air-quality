module Example exposing (..)

import AirQual exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Xml.Decode exposing (..)


suite : Test
suite =
    describe "Basic XML decode"
        [ describe "fixed data"
            [ test "really don't have much to say" <|
                \_ ->
                    """
    <root>
        <path>
            <to>
                <string>
                    <value>SomeString</value>
                </string>
                <int>
                    <values>1</values>
                    <values>2</values>
                </int>
            </to>
        </path>
    </root>
    """
                        |> decodeString dataDecoder
                        |> Expect.equal (Ok { string = "SomeString", integers = [ 1, 2 ] })
            ]
        ]
