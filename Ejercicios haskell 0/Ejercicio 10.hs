esPalindromo :: String -> Bool
esPalindromo s = s == reverse s 

main :: IO ()
main = do
    let cadena1 = "anitalavalatina"
        cadena2 = "oso"
        cadena3 = "hola"
    putStrLn $ cadena1 ++ " ¿es palíndromo? " ++ show (esPalindromo cadena1)
    putStrLn $ cadena2 ++ " ¿es palíndromo? " ++ show (esPalindromo cadena2)
    putStrLn $ cadena3 ++ " ¿es palíndromo? " ++ show (esPalindromo cadena3)