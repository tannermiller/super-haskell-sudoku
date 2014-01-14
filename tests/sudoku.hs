module Main where

import Test.HUnit
import Sudoku

test1 = TestCase $ assertEqual "test locList" [(x,y) | x <- [0..8], y <- [0..8]] locList

tests = TestList [TestLabel "locList" test1]

main :: IO ()
main = do
    counts <- runTestTT tests
    --putStr $ showCounts counts
    return ()

