module Base64 (encode, decode) where

import Array
import Bitwise (..)
import List
import String (..)

chars = Array.fromList ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'M', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'm', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/']

i2c : Int -> Char
i2c i = Array.getOrFail i chars

partitionBits : (Int,Int,Int) -> [Int]
partitionBits (a,b,c) =
  [ a `shiftRightLogical` 2
  , (a `and` 3 `shiftLeft` 4) + (b `shiftRightLogical` 4)
  , (b `and` 15 `shiftLeft` 2) + (c `shiftRightLogical` 6)
  , c `and` 63 ]

encode : String -> String
encode s = fromList <| List.map i2c <| partitionBits (97, 97, 97)

decode : String -> Maybe String
decode s = Just s
