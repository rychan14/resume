module Resume.Styles exposing (..)

import Color exposing (rgba)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Resume.Types exposing (..)

type Styles
  = SectionTitle

colors =
  { lightCyan = rgba 224 255 255 1
  }

styles =
  style SectionTitle 
    [ Color.text colors.lightCyan
    ]