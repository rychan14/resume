module Styles exposing (..)

import Color exposing (rgba)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Types exposing (..)
import Resume.Styles exposing (..)

stylesheet : StyleSheet Styles variation
stylesheet =
  Style.stylesheet
    ( List.concat [
      [ style None []
      , style Main []
      , Resume.Styles.styles
      ]
    ] )
