import Data.Array
import System.IO

main :: IO ()
main = do
    putStrLn "Hello, World"
    data_puzzle <- readFile "test.dat"
    puzzle <- return $ loadPuzzle data_puzzle
    putStrLn "Done"

-- Define a puzzle as a 9x9 array
puzzle :: [((Integer, Integer), e)] -> Array (Integer, Integer) e
puzzle = array ((0,0), (8,8))

-- Load the puzzle from a String
loadPuzzle :: String -> Array (Integer, Integer) Char
loadPuzzle = puzzle . zip [(x,y) | x <- [0..8], y <- [0..8]] . filter ('\n' /=)

