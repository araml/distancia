-- Ej 2
-- a
valorAbsoluto :: Float -> Float
valorAbsoluto x = if x < 0 then -x else x

-- b
bisiesto :: Int -> Bool
bisiesto y =  (mod y 400 == 0) || ((mod y 4 == 0) && (mod y 100 /= 0))

-- c
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- d
cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos a = length [ x | x <- [2..a], (esPrimo x) && (mod a x == 0)]

esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo p = [ x | x <- [2..p -1], mod p x == 0] == []

-- Ej 3
--
--
aEntero :: Either Int Bool -> Int
aEntero (Left x) = 1
aEntero (Right y) = 2
---- Ej 4
---- a
--limpiar :: String -> String -> String
--limpiar [] s = s
--limpiar x [] = []
--limpiar s (x:xs) = limpiar (removerCaracter s x) xs
--
--removerCaracter :: String -> Char -> String
--removerCaracter [] _ = []
--removerCaracter (y:ys) x = if (x == y)
--                           then removerCaracter ys x
--                           else y:(removerCaracter ys x)
--
--
--suma :: [Float] -> Float
--suma []     = 0
--suma (x:xs) = x + suma xs
--
--diff_promedio :: [Float] -> [Float]
--diff_promedio l = map (\x -> x - (suma l / fromIntegral (length l))) l
--
--todosIguales :: [Int] -> Bool
--todosIguales [] = True
--todosIguales (x:xs) = if length k > 0 then False else True
--                        where k = filter (/= x) xs
--
--
---- Ej 5
----
--data AB a = Nil | Bin (AB a) a (AB a)
--
---------------------------------------------------------------------------------
---- No es parte del ejercicio, se usa solo para imprimir el tree
--instance Show a => Show (AB a) where
--  show t = padAB t 0 0
--
---- Funciones auxiliares
--
--pad :: Int -> String
--pad i = replicate i ' '
--
--padAB :: Show a => AB a -> Int -> Int -> String
--padAB = foldAB (const $ const "")
--               (\ri x rd n base ->let l =
--                length $ show x in pad n ++ show x ++ ri 4 (base+l) ++
--                "\n" ++ rd (n+4+base+l) base)
--
--recAB :: b -> (AB a -> a -> AB a -> b -> b -> b) -> AB a -> b
--recAB z _ Nil = z
--recAB z f (Bin izq x der) = f izq x der recizq recder
--  where recizq = recAB z f izq
--        recder = recAB z f der
--
--foldAB :: b -> (b -> a -> b -> b) -> AB a -> b
--foldAB z f = recAB z (\_ n _ ri rd -> f ri n rd)
--
---------------------------------------------------------------------------------
--
--vacio :: AB a -> Bool
--vacio Nil = True
--vacio _   = False
--
--negacion :: AB Bool -> AB Bool
--negacion Nil = Nil
--negacion (Bin i v d) = (Bin (negacion i) (not v) (negacion d))
--
--producto :: AB Int -> Int
--producto Nil = 1
--producto (Bin i v d) = v * (producto i) * (producto d)
