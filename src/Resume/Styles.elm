module Resume.Styles exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, li)
import Css.Namespace exposing (namespace)

type CssClasses
  = NavBar

type CssIds
  = Page

styles =
  [ ( stylesheet << namespace "resume" )
  ]
