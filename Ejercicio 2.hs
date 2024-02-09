aplicarALista :: (a -> b) -> [a] -> [b]
aplicarALista f xs = map f xs

duplicar :: Int -> Int
duplicar x = x * 2

cuadrado :: Int -> Int
cuadrado x = x ^ 2

main :: IO ()
main = do
    let numeros = [1, 2, 3, 4, 5]
    putStrLn "Lista original:"
    print numeros
    
    let numerosDuplicados = aplicarALista duplicar numeros
    putStrLn "Lista después de duplicar cada elemento:"
    print numerosDuplicados
    
    let numerosCuadrados = aplicarALista cuadrado numeros
    putStrLn "Lista después de calcular el cuadrado de cada elemento:"
    print numerosCuadrados
