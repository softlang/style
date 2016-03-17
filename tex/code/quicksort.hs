module Quicksort (
   quicksort
) where

   quicksort [] = []
   quicksort [x] = [x] 
   quicksort (x:xs) = (quicksort [a|a <- xs, a <= x]) ++ [x] ++ (quicksort [a| a <- xs, a > x]) 
   