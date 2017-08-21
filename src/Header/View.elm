module Header.View exposing (view)

import Html
  exposing 
  ( Html
  , Attribute
  , div
  , h1
  , p
  , span
  , br
  , strong
  , text
  )

import Html.Attributes exposing (style)

headerStyle =
  style []

headingStyle : Attribute msg
headingStyle =
  style 
    [ ("margin-bottom", "0")
    ]

descriptionStyle =
  style []

contactStyle =
  style []

contactLineStyle =
  style 
    [ ("display", "block") 
    ]

view : model -> Html msg
view model =
  div [ headerStyle ]
    [ div [] 
      [ h1 [ headingStyle ] 
        [ text "Ryan Chan" ]
      , p [ descriptionStyle ] 
        [ text "I am a dev by trade and an audio geek" ]
      ]
    , p [ contactStyle ] 
      [ span [ contactLineStyle ]
        [ text "Currently residing in" ]
      , strong [ contactLineStyle ]
        [ text "Spokane, WA 99208" ]
      , span [ contactLineStyle ] 
        [ text "Email me at" ]
      , strong [ contactLineStyle ]
        [ text "rychan14@gmail.com" ]
      ]
    ]
