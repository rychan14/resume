port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)
import Styles.Styles exposing (styles)

port files : CssFileStructure -> Cmd msg

fileStructure : CssFileStructure
fileStructure =
  Css.File.toFileStructure
    [ ( "build/index.css", Css.File.compile styles )
    ]

main : CssCompilerProgram
main =
  Css.File.compiler files fileStructure