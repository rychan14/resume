module Resume.View exposing (view)

import Html
  exposing 
  ( Html
  , Attribute
  , div
  , h1
  , h2
  , h3
  , p
  , span
  , br
  , section
  , strong
  , text
  )
import Html.Attributes exposing (style)

resumeContainer =
  style []

sectionContainer = 
  style []

sectionHeading = 
  style []

sectionBlock =
  style []

sectionBlockHeading =
  style []

blockHeading =
  style []

blockHeadingBold =
  style []

blockHeadingItalic =
  style []

blockHeadingSecondary =
  style []

description =
  style
    []

view : model -> Html msg
view model =
  div [ resumeContainer ]
    [ section [ sectionContainer ]
      [ h2 [ sectionHeading ]
        [ text "Experience" ]
      , div [ sectionBlock ]
        [ h3 [ sectionBlockHeading ]
          [ span [ blockHeadingBold ]
            [ text "Mirum Agency, " ]
          , span [ blockHeading ]
            [ text "San Diego -- " ]
          , span [ blockHeadingItalic ]
            [ text "Web Developer" ]
          ]
        , p [ blockHeadingSecondary ]
          [ text "August 2015 - Present" ]
        , p [ description ]
          []
        ]
      , div [ sectionBlock ]
        [ h3 [ sectionBlockHeading ]
          [ span [ blockHeadingBold ]
            [ text "BofI Federal Bank, " ]
          , span [ blockHeading ]
            [ text "San Diego -- " ]
          , span [ blockHeadingItalic ]
            [ text "Web Developer" ]
          ]
        , p [ blockHeadingSecondary ]
          [ text "August 2015 - Present" ]
        , p [ description ]
          []
        ]
      ]
    , section [ sectionContainer ]
      [ h2 []
        [ text "Skills" ]
      ]
    , section [ sectionContainer ]
      [ h2 []
        [ text "Education" ]
      ]
    ]
