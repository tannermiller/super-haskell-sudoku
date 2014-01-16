{-# LANGUAGE TemplateHaskell #-}
module Main where

import Sudoku
import Test.Framework.Providers.HUnit
import Test.Framework.TH
import Test.Framework
import Test.HUnit hiding (test)

case_locList = [(x,y) | x <- [0..8], y <- [0..8]] @=? locList

main :: IO ()
main = defaultMain [$testGroupGenerator]

