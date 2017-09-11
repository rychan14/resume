module Colors exposing (..)

import Dict
import Color exposing (rgb)

colors =
  { orange = "rgb(255, 165, 0)"
  , black = "rgb(0, 0, 0)"
  , marine = "rgb(27, 43, 52)"
  , white = "rgb(255, 255, 255)"
  , yellow = "rgb(250, 200, 99)"
  , blue = "rgb(155, 194, 207)"
  , red = "rgb(236, 95, 103)"
  }

defaultTheme =
  { primary = colors.white
  , secondary = colors.marine
  , tertiary = colors.orange
  , text = colors.marine
  , title = colors.blue
  }

themes =
  Dict.fromList
    [ ( "light"
      , { primary = colors.white
        , secondary = colors.marine
        , tertiary = colors.orange
        , text = colors.marine
        , title = colors.blue
        }
      ) 
    , ( "dark"
      , { primary = colors.marine
        , secondary = colors.orange
        , tertiary = colors.yellow
        , text = colors.white
        , title = colors.red
        }
      )
    ]
