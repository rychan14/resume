module App exposing (..)

import Html exposing (div)
import Html.Attributes
import Keyboard
import String exposing (concat, cons, join)
import Styles exposing (..)
import Types exposing (..)
import Components exposing (..)
import Header.View as Header exposing (view)
import Header.Styles exposing (..)
import Resume.View as Resume exposing (view)
import Resume.Styles exposing (..)

init : ( Model, Cmd Msg )
init = (0, Cmd.none)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of 
    KeyMsg code -> (code, Cmd.none)

styleNodes = 
  [ headerStyleNode
  , resumeStyleNode
  , componentsStyleNode
  ]

viewNodes model =
  [ ( Resume.view model )
  ]

view model =
  div []
    ( List.concat 
      [ styleNodes
      , viewNodes model
      ]
    )

subscriptions : Model -> Sub Msg
subscriptions model = 
  Sub.batch
    [ Keyboard.downs KeyMsg
    ]

main =
  Html.program 
    { init = init 
    , update = update
    , view = view
    , subscriptions = subscriptions 
    }
