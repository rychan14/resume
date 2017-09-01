module Header.View exposing (view)

import Html
  exposing 
  ( Html
  , Attribute
  , div
  , h1
  , p
  , span
  , strong
  , section
  , text
  )
import Header.Styles exposing (..)
import Types exposing (..)
import Components exposing (button)

view : model -> Html msg
view model =
  section [ styleRecord.class Wrapper ]
    [ div []
      [ h1 [ styleRecord.class Name ]
        [ text "RCHAN" ]
      , button 
        [ styleRecord.class Button ]
        ("/")
        [ text "DEV." ]
      , button 
        [ styleRecord.class Button ]
        ("/")
        [ text "AUDIO." ]
      , p []
        [ span []
          [ text "Currently residing in" ]
        , strong []
          [ text "Spokane, WA 99208" ]
        , span []
          [ text "Email me at" ]
        , strong []
          [ text "rychan14@gmail.com" ]
        ]
      ]
    ]
