module Commons where
  
import System.Environment

getInput :: String -> IO String
getInput name =
  do args <- getArgs
     case args of
       []    -> readFile name
       "-":_ -> getContents
       fn:_  -> readFile fn

str2Int :: String -> Int
str2Int s = read s :: Int

splitOn :: (Char -> Bool) -> String -> [String]
splitOn p s = case dropWhile p s of
                "" -> []
                s' -> w : splitOn p s''
                    where (w, s'') = break p s'