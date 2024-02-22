sumarLista :: [Int] -> Int
sumarLista [] = 0             
sumarLista (x:xs) = x + sumarLista xs

main :: IO ()
main = do
    let lista = [1, 2, 3, 4, 5]
    putStrLn $ "Lista: " ++ show lista
    putStrLn $ "Suma de elementos: " ++ show (sumarLista lista)
