import Data.Array (Array, assocs, array)
import Data.Char (digitToInt)
import System.IO (putStrLn, readFile)

-- TODO: add tests
main :: IO ()
main = do
    putStrLn "Hello, World"
    puz <- readFile "test.dat"
    puz <- return $ load puz
    rows <- return $ getRow puz 0
    putStrLn $ show rows
    putStrLn "Done"

-- Define a puzzle as a 9x9 array
puzzle :: [((Int, Int), e)] -> Array (Int, Int) e
puzzle = array ((0,0), (8,8))

-- list of array locations
locList = [(x,y) | x <- [0..8], y <- [0..8]]

-- Load the puzzle from a String
load :: String -> Array (Int, Int) Int
load = puzzle . zipLoc . mapInt . mapBlanks . filter ('\n' /=)
  where
    zipLoc = zip locList
    mapInt = map digitToInt
    mapBlanks = map (\x -> if x == ' ' then '0' else x)

-- Get all the values in a row
getRow :: Array (Int, Int) Int -> Int -> [Int]
getRow p row = map clean $ filter check $ assocs p
  where
    check ((x, _), _) = x == row
    clean = fst . fst

-- Get all the values in a column
--getCol :: Array (Int, Int) Int -> Int -> [Int]

-- Get all the values in a box
--getBox :: Array (Int, Int) Int -> Int -> [Int]

--isValid :: Array (Int, Int) Int -> (Int, Int) -> Int -> Bool
--isValid puzzle loc value = 

--solve :: Array (Int, Int) Int -> Array (Int, Int) Int
--solve = 

