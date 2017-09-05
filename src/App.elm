module App exposing (..)

import Html
  exposing 
  ( div
  , h1
  , h2
  , h3
  , li
  , p
  , span
  , strong
  , section
  , text
  , ul
  )
import Keyboard
import Task
import Window
import Material
import Material.Scheme
import Html.Attributes exposing (style)
import Colors exposing (themes)

(=>) : a -> b -> (a, b)
(=>) = (,)

type alias Mdl
  = Material.Model

type alias Model =
  { code : Int
  , mdl: Material.Model
  , height : Int
  , width : Int
  , color: String
  }

type Msg 
  = KeyMsg Keyboard.KeyCode
  | ResizeMsg {height: Int, width: Int}
  | ColorMsg String
  | Mdl (Material.Msg Msg)

getInitialWindowDimensions : Cmd Msg
getInitialWindowDimensions =
  Task.perform ResizeMsg Window.size

init : ( Model, Cmd Msg )
init = 
  ( { code = 0
    , mdl = Material.model
    , height = 0
    , width = 0
    , color = "default"
    }
  , getInitialWindowDimensions
  )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of 
    KeyMsg code -> 
      ( { model | code = code }
      , Cmd.none
      )
    ResizeMsg { height, width } ->
      ({ model | height = height, width = width}
      , Cmd.none
      )
    ColorMsg color ->
      ({ model | color = color}
      , Cmd.none
      )
    Mdl msg_ ->
      Material.update Mdl msg_ model

subscriptions : Model -> Sub Msg
subscriptions model = 
  Sub.batch
    [ Keyboard.downs KeyMsg
    , Window.resizes ResizeMsg
    ]

main =
  Html.program 
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions 
    }






-- VIEW
view model =
  div 
    (bigOrSmall model 
      [ style
        [ ("background-color" => themes.primary)
        , ("color" => themes.text)
        , ("min-height" => "100vh")
        , ("font-family" => "Verdana")
        , ("display" => "grid")
        , ("grid-template-columns" => "15% minmax(auto, 800px)")
        ]
      ] 
      [ style
        [ ("background-color" => themes.primary)
        , ("color" => themes.text)
        , ("min-height" => "100vh")
        , ("font-family" => "Verdana")
        ]
      ]
    )
    (bigOrSmall model 
      [ leftBar model
      , resumeView model
      ] 
      [ resumeView model
      ]
    )
    |> Material.Scheme.top

bigOrSmall model list1 list2 =
  if model.width > 900 then
    list1
  else 
    list2

leftBar model =
  div 
    [ style 
      [ ("border-right" => String.append "1px solid " themes.secondary )
      , ("display" => "flex")
      , ("justify-content" => "center")
      , ("padding" => "35px 8px")
      , ("overflow-wrap" => "break-word")
      ]
    ]
    [ div 
      [ style 
        [ ("display" => "flex")
        , ("flex-flow" => "column")
        , ("max-width" => "100%")
        ]
      ]
      [ span [ style inlineBlock ]
        [ text "Currently residing in" ]
      , strong [ concatStyles [ inlineBlock, boldText ] ]
        [ text "Spokane, WA 99208" ]
      , span [ style inlineBlock ]
        [ text "Email me at" ]
      , strong [ concatStyles [ inlineBlock, boldText ] ]
        [ text "rychan14@gmail.com" ]
      ]
    ]

resumeView model =
  div 
    [ style 
      [ ("font-size" => "14px")
      , ("padding" => "0 30px")
      ] 
    ]
    [ nameSection model
    , experienceSection
    , expertiseSection
    , educationSection
    ]

nameSection model =
  section [ style name ]
    [ h1 []
      [ text "Ryan Chan" ]
    , ( if model.width < 900 then
        div []
          [ p []
            [ span [ style block ]
              [ text "Currently residing in "
              , strong [ concatStyles [ inlineBlock, boldText ] ]
                [ text "Spokane, WA 99208" ]
              ]
            , span [ style block ]
              [ text "Email me at " 
              , strong [ concatStyles [ inlineBlock, boldText ] ]
                [ text "rychan14@gmail.com" ]
              ]
            ]
          ]
        else
          text ""
      )
    ]

experienceSection =
  section []
    [ h2 [ style sectionTitle ]
      [ text "Experience"
      ]
    , ul []
      [ li []
        [ span [ style [("font-weight" => "bold")] ] 
          [ text "Mirum Agency, " ]
        , span []
          [ text "San Diego -- " ]
        , span [ style [("font-style" => "italic")] ]
          [ text "Web Developer" ]
        , p [] 
          [ text "August 2015 - Present" 
          , ul [ style bulletPoint ]
            [ li []
              [ text "Working with various major clients as a Front-end JavaScript developer"
              ]
            , li [] 
              [ text "Rebuilt frontend of Qualcomm.com using ReactJS and Redux"
              ]
            , li []
              [ text "Built frontend for MazdaUSA.com using custom JavaScript framework"
              ]
            ]
          ]
        ]
      , li []
        [ span [ style [("font-weight" => "bold")] ] 
          [ text "BofI Federal Bank, " ]
        , span []
          [ text "San Diego -- " ]
        , span [ style [("font-style" => "italic")] ]
          [ text "Web Developer" ]
        , p [] 
          [ text "September 2014 - August 2015"
          , ul [ style bulletPoint ]
            [ li []
              [ text "Migrated 100s of pages of web content from Sitefinity CMS to DNN"
              ]
            , li []
              [ text "Worked mostly with jQuery, JavaScript, HTML, and CSS to rebuild UI"
              ]
            , li []
              [ text "Built Python scripts to extract and migrate web content, using Scrapy"
              ]
            , li []
              [ text "Assisted in production deployments and SQL database merges"
              ]
            , li []
              [ text "Managed Dev, QA, Stage, and Production environments"
              ]
            ]
          ]
        ]
      ]
    ]

expertiseSection =
  section []
    [ h2 [ style sectionTitle ]
      [ text "Expertise"
      ]
    , ul [ style bulletPoint ]
      [ li []
        [ text "In-depth experience with JavaScript, specifically with ES2015-2017, ReactJS, and SASS"
        ]
      , li []
        [ text "Extensive knowledge of CSS, including SASS, CSS animations, media queries, flexbox and grid layouts"
        ]
      , li []
        [ text "Accustomed to developing in the Agile workflow with daily scrums and sprints and working in cross-functional teams in highly collaborative environments"
        ]
      , li []
        [ text "Tools such as Git and BitBucket for source control management"
        ]
      , li []
        [ text "Debugging and cross browser testing"
        ]
      ]
    ]

educationSection =
  section []
    [ h2 [ style sectionTitle ]
      [ text "Education"
      ]
    , span [ style boldText ] 
      [ text "University of California, San Diego" 
      ]
    , ul [ style bulletPoint ]
      [ li []
        [ text "Cognitive Science, with specialization in Computation; B.S" ]
      ]
    ]




-- STYLES
concatStyles styles =
  style (List.concat styles)

boldText =
  [ ("font-weight" => "bold")
  ]

bulletPoint =
  [ ("list-style" => "circle")
  , ("margin-left" => "25px")
  ]

sectionTitle =
  [ ("color" => themes.title)
  , ("font-size" => "25px")
  , ("margin" => "0px")
  ]

inlineBlock =
  [ ("display" => "inline-block")
  ]

block =
  [ ("display" => "block")
  ]

centerBlock =
  [ ("margin" => "0 auto")
  ]

overflowEllip =
  [ ("overflow" => "hidden")
  , ("text-overflow" => "ellipsis")
  , ("white-space" => "nowrap")
  ]

name =
  [ ("font-size" => "28px")
  ]
