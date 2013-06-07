import Data.Array
import Data.Char
import System.IO

main :: IO ()
main = do
    putStrLn "Hello, World"
    data_puzzle <- readFile "test.dat"
    puzzle <- return $ loadPuzzle data_puzzle
    putStrLn "Done"

-- Define a puzzle as a 9x9 array
puzzle :: [((Int, Int), e)] -> Array (Int, Int) e
puzzle = array ((0,0), (8,8))

locList = [(x,y) | x <- [0..8], y <- [0..8]]

-- Load the puzzle from a String
loadPuzzle :: String -> Array (Int, Int) Int
loadPuzzle = puzzle . zip locList . map digitToInt . filter ('\n' /=)

