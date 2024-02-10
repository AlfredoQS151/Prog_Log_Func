import Data.Char (toUpper)

type Asignatura = String
type Nota = Int
type Calificacion = String
type Registro = [(Asignatura, Nota)]

notaACalificacion :: Nota -> Calificacion
notaACalificacion nota
    | nota >= 95 = "Excelente"
    | nota >= 85 = "Notable"
    | nota >= 75 = "Bueno"
    | nota >= 70 = "Suficiente"
    | otherwise = "Insuficiente"

procesarNotas :: Registro -> [(Asignatura, Calificacion)]
procesarNotas registro = [(map toUpper asignatura, notaACalificacion nota) | (asignatura, nota) <- registro]

main :: IO ()
main = do
    let registro = [("Matematicas", 92), ("Historia", 78), ("Fisica", 67), ("Literatura", 80)]
    putStrLn "Registro original:"
    print registro
    putStrLn "Registro procesado con asignaturas en mayúsculas y calificaciones:"
    print (procesarNotas registro)
