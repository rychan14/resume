module Resume.View exposing (view)

import Html 
  exposing 
    ( section
    , div
    , h2
    , h3
    , p
    , text
    )
import Html.Attributes
import Types exposing (..)
import Styles exposing (..)
import VirtualDom exposing (style)

view _ =
  styled 
    div 
      [ ("color", "red")
      , ("background-color", "black")
      ]
      [ Html.Attributes.title "black" ]
      [ text "hello" ]
--   div [ styleRecord.class ResumeWrapper ]
--     [ experienceSection
--     , skillsSection
--     , educationSection
--     ]

experienceSection =
  section []
    [ h2 [] 
      [ text "Experience"
      ]
    , div []
      [ h3 [] 
        [ text "Mirum Agency, "
        , text "San Diego -- "
        , text "Web Developer"
        ]
      , p []
        [ text "August 2015 - Present"
        ]
      , p []
        [ text "description"
        ]
      ]
    , div []
      [ h3 [] 
        [ text "BofI Federal Bank, "
        , text "San Diego -- "
        , text "Web Developer"
        ]
      , p []
        [ text "September 2014 - August 2015"
        ]
      , p []
        [ text "description"
        ]
      ]
    ]

skillsSection =
  section []
    [ h2 [] 
      [ text "Skills"
      ]
    ]

educationSection =
  section []
    [ h2 [] 
      [ text "Education"
      ]
    ]
