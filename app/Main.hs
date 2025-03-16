module Main (main) where

import qualified Day01 (part1, part2)
import qualified Day02 (part1, part2)
import System.Directory (getCurrentDirectory)


main :: IO ()
main = do
  putStrLn "Please choose day:"
  dayStr <- getLine
  let day = read dayStr :: Int
  res <- dayParser day

  case res of
    Nothing -> putStrLn "Not a valid day"
    Just (p1, p2) -> do
      putStrLn $ "Part 1: " ++ show p1
      putStrLn $ "Part 2: " ++ show p2

dayParser :: Int -> IO (Maybe (Int, Int))
dayParser day = do
  curDir <- getCurrentDirectory
  input <- readFile $ curDir ++ "/files/day" ++ show day ++ ".txt"

  case day of
    1 -> return $ Just (Day01.part1 input, Day01.part2 input)
    2 -> return $ Just (Day02.part1 input, Day02.part2 input)
    _ -> return Nothing
