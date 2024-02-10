import Data.List

media :: [Float] -> Float
media xs = sum xs / fromIntegral (length xs)

desviacionEstandar :: [Float] -> Float
desviacionEstandar xs = sqrt $ sum (map (\x -> (x - m) ** 2) xs) / n
  where
    m = media xs
    n = fromIntegral (length xs)

puntuacionTipica :: Float -> [Float] -> Float
puntuacionTipica x xs = (x - media xs) / desviacionEstandar xs

valoresAtipicos :: [Float] -> [Float]
valoresAtipicos xs = filter (\x -> let z = puntuacionTipica x xs in z < -3 || z > 3) xs

main :: IO ()
main = do
    let muestra = [10, 12, 23, 23, 16, 23, 21, 16, 100]
    putStrLn "Muestra de números:"
    print muestra
    putStrLn "Valores atípicos en la muestra:"
    print (valoresAtipicos muestra)
