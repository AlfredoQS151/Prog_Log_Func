numerosPares :: Int -> [Int]
numerosPares n = [x | x <- [0..n], even x]

main :: IO ()
main = do
    let limite = 10
    putStrLn $ "Lista de números pares hasta " ++ show limite ++ ": " ++ show (numerosPares limite)
