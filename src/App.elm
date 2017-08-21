module App exposing (..)

import Html
  exposing 
  ( Html
  , Attribute
  , article
  , text
  )
import Html.Attributes exposing (style)
import Header.View as Header exposing (view)
import Resume.View as Resume exposing (view)
import Keyboard

baseStyle : Attribute msg
baseStyle =
  style
    [ ("display", "grid")
    , ("font-family", "Verdana")
    , ("padding", "0 20px")
    ]

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

view : Model -> Html Msg
view model =
  article [ baseStyle ]
    [ Header.view model 
    , Resume.view model
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

