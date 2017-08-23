module App exposing (..)

import Html
import Element exposing (..)
import Element.Attributes exposing (..)
import Header.View as Header exposing (view)
import Resume.View as Resume exposing (view)
import Styles exposing (stylesheet)
import Types exposing (..)
import Keyboard

type alias Model =
  Int

init : ( Model, Cmd Msg )
init = (0, Cmd.none)

type Msg 
  = KeyMsg Keyboard.KeyCode

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of 
    KeyMsg code -> (code, Cmd.none)

view model =
  Element.layout stylesheet <| 
    grid Main 
      { columns = [ fill 3, fill 1 ]
      , rows =
        [ px 200
        , px 200
        ]
      }
      []
      [ area
        { start = ( 0, 0 )
        , width = 1
        , height = 1
        }
        ( Resume.view model )
      ]

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

