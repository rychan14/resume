module Styles exposing (..)

import Html
import Html.Attributes
import VirtualDom exposing (Node, Property)
import Murmur3 exposing (hashString)
import String exposing (concat, cons, join)
import Types exposing (..)

hash value =
  value 
    |> toString
    |> hashString 1234
    |> toString

createCssRules rules =
  concat
    [ "{"
    , concat ( List.map ( \(key, value) -> concat [ key, ":", value, ";"] ) rules )
    , "}"
    ]

styled : 
    (List (Property msg) -> List (Node msg) -> Node msg) 
    -> List (String, String)
    -> List (Property msg) 
    -> List (Node msg) 
    -> Node msg
styled node rules properties children = 
  let
      className = "class" ++ "-" ++ (hash rules)
      classNameProperty = Html.Attributes.class className
      nodeWithClassName = node (classNameProperty :: properties) children
  in
      let
          css = 
            "."
            ++ className 
            ++ createCssRules rules

          styleNode =
            Html.node "style" [] [ Html.text css ]
      in
          -- [ nodeWithClassName, Html.node "style" [] [ Html.text css ] ]
          nodeWithClassName
