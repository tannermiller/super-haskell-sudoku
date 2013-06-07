import Data.Array
import Data.Char
import System.IO

main :: IO ()
main = do
    putStrLn "Hello, World"
    puzzle <- readFile "test.dat"
    puzzle <- return $ load puzzle
    putStrLn "Done"

-- Define a puzzle as a 9x9 array
puzzle :: [((Int, Int), e)] -> Array (Int, Int) e
puzzle = array ((0,0), (8,8))

locList = [(x,y) | x <- [0..8], y <- [0..8]]

-- Load the puzzle from a String
load :: String -> Array (Int, Int) Int
load = puzzle . zip locList . map digitToInt . filter ('\n' /=)

