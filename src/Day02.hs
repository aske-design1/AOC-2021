module Day02 (part1, part2) where
import Data.List.Split (splitOn)

part1 :: String -> Int
part1 = uncurry (*) . foldl navigate (0, 0) . splitOn "\n"
    where 
        navigate (fwd, dpt) str = case disassemble str of
            ("forward",num) -> (fwd + num, dpt)
            ("down",num) -> (fwd, dpt + num)
            ("up",num) -> (fwd, dpt - num)
            _ -> (fwd, dpt)

part2 :: String -> Int
part2 = (\ (x, y, _) -> x * y) .  foldl navigateAim (0, 0, 0) . splitOn "\n"
    where 
        navigateAim (fwd, dpt, aim) str = case disassemble str of
            ("forward",num) -> (fwd + num, dpt + num * aim, aim)
            ("down",num) -> (fwd, dpt, aim + num)
            ("up",num) -> (fwd, dpt, aim - num)
            _ -> (fwd, dpt, aim)

disassemble :: String -> (String, Int)
disassemble str = case splitOn " " str of
    [cmd, num] -> (cmd, read num :: Int) 
    _ -> ("", 0)