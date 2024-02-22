reversoLista :: [a] -> [a]
reversoLista [] = []                    
reversoLista (x:xs) = reversoLista xs ++ [x] 

main :: IO ()
main = do
    let lista = [1, 2, 3, 4, 5]
    putStrLn $ "Lista original: " ++ show lista
    putStrLn $ "Reverso de la lista: " ++ show (reversoLista lista)