module Libs.Time exposing (decode, encode, isZero, zero)

import Iso8601
import Json.Decode as Decode
import Json.Encode as Encode exposing (Value)
import Time


zero : Time.Posix
zero =
    Time.millisToPosix 0


isZero : Time.Posix -> Bool
isZero time =
    Time.posixToMillis time == 0


encode : Time.Posix -> Value
encode value =
    value |> Time.posixToMillis |> Encode.int


decode : Decode.Decoder Time.Posix
decode =
    Decode.oneOf
        [ Decode.int |> Decode.map Time.millisToPosix
        , Iso8601.decoder
        ]
