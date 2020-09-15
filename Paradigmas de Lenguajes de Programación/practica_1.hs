-- Ej1
-- max2 (x, y) | x >= y = x
--             | otherwise = y




-- 9
type DivideConquer a b = (a -> Bool)
                         -> (a -> b)
                         -> (a -> [a])
                         -> ([b] -> b)
                         -> a
                         -> b

dc:: DivideConquer a b
dc trivial solve split combine x = if trivial x then solve x else
                                   combine (map (\z -> dc trivial solve split combine z) (split x))

-- mergeSort :: Ord a => [a] -> [a]
-- mergeSort = dc (\x-> length x == 1) id (++) ()

dcmap f xs = dc (\x -> length x == 1) (\x -> [f (head x)])
                (\(x:xs) -> [x]:[xs]) concat xs


-- 10
foldrSum :: Num a => [a] -> a
foldrSum = foldr (\x r -> x + r) 0

foldrMap f = foldr (\x r -> (f x):r) []

folderFilter f = foldr (\x r -> if f x then r else x:r) []
