import Data.Array (Array, assocs, array)
import Data.Char (digitToInt)
import System.IO (putStrLn, readFile)

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

-- Get all the values in a row
getRow :: Array (Int, Int) Int -> Int -> [Int]
getRow p row = filter check (assocs p)
  where
    check ((x, _), _) = x == row

-- Get all the values in a column
--getCol :: Array (Int, Int) Int -> Int -> [Int]

-- Get all the values in a box
--getBox :: Array (Int, Int) Int -> Int -> [Int]

--isValid :: Array (Int, Int) Int -> (Int, Int) -> Int -> Bool
--isValid puzzle loc value = 

--solve :: Array (Int, Int) Int -> Array (Int, Int) Int
--solve = 

