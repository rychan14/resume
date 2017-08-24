module Styles exposing (..)

import Color exposing (rgba)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
-- import Types exposing (Styles)
import Resume.Styles exposing (styles)

type Styles
  = None
  | Main
  | SectionTitle
  | Resume.Types.ResumeStyles

stylesheet : StyleSheet Styles variation
stylesheet =
  Style.stylesheet
    [ style None []
    , style Main []
    , Resume.Styles.styles
    ]
