module Components exposing (..)

import Html
  exposing 
  ( a
  , text
  )
import Html.Attributes
import Types exposing (..)
import Styles exposing (..)
import Colors exposing (themes)

type Class
  = Button

buttonStyles =
  [ { selectors = [ Class Button ]
    , props =
      [ ("border" , "3px solid" ++ themes.primary)
      , ("border-radius", "3px")
      , ("color" , themes.primary)
      , ("display", "inline-block")
      , ("margin", "0 5px")
      , ("padding" , "20px 40px")
      , ("text-decoration" , "none")
      ]
    }
  ]

button attributes url innerContent =
  a 
    ( List.append 
      [ Html.Attributes.href url
      ]
      attributes
    )
    innerContent
