data Inmueble = Inmueble { año :: Int
                         , metros :: Int
                         , habitaciones :: Int
                         , garaje :: Bool
                         , zona :: Char
                         , precio :: Float
                         } deriving (Show)

-- Función que calcula el precio de un inmueble en función de su zona y antigüedad
precioInmueble :: Inmueble -> Float
precioInmueble inmueble
    | zona inmueble == 'A' = fromIntegral (metros inmueble) * 1000 + fromIntegral (habitaciones inmueble) * 5000 + if garaje inmueble then 15000 else 0
    | zona inmueble == 'B' = (fromIntegral (metros inmueble) * 1000 + fromIntegral (habitaciones inmueble) * 5000 + if garaje inmueble then 15000 else 0) * 1.5
    | otherwise            = error "Zona no válida"

-- Función que filtra los inmuebles en función de un presupuesto dado
buscarInmueblesPorPresupuesto :: [Inmueble] -> Float -> [Inmueble]
buscarInmueblesPorPresupuesto inmuebles presupuesto = filter (\x -> precioInmueble x <= presupuesto) inmuebles

-- Ejemplo de uso
main :: IO ()
main = do
    let inmuebles = [ Inmueble { año = 2000, metros = 100, habitaciones = 3, garaje = True, zona = 'A', precio = 0 }
                    , Inmueble { año = 2012, metros = 60, habitaciones = 2, garaje = True, zona = 'B', precio = 0 }
                    , Inmueble { año = 1980, metros = 120, habitaciones = 4, garaje = False, zona = 'A', precio = 0 }
                    , Inmueble { año = 2005, metros = 75, habitaciones = 3, garaje = True, zona = 'B', precio = 0 }
                    , Inmueble { año = 2015, metros = 90, habitaciones = 2, garaje = False, zona = 'A', precio = 0 }
                    ]
    let presupuesto = 100000 -- Supongamos que el presupuesto es 100000
    let inmueblesFiltrados = buscarInmueblesPorPresupuesto inmuebles presupuesto
    putStrLn "Inmuebles encontrados:"
    print inmueblesFiltrados
