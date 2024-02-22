filtrarPares :: [Int] -> [Int]
filtrarPares [] = []                         
filtrarPares (x:xs)
    | even x    = x : filtrarPares xs
    | otherwise = filtrarPares xs  

main :: IO ()
main = do
    let lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    putStrLn $ "Lista original: " ++ show lista
    putStrLn $ "Lista filtrada (pares): " ++ show (filtrarPares lista)