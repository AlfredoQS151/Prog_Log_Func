import qualified Data.Map as Map

-- Función que convierte una calificación a su descripción correspondiente
convertToGradeDescription :: Double -> String
convertToGradeDescription grade
    | grade >= 95   = "Excelente"
    | grade >= 85   = "Notable"
    | grade >= 75   = "Bueno"
    | grade >= 70   = "Suficiente"
    | otherwise     = "Desempeño insuficiente"

-- Función que recibe un diccionario de asignaturas y calificaciones y devuelve otro diccionario con las asignaturas en mayúsculas y las calificaciones correspondientes a las notas aprobadas
filterAndConvertGrades :: Map.Map String Double -> Map.Map String String
filterAndConvertGrades = Map.map convertToGradeDescription . Map.filter (\x -> x >= 70)

-- Ejemplo de uso
main :: IO ()
main = do
    let grades = Map.fromList [("Matemáticas", 85), ("Física", 65), ("Historia", 95), ("Literatura", 60)]
    putStrLn "Diccionario de asignaturas y calificaciones:"
    print grades
    putStrLn "Diccionario de asignaturas en mayúsculas y calificaciones aprobadas:"
    print (filterAndConvertGrades grades)
