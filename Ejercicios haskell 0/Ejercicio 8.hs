fibonacci :: Int -> Int
fibonacci n
    | n == 0 = 0      
    | n == 1 = 1             
    | otherwise = fibonacci (n - 1) + fibonacci (n - 2)  

main :: IO ()
main = do
    let n = 10
    putStrLn $ "El " ++ show n ++ "-ésimo número de Fibonacci es: " ++ show (fibonacci n)
