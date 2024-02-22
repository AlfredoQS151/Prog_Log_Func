divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], n `mod` x == 0]

main :: IO ()
main = do
    let numero = 12
    putStrLn $ "Divisores de " ++ show numero ++ ": " ++ show (divisores numero)