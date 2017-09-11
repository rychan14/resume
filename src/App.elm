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
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Dict
import Maybe
import Keyboard
import Task
import Window
import Animation
import Color exposing (rgb)
import Colors exposing (..)

(=>) : a -> b -> (a, b)
(=>) = (,)

type alias Model =
  { code : Int
  , height : Int
  , width : Int
  , theme : String
  , style : Animation.State
  }

type Msg 
  = KeyMsg Keyboard.KeyCode
  | ResizeMsg {height: Int, width: Int}
  | ThemeMsg String
  | AnimateMsg Animation.Msg

type ThemingMsg 
  = Primary
  | Secondary
  | Tertiary
  | Title
  | Text


getInitialWindowDimensions : Cmd Msg
getInitialWindowDimensions =
  Task.perform ResizeMsg Window.size

init : ( Model, Cmd Msg )
init = 
  ( { code = 0
    , height = 0
    , width = 0
    , theme = "theme1"
    , style =
      Animation.style
        [ Animation.backgroundColor (rgb 255 255 255)
        ] 
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
      ( { model | height = height, width = width}
      , Cmd.none
      )
    ThemeMsg theme ->
      ( { model | 
          theme = theme,
          style = Animation.interrupt
            [ Animation.to
              [ Animation.backgroundColor (if theme == "light" then rgb 255 255 255 else rgb 27 43 52)
              ]
            ]
            model.style
        }
      , Cmd.none
      )
    AnimateMsg msg ->
      ( { model | style = Animation.update msg model.style }
      , Cmd.none
      )

subscriptions : Model -> Sub Msg
subscriptions model = 
  Sub.batch
    [ Keyboard.downs KeyMsg
    , Window.resizes ResizeMsg
    , Animation.subscription AnimateMsg [ model.style ]
    ]

main =
  Html.program 
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions 
    }




-- HELPERS

bigOrSmall model list1 list2 =
  if model.width > 1100 then
    list1
  else 
    list2

theming : Model -> ThemingMsg -> String
theming model msg =
  case msg of 
    Primary ->
      .primary <| Maybe.withDefault defaultTheme <| Dict.get model.theme themes
    Secondary ->
      .secondary <| Maybe.withDefault defaultTheme <| Dict.get model.theme themes
    Tertiary ->
      .tertiary <| Maybe.withDefault defaultTheme <| Dict.get model.theme themes
    Title ->
      .title <| Maybe.withDefault defaultTheme <| Dict.get model.theme themes
    Text ->
      .text <| Maybe.withDefault defaultTheme <| Dict.get model.theme themes

buttonTheming : String -> ThemingMsg -> String
buttonTheming themeType msg =
  case msg of 
    Primary ->
      .primary <| Maybe.withDefault defaultTheme <| Dict.get (String.toLower themeType) themes
    Secondary ->
      .secondary <| Maybe.withDefault defaultTheme <| Dict.get (String.toLower themeType) themes
    Tertiary ->
      .tertiary <| Maybe.withDefault defaultTheme <| Dict.get (String.toLower themeType) themes
    Title ->
      .title <| Maybe.withDefault defaultTheme <| Dict.get (String.toLower themeType) themes
    Text ->
      .text <| Maybe.withDefault defaultTheme <| Dict.get themeType themes


-- VIEW

view model =
  div 
    (bigOrSmall model 
      ( Animation.render model.style
      ++  [ style
            [ ("color" => (theming model Text))
            , ("font-family" => "Verdana")
            , ("display" => "grid")
            , ("grid-template-columns" => "15% minmax(auto, 800px)")
            , ("min-height" => "100vh")
            , ("padding" => "20px")
            ]
          ]
      )
      ( List.concat
        [ Animation.render model.style
        , [ style
            [ ("color" => (theming model Text))
            , ("font-family" => "Verdana")
            , ("min-height" => "100vh")
            , ("padding" => "5px")
            ]
          ]
        ]
      )
    )
    (bigOrSmall model 
      [ leftBar model
      , resumeView model
      ] 
      [ resumeView model
      ]
    )

leftBar model =
  div 
    [ style 
      [ ("border-right" => "1px solid ")
      , ("border-color" => (theming model Tertiary))
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
    , experienceSection model 
    , expertiseSection model
    , educationSection model
    , buttonContainer model
    ]

contactInfo =
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


nameSection model =
  section []
    [ h1 [ style name ]
      [ text "Ryan Chan" ]
    , ( bigOrSmall model (text "") contactInfo)
    ]

experienceSection model =
  section []
    [ h2 [ style << sectionTitle <| model ]
      [ text "Experience"
      ]
    , ul []
      [ li [ style noBullet ]
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
      , li [ style noBullet ]
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

expertiseSection model =
  section []
    [ h2 [ style << sectionTitle <| model ]
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

educationSection model =
  section []
    [ h2 [ style << sectionTitle <| model ]
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

buttonContainer model =
  div 
    [ style buttonContainerStyle ]
    [ themeButton "Light"
    , themeButton "Dark"
    ]

themeButton themeType =
  div 
    [ style <| buttonStyle themeType
    , onClick << ThemeMsg <| String.toLower <| themeType
    ]
    [ text themeType ]







-- STYLES
concatStyles styles =
  style (List.concat styles)

boldText =
  [ ("font-weight" => "bold")
  ]

noBullet =
  [ ("list-style" => "none")
  ]

bulletPoint =
  [ ("list-style" => "circle")
  , ("line-height" => "24px")
  , ("letter-spacing" => "0")
  , ("margin-left" => "25px")
  ]

sectionTitle model =
  [ ("color" => (theming model Title))
  , ("font-size" => "25px")
  , ("line-height" => "48px")
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
  [ ("font-size" => "56px")
  , ("line-height" => "1.35")
  , ("letter-spacing" => "-.02em")
  , ("margin" => "0 0 24px 0")
  ] 
  
buttonContainerStyle =
  [ ("display" => "grid")
  , ("grid-template-columns" => "min-content min-content")
  , ("grid-column-gap" => "20px")
  , ("margin-top" => "15px")
  ]

buttonStyle themeType =
  [ ("background-color" => (buttonTheming themeType Primary))
  , ("border" => "1px solid")
  , ("border-color" => (buttonTheming themeType Title))
  , ("border-radius" => "3px")
  , ("color" => (buttonTheming themeType Title))
  , ("cursor" => "pointer")
  , ("display" => "inline-block")
  , ("padding" => "5px 10px")
  ]
