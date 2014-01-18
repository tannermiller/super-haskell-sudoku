{-# LANGUAGE TemplateHaskell #-}
module Main where

import Data.Array (array)
import Sudoku
import Test.Framework.Providers.HUnit
import Test.Framework.TH
import Test.Framework
import Test.HUnit hiding (test)

case_locList = [(x,y) | x <- [0..8], y <- [0..8]] @=? locList

case_load = array ((0,0),(8,8)) expected @=? load input
  where
    expected = zip [(x,y) | x <- [0..8], y <- [0..8]] (concat [[1..9] | _ <- [0..8]])
    input = unlines $ take 9 $ repeat $ foldl1 (++) $ map show [1..9]

main :: IO ()
main = defaultMain [$testGroupGenerator]

