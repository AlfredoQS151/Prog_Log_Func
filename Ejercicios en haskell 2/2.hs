-- Función que recibe una función booleana y una lista, y devuelve una lista con los elementos que devuelven True al aplicarles la función booleana
filterByBoolFunc :: (a -> Bool) -> [a] -> [a]
filterByBoolFunc _ [] = []
filterByBoolFunc f (x:xs)
    | f x       = x : filterByBoolFunc f xs
    | otherwise = filterByBoolFunc f xs

-- Ejemplo de uso
-- Supongamos que tenemos una función booleana isEven que devuelve True si un número es par
isEven :: Int -> Bool
isEven n = n `mod` 2 == 0

-- Usamos filterByBoolFunc para filtrar los números pares de una lista
main :: IO ()
main = do
    let lista = [1,2,3,4,5,6,7,8,9,10]
    putStrLn "Lista original:"
    print lista
    putStrLn "Lista filtrada (números pares):"
    print (filterByBoolFunc isEven lista)
