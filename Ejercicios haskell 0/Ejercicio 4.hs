longitudCadena :: String -> Int
longitudCadena [] = 0         
longitudCadena (_:xs) = 1 + longitudCadena xs 

main :: IO ()
main = do
    let cadena = "Progamacion"
    putStrLn $ "Longitud de la cadena '" ++ cadena ++ "': " ++ show (longitudCadena cadena)