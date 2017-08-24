module Resume.View exposing (view)

import Html
import Element exposing (..)
import Element.Attributes exposing (..)
import Resume.Types as StyleTypes exposing (..)

view _ =
  column None
    []
    ( List.concat
      [ experienceSection
      , skillsSection
      , educationSection
      ]
    )

experienceSection =
  [ section <| column None []
    [ node "h2" <| el SectionTitle [] (text "Experience")
    , column None []
      [ node "h3" <| paragraph None [] 
        [ (text "Mirum Agency, ")
        , (text "San Diego -- ")
        , (text "Web Developer")
        ]
      , paragraph None []
        [ (text "August 2015 - Present")
        ]
      , paragraph None []
        [ (text "description")
        ]
      ]
    , column None []
      [ node "h3" <| paragraph None [] 
        [ (text "BofI Federal Bank, ")
        , (text "San Diego -- ")
        , (text "Web Developer")
        ]
      , paragraph None []
        [ (text "September 2014 - August 2015")
        ]
      , paragraph None []
        [ (text "description")
        ]
      ]
    ]
  ]

skillsSection =
  [ section <| column None []
    [ node "h2" <| el None [] (text "Skills")
    ]
  ]

educationSection =
  [ section <| column None []
    [ node "h2" <| el None [] (text "Education")
    ]
  ]
