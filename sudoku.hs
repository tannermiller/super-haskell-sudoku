import Data.Array (Array, assocs, array)
import Data.Char (digitToInt)
import System.IO (putStrLn, readFile)

-- TODO: add tests
main :: IO ()
main = do
    putStrLn "Hello, World"
    puz <- readFile "test.dat"
    puz <- return $ load puz
    putStrLn $ show (getBoxCol (0,0) (getBoxRow puz (0,0)))
    putStrLn "Done"

-- Define a puzzle as a 9x9 array
puzzle :: [((Int,Int), e)] -> Array (Int,Int) e
puzzle = array ((0,0),(8,8))

-- list of array locations
locList = [(x,y) | x <- [0..8], y <- [0..8]]

-- Load the puzzle from a String
load :: String -> Array (Int,Int) Int
load = puzzle . zipLoc . mapInt . mapBlanks . filter ('\n' /=)
  where
    zipLoc = zip locList
    mapInt = map digitToInt
    mapBlanks = map (\x -> if x == ' ' then '0' else x)

-- Get all the values in a row
getRow :: Array (Int,Int) Int -> Int -> [Int]
getRow p row = map snd $ filter check $ assocs p
  where check ((x, _),_) = x == row

-- Get all the values in a column
getCol :: Array (Int,Int) Int -> Int -> [Int]
getCol p col = map snd $ filter check $ assocs p
  where check ((_, y),_) = y == col

-- Get all the values in a box
--getBox :: Array (Int,Int) Int -> (Int,Int) -> [Int]
--getBox p loc = 

getBoxRow :: Array (Int,Int) Int -> (Int,Int) -> [[Int]]
getBoxRow p loc = case mod x 3 of 0 -> [getRow p i | i<-[x,x+1,(x+2)]]
                                  1 -> [getRow p i | i<-[(x-1),x,(x+1)]]
                                  2 -> [getRow p i | i<-[(x-2),(x-1),x]]
  where x = fst loc

getBoxCol :: (Int,Int) -> [[Int]] -> [[Int]]
getBoxCol loc rows = map (map snd) (map colFilter [zip [0..] row | row<-rows])
  where
    colFilter = let y = snd loc in
                filter (\(i,x) -> 

--isValid :: Array (Int, Int) Int -> (Int, Int) -> Int -> Bool
--isValid puzzle loc value = 

--solve :: Array (Int, Int) Int -> Array (Int, Int) Int
--solve = 

