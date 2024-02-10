import System.IO

numeroAPalabra :: Int -> String
numeroAPalabra n
  | n < 20 = ["Cero", "Uno", "Dos", "Tres", "Cuatro", "Cinco", "Seis", "Siete", "Ocho", "Nueve", "Diez",
              "Once", "Doce", "Trece", "Catorce", "Quince", "Dieciséis", "Diecisiete", "Dieciocho", "Diecinueve"] !! n
  | n < 100 = let decenas = ["Veinte", "Treinta", "Cuarenta", "Cincuenta", "Sesenta", "Setenta", "Ochenta", "Noventa"]
              in decenas !! (n `div` 10 - 2) ++ if n `mod` 10 /= 0 then " y " ++ numeroAPalabra (n `mod` 10) else ""
  | n == 100 = "Cien"
  | otherwise = "Fuera de rango"

fizzBuzzAlternativo :: Int -> String
fizzBuzzAlternativo n = case (n `mod` 3 == 0, n `mod` 5 == 0) of
  (True, False) -> "Fizz!"
  (False, True) -> "Buzz!"
  (True, True) -> "FizzBuzz!"
  _ -> numeroAPalabra n

main :: IO ()
main = do
  putStrLn "Inserta un numero del 0 al 100:"
  numString <- getLine
  let num = read numString :: Int -- Convertir la entrada a Int
  putStrLn (fizzBuzzAlternativo num)
