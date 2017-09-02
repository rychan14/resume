module Header.View exposing (view)

import Html
  exposing 
  ( div
  , h1
  , p
  , span
  , strong
  , section
  , text
  )
import Types exposing (..)
import Styles exposing (..)
-- import Components exposing (button)

view model =
  styled section 
      []
      []
      [ styled div
        []
        []
        [ text "hello" 
        ]
      ]
--       [ styled div 
--         []
--         [ styled h1 
--           []
--           [ text "RCHAN" ]
--             , button 
--               []
--               ("/")
--               [ text "DEV." ]
--             , button 
--               []
--               ("/")
--               [ text "AUDIO." ]
--             , p []
--               [ span []
--                 [ text "Currently residing in" ]
--               , strong []
--                 [ text "Spokane, WA 99208" ]
--               , span []
--                 [ text "Email me at" ]
--               , strong []
--                 [ text "rychan14@gmail.com" ]
--            ]
--          ]
--        ]
