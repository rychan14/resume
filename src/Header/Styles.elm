module Header.Styles exposing (..)

import Types exposing (..)
import Styles exposing (styles, styleRecord)
import Colors exposing (themes)

type Class
  = Name
  | Wrapper
  | Button

headerStyles =
  [ { selectors = [ Class Name ]
    , props = 
      [ ("font-size" , "100px")
      , ("font-weight" , "bold")
      ]
    } 
  , { selectors = [ Class Wrapper ]
    , props = 
      [ ("align-items" , "center")
      , ("background-color" , themes.secondary)
      , ("color" , themes.primary)
      , ("display" , "flex")
      , ("font-family" , "Verdana")
      , ("height" , "80vh")
      , ("justify-content" , "center")
      , ("text-align" , "center")
      ]
    } 
  , { selectors = [ Class Button ]
    , props = 
      [ ("font-size" , "25px")
      ]
    } 
  ]

styleRecord =
  Styles.styleRecord headerStyles

headerStyleNode =
  Styles.styles styleRecord
