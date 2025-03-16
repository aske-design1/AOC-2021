module Day02Test (day02Tests) where
import qualified Day02(part1, part2)

import Test.HUnit
  ( Counts,
    Test (TestCase, TestList),
    assertEqual,
    runTestTT,
  )

-- Test Cases
-- Part 1
testPart1 :: Test
testPart1 = TestCase (assertEqual "Part 1" 150
  (Day02.part1 "forward 5\ndown 5\nforward 8\nup 3\ndown 8\nforward 2"))

-- Part 2
testPart2 :: Test
testPart2 = TestCase (assertEqual "Part 2" 900 (
  Day02.part2 "forward 5\ndown 5\nforward 8\nup 3\ndown 8\nforward 2"))

-- Group test cases
tests :: Test
tests = TestList [testPart1, testPart2]

-- Run test cases
day02Tests :: IO Counts
day02Tests = runTestTT tests




