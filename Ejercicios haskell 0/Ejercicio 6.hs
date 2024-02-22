duplicarElementos :: [Int] -> [Int]
duplicarElementos [] = []             
duplicarElementos (x:xs) = x : x : duplicarElementos xs  

main :: IO ()
main = do
    let lista = [1, 2, 3, 4, 5]
    putStrLn $ "Lista original: " ++ show lista
    putStrLn $ "Lista con elementos duplicados: " ++ show (duplicarElementos lista)