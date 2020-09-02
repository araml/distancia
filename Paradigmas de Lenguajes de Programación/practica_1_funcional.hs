-- Ej 1
-- max :: (Float, Float) -> Float
-- max2 (x, y) | x >= y = x
--             | otherwise = y

-- normaVectorial :: (Float, Float) -> Float
-- normaVectorial (x, y) = sqrt(x^2 + y^2)
--
-- subtract :: Float -> Float -> Float
-- subtract = flip (-)

-- predecesor :: Float -> Float
-- predecesor = subtract 1
--

-- evaluarEnCero :: (Int -> a) -> b
-- evaluarEnCero = \f -> f 0
--

-- dosVeces :: (b -> b) -> b -> b
-- dosVeces = \f -> f.f

dosVeces :: (b -> b) -> b -> b
dosVeces = \f -> f.f

-- flipAll :: [a -> b -> c] -> [b -> a -> c]
flipAll = map flip

--flipRaro :: (a -> b -> c) -> a -> b -> c
-- flip flipea los parametros, por ejemplo si tenemos
-- (a -> b -> c) al aplicar flip nos da (b -> a -> c)
-- esto es la aplicacion de flip a flip
-- los parametros de flip son
-- (a -> b -> c) -> b -> a -> c
-- Si tenemos que flipear esto nos deberia quedar
-- a = (a -> b -> c)
-- b = b
-- c = (a- > c)
-- Osea que nos queda de parametro final
flipRaro :: b -> (a -> b -> c) -> a -> c
flipRaro = flip flip
-- Y se usa como
-- flipRaro v1 (\x y -> .. ) v2


-- EJ 2
--
curry :: ((a, b) -> c) -> (a -> (b -> c))
curry f x y = f (x, y)

uncurry :: (a -> (b -> c)) -> ((a, b) -> c)
uncurry f (x, y) = f x y

-- EJ 3
-- Serian la primer coordenada de los numeros de la forma
--                                1 + 1, 1 + 2, 1 + 3,
--                                2 + 2, 2 + 3
--                                3 + 3 que son divisibles por 3
-- Osea, que en la lista entra 1 y 3
mod3 = [ x | x <- [1..3], y <- [x..3], (x + y) `mod` 3 == 0 ]

-- Ej 4
--

-- Ej 5
--

-- Ej 6
--
partir :: [a] -> [([a], [a])]
partir xs = [ (take idx xs, drop idx xs) | idx <- [0.. (length xs)] ]

-- Ej 7
--
listasQueSuman :: Int -> [ [ Int ] ]
listasQueSuman 0 = [ [ ] ]
listasQueSuman n = [ (l:ls) | l <- [1..n], ls <- listasQueSuman (n - l) ]

-- Ej 8
--
--partes :: Int -> [[Int]]
--

-- ej 9
type DivideConquer a b = (a -> Bool) -- caso trivial?
                       -> (a -> b)   -- resuelve caso trivial
                       -> (a -> [a]) -- parte el problema en sub problemas
                       -> ([b] -> b) -- combina resultados
                       -> a          -- estructura de entrada
                       -> b          -- resultado

dc :: DivideConquer a b
dc trivial solve split combine x = if trivial x then solve x else
                                   combine (map f (split x))
                                   where f = (\y -> dc trivial solve split combine y)

mapDC :: (a -> b) -> [a] -> [b]
mapDC f l = dc (\x -> length x == 1) (\y -> f y) (\l -> :

-- EJ 10
sumF :: Num a => [a] -> a
sumF xs = foldr (\x y -> (x + y)) 0 xs

elemF :: Eq a => a -> [a] -> Bool
elemF y = foldr (\x r -> if (x == y) then True else r) False

concatF :: [a] -> [a] -> [a]
concatF ys xs = foldr (\x r -> (x:r)) xs ys

filterF :: (a -> Bool) -> [a] -> [a]
filterF f = foldr (\x r -> if (not(f x)) then r else x:r) []

mapF :: (a -> b) -> [a] -> [b]
mapF f = foldr (\x r -> (f x):r) []

-- Ej 12
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x:xs) = f x xs (recr f z xs)

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna x xs = recr (\y ys r -> if (x == y)
                                then ys
                                else (y:r))
                []
                xs

-- b
-- Folder no es adecuado pues


-- c

