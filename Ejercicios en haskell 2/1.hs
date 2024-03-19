import Text.Printf

-- Funciones matemáticas
sinFunc :: Double -> Double
sinFunc x = sin x

cosFunc :: Double -> Double
cosFunc x = cos x

tanFunc :: Double -> Double
tanFunc x = tan x

expFunc :: Double -> Double
expFunc x = exp x

logFunc :: Double -> Double
logFunc x = log x

-- Función para imprimir una fila de la tabla
printRow :: Double -> (Double -> Double) -> Int -> IO ()
printRow value func index = printf "%d\t|\t%.6f\n" index (func value)

-- Función principal para la calculadora
scientificCalculator :: IO ()
scientificCalculator = do
    putStrLn "Seleccione la función a aplicar:"
    putStrLn "1. Seno"
    putStrLn "2. Coseno"
    putStrLn "3. Tangente"
    putStrLn "4. Exponencial"
    putStrLn "5. Logaritmo neperiano"
    putStrLn "Ingrese el número correspondiente a la función:"
    choice <- getLine
    putStrLn "Ingrese el valor:"
    valueStr <- getLine
    let value = read valueStr :: Double
    let selectedFunc = case choice of
                            "1" -> sinFunc
                            "2" -> cosFunc
                            "3" -> tanFunc
                            "4" -> expFunc
                            "5" -> logFunc
                            _   -> error "Opción inválida"
    putStrLn "Tabla de resultados:"
    putStrLn "Índice\t|\tResultado"
    mapM_ (\i -> printRow i selectedFunc (round i)) [1..value]

-- Función principal para ejecutar la calculadora
main :: IO ()
main = do
    putStrLn "Bienvenido a la calculadora científica"
    scientificCalculator
