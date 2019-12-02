module Day02 where

import Commons

parseInput :: String -> [Int]
parseInput = map read . (splitOn (==','))

run :: Int -> [Int] -> Int
run p xs | code == 99 = head xs
         | otherwise  = run (p+4) xs'
         where
          code = xs !! p
          l    = xs !! (xs !! (p+1))
          r    = xs !! (xs !! (p+2))
          idx  = xs !! (p+3)
          op   = case code of
                  1 -> (+)
                  2 -> (*)
          xs'  = take idx xs ++ op l r : drop (idx+1) xs

reset :: a -> a -> [a] -> [a]
reset x y xs = [head xs, x, y] ++ drop 3 xs

day02b :: Int -> [Int] -> Int
day02b ex xs = 100 * noun + verb
  where
    g        = flip reset 0
    f x      = run 0 $ g x xs
    (x',_)   = head $ dropWhile (\(_,v) -> ex > v) [(x, f x) | x <- [0..]]
    noun     = x' - 1
    g'       = reset noun
    f' x     = run 0 $ g' x xs
    (verb,_) = head $ dropWhile (\(_,v) -> ex /= v) [(x, f' x) | x <- [0..]]

solution :: IO()
solution = do putStr "Part 01: "              
              intcodes <- parseInput <$> getInput "input02.txt"
              print $ run 0 (reset 12 2 intcodes)
              putStr "Part 02: "
              print $ day02b 19690720 intcodes

main :: IO()
main = solution
