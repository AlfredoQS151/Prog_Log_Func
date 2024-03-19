-- Función que convierte una calificación a una nota
convertToLetterGrade :: Double -> Char
convertToLetterGrade grade
    | grade >= 90  = 'A'
    | grade >= 80  = 'B'
    | grade >= 70  = 'C'
    | grade >= 60  = 'D'
    | otherwise    = 'F'

-- Función que recibe una lista de calificaciones y devuelve la lista de notas correspondientes
calificationsToLetterGrades :: [Double] -> [Char]
calificationsToLetterGrades = map convertToLetterGrade

-- Ejemplo de uso
main :: IO ()
main = do
    let calificaciones = [85, 92, 78, 60, 45]
    putStrLn "Lista de calificaciones:"
    print calificaciones
    putStrLn "Lista de notas correspondientes:"
    print (calificationsToLetterGrades calificaciones)
