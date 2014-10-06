module Base64Test where

import Base64
import ElmTest.Assertion (..)
import ElmTest.Test (..)

encodeTest : (String, String) -> Test
encodeTest (s,b) = Base64.encode s `equals` b

decodeTest : (String, String) -> Test
decodeTest (s,b) = Base64.decode b `equals` Just s

examples = [
  ("aaa", "YWFh"),
  ("my updated file contents", "bXkgdXBkYXRlZCBmaWxlIGNvbnRlbnRz"),
  ("a", "YQ=="),
  ("aa", "YWE=")
  ]

suite = Suite "Base64" [
  Suite "encode" <| map encodeTest examples,
  Suite "decode" <| map decodeTest examples
  ]
