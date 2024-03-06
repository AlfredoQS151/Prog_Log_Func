{-# LANGUAGE OverloadedStrings #-}
import Monomer

-- Definición del modelo para manejar el estado de la aplicación.
data AppModel = AppModel {
  counter :: Int
}

-- Creación de un evento para manejar los clics del botón.
data AppEvent = ButtonClicked

-- Función principal que inicializa la aplicación.
main :: IO ()
main = startApp model handleEvent buildUI config
  where
    model = AppModel 0
    config = [appWindowTitle "Counter App", appTheme darkTheme]

-- Función que maneja los eventos de la aplicación.
handleEvent :: AppEvent -> AppModel -> AppModel
handleEvent ButtonClicked model = model { counter = counter model + 1 }

-- Función que construye la interfaz de usuario.
buildUI :: AppModel -> Widget AppEvent
buildUI model = vstack [
    label ("Counter value: " <> show (counter model)),
    button "Click me!" ButtonClicked
  ]
