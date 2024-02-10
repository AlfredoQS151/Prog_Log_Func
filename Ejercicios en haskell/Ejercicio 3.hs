import Data.List (nub)
import Data.Char (isSpace, isPunctuation, toLower) -- Corrección aquí

limpiarPuntuacion :: String -> String
limpiarPuntuacion = filter (\c -> not (isPunctuation c) || c == '\'')

dividirEnPalabras :: String -> [String]
dividirEnPalabras = words . limpiarPuntuacion . map toLower

palabrasYLongitud :: String -> [(String, Int)]
palabrasYLongitud frase = [(palabra, length palabra) | palabra <- nub (dividirEnPalabras frase)]

main :: IO ()
main = do
    let frase = "Este es un ejemplo, un simple ejemplo."
    putStrLn "Frase:"
    putStrLn frase
    putStrLn "Diccionario de palabras y longitudes:"
    print (palabrasYLongitud frase)