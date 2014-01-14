module Main where

import Sudoku

main :: IO ()
main = do
    putStrLn "Hello, World"
    puz <- readFile "example.dat"
    puz <- return $ load puz
    row <- return $ getBoxRow puz (0,0)
    putStrLn $ show row
    --putStrLn $ show (getBoxCol (0,0) row)
    putStrLn "Done"

