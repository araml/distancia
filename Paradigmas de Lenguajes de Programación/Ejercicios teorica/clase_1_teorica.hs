dobleL :: [Float] -> [Float]
dobleL []     = []
dobleL (x:xs) = (2 * x):(dobleL xs)
-- dobleL = map (\x -> 2 * x)

esPar :: [Int] -> [Bool]
esPar []     = []
esPar (x:xs) = (mod x 2 == 0):esPar(xs)
-- esPar = map (\x -> mod x 2 == 0)

longL :: [[a]] -> [Int]
longL [] = []
longL (x:xs) = (length x):longL xs
-- longL = map (\x -> length x)

