module Types exposing (..)

import Html
import Html.Attributes
import Keyboard

type Selector id cls
  = Type String
  | Id id
  | Class cls

type alias Props
  = List (String, String)

type alias Rule id cls =
  { selectors : List (Selector id cls)
  , props : Props
  }

type alias StyleRecord id cls msg = 
  { node : Html.Html msg
  , id : id -> Html.Attribute msg
  , class : cls -> Html.Attribute msg
  }

type alias Model =
  { code: Int
  , css: String
  }

type alias Css =
  String

type Msg 
  = KeyMsg Keyboard.KeyCode
  | CssMsg Css
