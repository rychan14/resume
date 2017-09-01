module Styles exposing (..)

import Html
import Html.Attributes
import Murmur3 exposing (hashString)
import String exposing (concat, cons, join)
import Types exposing (..)

hash value =
  value 
    |> hashString 1234
    |> toString

selector : Selector id cls -> Props -> String
selector selector ruleProps =
  case selector of 
    Type element -> element
    Id id -> id 
      |> toString 
      |> cons '#'
    Class cls -> cls 
      |> toString 
      |> cons '-'
      |> String.append (hash (props ruleProps))
      |> cons '.'

props : Props -> String 
props =
  concat << List.map (\(key, value) -> concat [ key, ":", value, ";" ])

rule : Rule id cls -> String
rule rule =
  concat 
    [ join "," (List.map2 selector rule.selectors [rule.props])
    , "{"
    , props rule.props
    , "}"
    ]

styleRecord : List (Rule id cls) -> StyleRecord id cls msg
styleRecord rules =
  { node = 
    List.map rule rules
      |> concat
      |> Html.text
  , id = Html.Attributes.id << toString
  , class =
    toString 
      >> String.append (toString (Debug.log "value" rules))
--      >> String.append (join "," (List.map (\rule -> concat (List.map2 selector rule.selectors [rule.props])) rules))
      >> Html.Attributes.class
  }

styles : StyleRecord id cls msg -> Html.Html msg 
styles styleRecord =
  Html.node "style" [] [ styleRecord.node ]
