-- Función que convierte una calificación a su descripción correspondiente
convertToGradeDescription :: Double -> String
convertToGradeDescription grade
    | grade >= 95   = "Excelente"
    | grade >= 85   = "Notable"
    | grade >= 75   = "Bueno"
    | grade >= 70   = "Suficiente"
    | otherwise     = "Desempeño insuficiente"

-- Función que recibe una lista de calificaciones y devuelve la lista de descripciones correspondientes
calificationsToGradeDescriptions :: [Double] -> [String]
calificationsToGradeDescriptions = map convertToGradeDescription

-- Ejemplo de uso
main :: IO ()
main = do
    let calificaciones = [85, 92, 78, 60, 45, 100]
    putStrLn "Lista de calificaciones:"
    print calificaciones
    putStrLn "Lista de descripciones de calificaciones correspondientes:"
    print (calificationsToGradeDescriptions calificaciones)
