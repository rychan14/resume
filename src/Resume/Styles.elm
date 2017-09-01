module Resume.Styles exposing (..)

import Styles exposing (..)
import Types exposing (..)

type Class
  = SectionTitle
  | ResumeWrapper

resumeStyles =
  [ { selectors = [ Class SectionTitle ]
    , props = 
      [ ("font-family", "Verdana")
      , ("color", "#333")
      ]
    } 
  ]

styleRecord =
  Styles.styleRecord resumeStyles

resumeStyleNode =
  Styles.styles styleRecord

