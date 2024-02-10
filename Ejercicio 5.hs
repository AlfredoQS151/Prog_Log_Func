import Prelude

type Vector2D = (Float, Float)
type Vector3D = (Float, Float, Float)

moduloVector2D :: Vector2D -> Float
moduloVector2D (x, y) = sqrt (x^2 + y^2)

moduloVector3D :: Vector3D -> Float
moduloVector3D (x, y, z) = sqrt (x^2 + y^2 + z^2)

main :: IO ()
main = do

    let vector2D = (3, 4)
    putStrLn $ "El módulo del vector 2D " ++ show vector2D ++ " es " ++ show (moduloVector2D vector2D)

    let vector3D = (1, 2, 2)
    putStrLn $ "El módulo del vector 3D " ++ show vector3D ++ " es " ++ show (moduloVector3D vector3D)