module App exposing (..)

import Html exposing (div)
import Html.Attributes
import Keyboard
import String exposing (concat, cons, join)
import Styles exposing (..)
import Types exposing (..)
import Components exposing (..)
import Header.View as Header exposing (view)
import Resume.View as Resume exposing (view)

init : ( Model, Cmd Msg )
init = ( { code = 0
         , css = "" 
         }
       , Cmd.none
       )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of 
    KeyMsg code -> 
      ( { model | code = code }
      , Cmd.none
      )

    CssMsg css -> 
      ( { model | css = css }
      , Cmd.none
      )

view model =
  div []
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
