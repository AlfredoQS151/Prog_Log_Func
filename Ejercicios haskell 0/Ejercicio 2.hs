factorial :: Int -> Int
factorial 0 = 1              
factorial n = n * factorial (n - 1) 

main :: IO ()
main = do
    let numero = 5
    putStrLn $ "Factorial de " ++ show numero ++ " es: " ++ show (factorial numero)
