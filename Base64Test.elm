module Base64Test where

import Base64
import ElmTest.Assertion (..)
import ElmTest.Test (..)

suite = Suite "Base64" [
  Suite "encode" [
    Base64.encode "a" `equals` "YQ==",
    Base64.encode "my updated file contents" `equals` "bXkgdXBkYXRlZCBmaWxlIGNvbnRlbnRz"
    ],
  Suite "decode" [
    Base64.decode "YQ==" `equals` Just "a",
    Base64.decode "bXkgdXBkYXRlZCBmaWxlIGNvbnRlbnRz" `equals` Just "my updated file contents"
    ]
  ]
