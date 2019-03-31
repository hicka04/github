//
//  Language.swift
//  github
//
//  Created by hicka04 on 2019/03/23.
//  Copyright © 2019 hicka04. All rights reserved.
//

import Foundation

public enum SearchLanguage: CaseIterable {
    case any
    case language(Language)
    
    public init(language: Language?) {
        guard let language = language else {
            self = .any
            return
        }
        self = .language(language)
    }
    
    public static var allCases: [SearchLanguage] {
        return [.any] + Language.allCases.map { SearchLanguage.language($0) }
    }
    
    public var title: String {
        switch self {
        case .any:
            return "Any"
        case .language(let language):
            return language.rawValue
        }
    }
    
    public var language: Language? {
        switch self {
        case .any:
            return nil
        case .language(let language):
            return language
        }
    }
    
    public var index: Int {
        guard let language = language else {
            return 0
        }
        
        return Language.allCases.firstIndex(of: language)! + 1
    }
}

public enum Language: String, CaseIterable {
    case ActionScript
    case C
    case CSharp = "C#"
    case CPlusPlus = "C++"
    case Clojure
    case CoffeeScript
    case CSS
    case Go
    case Haskell
    case HTML
    case Java
    case JavaScript
    case Lua
    case MATLAB
    case ObjectiveC = "Objective-C"
    case Perl
    case PHP
    case Python
    case R
    case Ruby
    case Scala
    case Shell
    case Swift
    case TeX
    case Vimscript = "Vim script"
    case ABAP
    case ABNF
    case Ada
    case AdobeFontMetrics = "Adobe Font Metrics"
    case Agda
    case AGSScript = "AGS Script"
    case Alloy
    case AlpineAbuild = "Alpine Abuild"
    case AMPL
    case AngelScript
    case AntBuildSystem = "Ant Build System"
    case ANTLR
    case ApacheConf
    case Apex
    case APIBlueprint = "API Blueprint"
    case APL
    case ApolloGuidanceComputer = "Apollo Guidance Computer"
    case AppleScript
    case Arc
    case AsciiDoc
    case ASN1 = "ASN.1"
    case ASP
    case AspectJ
    case Assembly
    case Asymptote
    case ATS
    case Augeas
    case AutoHotkey
    case AutoIt
    case Awk
    case Ballerina
    case Batchfile
    case Befunge
    case Bison
    case BitBake
    case Blade
    case BlitzBasic
    case BlitzMax
    case Bluespec
    case Boo
    case Brainfuck
    case Brightscript
    case Bro
    case CObjDump = "C-ObjDump"
    case C2hsHaskell = "C2hs Haskell"
    case CabalConfig = "Cabal Config"
    case CapnProto = "Cap'n Proto"
    case CartoCSS
    case Ceylon
    case Chapel
    case Charity
    case ChucK
    case Cirru
    case Clarion
    case Clean
    case Click
    case CLIPS
    case ClosureTemplates = "Closure Templates"
    case CloudFirestoreSecurityRules = "Cloud Firestore Security Rules"
    case CMake
    case COBOL
    case ColdFusion
    case ColdFusionCFC = "ColdFusion CFC"
    case COLLADA
    case CommonLisp = "Common Lisp"
    case CommonWorkflowLanguage = "Common Workflow Language"
    case ComponentPascal = "Component Pascal"
    case CoNLLU = "CoNLL-U"
    case Cool
    case Coq
    case CppObjDump = "Cpp-ObjDump"
    case Creole
    case Crystal
    case CSON
    case Csound
    case CsoundDocument = "Csound Document"
    case CsoundScore = "Csound Score"
    case CSV
    case Cuda
    case CWeb
    case Cycript
    case Cython
    case D
    case DObjDump = "D-ObjDump"
    case DarcsPatch = "Darcs Patch"
    case Dart
    case DataWeave
    case desktop
    case Diff
    case DIGITALCommandLanguage = "DIGITAL Command Language"
    case DM
    case DNSZone = "DNS Zone"
    case Dockerfile
    case Dogescript
    case DTrace
    case Dylan
    case E
    case Eagle
    case Easybuild
    case EBNF
    case eC
    case EcereProjects = "Ecere Projects"
    case ECL
    case ECLiPSe
    case EditorConfig
    case EdjeDataCollection = "Edje Data Collection"
    case edn
    case Eiffel
    case EJS
    case Elixir
    case Elm
    case EmacsLisp = "Emacs Lisp"
    case EmberScript
    case EML
    case EQ
    case Erlang
    case FSharp = "F#"
    case FStar
    case Factor
    case Fancy
    case Fantom
    case FIGletFont = "FIGlet Font"
    case FilebenchWML = "Filebench WML"
    case Filterscript
    case fish
    case FLUX
    case Formatted
    case Forth
    case Fortran
    case FreeMarker
    case Frege
    case Gcode = "G-code"
    case GameMakerLanguage = "Game Maker Language"
    case GAMS
    case GAP
    case GCCMachineDescription = "GCC Machine Description"
    case GDB
    case GDScript
    case Genie
    case Genshi
    case GentooEbuild = "Gentoo Ebuild"
    case GentooEclass = "Gentoo Eclass"
    case GerberImage = "Gerber Image"
    case GettextCatalog = "Gettext Catalog"
    case Gherkin
    case GitAttributes = "Git Attributes"
    case GitConfig = "Git Config"
    case GLSL
    case Glyph
    case GlyphBitmapDistributionFormat = "Glyph Bitmap Distribution Format"
    case GN
    case Gnuplot
    case Golo
    case Gosu
    case Grace
    case Gradle
    case GrammaticalFramework = "Grammatical Framework"
    case GraphModelingLanguage = "Graph Modeling Language"
    case GraphQL
    case Graphviz = "Graphviz (DOT)"
    case Groovy
    case GroovyServerPages = "Groovy Server Pages"
    case Hack
    case Haml
    case Handlebars
    case HAProxy
    case Harbour
    case Haxe
    case HCL
    case HiveQL
    case HLSL
    case HTMLPlusDjango = "HTML+Django"
    case HTMLPlusECR = "HTML+ECR"
    case HTMLPlusEEX = "HTML+EEX"
    case HTMLPlusERB = "HTML+ERB"
    case HTMLPlusPHP = "HTML+PHP"
    case HTMLPlusRazor = "HTML+Razor"
    case HTTP
    case HXML
    case Hy
    case HyPhy
    case IDL
    case Idris
    case IgnoreList = "Ignore List"
    case IGORPro = "IGOR Pro"
    case Inform7 = "Inform 7"
    case INI
    case InnoSetup = "Inno Setup"
    case Io
    case Ioke
    case IRClog = "IRC log"
    case Isabelle
    case IsabelleROOT = "Isabelle ROOT"
    case J
    case Jasmin
    case JavaProperties = "Java Properties"
    case JavaServerPages = "Java Server Pages"
    case JFlex
    case Jison
    case JisonLex = "Jison Lex"
    case Jolie
    case JSON
    case JSONwithComments = "JSON with Comments"
    case JSON5
    case JSONiq
    case JSONLD
    case Jsonnet
    case JSX
    case Julia
    case JupyterNotebook = "Jupyter Notebook"
    case KiCadLayout = "KiCad Layout"
    case KiCadLegacyLayout = "KiCad Legacy Layout"
    case KiCadSchematic = "KiCad Schematic"
    case Kit
    case Kotlin
    case KRL
    case LabVIEW
    case Lasso
    case Latte
    case Lean
    case Less
    case Lex
    case LFE
    case LilyPond
    case Limbo
    case LinkerScript = "Linker Script"
    case LinuxKernelModule = "Linux Kernel Module"
    case Liquid
    case LiterateAgda = "Literate Agda"
    case LiterateCoffeeScript = "Literate CoffeeScript"
    case LiterateHaskell = "Literate Haskell"
    case LiveScript
    case LLVM
    case Logos
    case Logtalk
    case LOLCODE
    case LookML
    case LoomScript
    case LSL
    case LTspiceSymbol = "LTspice Symbol"
    case M
    case M4
    case M4Sugar
    case Makefile
    case Mako
    case Markdown
    case Marko
    case Mask
    case Mathematica
    case MavenPOM = "Maven POM"
    case Max
    case MAXScript
    case mcfunction
    case MediaWiki
    case Mercury
    case Meson
    case Metal
    case MiniD
    case Mirah
    case Modelica
    case Modula2 = "Modula-2"
    case Modula3 = "Modula-3"
    case ModuleManagementSystem = "Module Management System"
    case Monkey
    case Moocode
    case MoonScript
    case MQL4
    case MQL5
    case MTML
    case MUF
    case mupad
    case Myghty
    case nanorc
    case NCL
    case Nearley
    case Nemerle
    case nesC
    case NetLinx
    case NetLinxPlusERB = "NetLinx+ERB"
    case NetLogo
    case NewLisp
    case Nextflow
    case Nginx
    case Nim
    case Ninja
    case Nit
    case Nix
    case NL
    case NSIS
    case Nu
    case NumPy
    case ObjDump
    case ObjectiveCPlusPlus = "Objective-C++"
    case ObjectiveJ = "Objective-J"
    case OCaml
    case Omgrofl
    case ooc
    case Opa
    case Opal
    case OpenCL
    case OpenEdgeABL = "OpenEdge ABL"
    case OpenRCrunscript = "OpenRC runscript"
    case OpenSCAD
    case OpenTypeFeatureFile = "OpenType Feature File"
    case Org
    case Ox
    case Oxygene
    case Oz
    case P4
    case Pan
    case Papyrus
    case Parrot
    case ParrotAssembly = "Parrot Assembly"
    case ParrotInternalRepresentation = "Parrot Internal Representation"
    case Pascal
    case Pawn
    case Pep8
    case Perl6 = "Perl 6"
    case Pic
    case Pickle
    case PicoLisp
    case PigLatin
    case Pike
    case PLpgSQL
    case PLSQL
    case Pod
    case Pod6 = "Pod 6"
    case PogoScript
    case Pony
    case PostCSS
    case PostScript
    case POVRaySDL = "POV-Ray SDL"
    case PowerBuilder
    case PowerShell
    case Processing
    case Prolog
    case PropellerSpin = "Propeller Spin"
    case ProtocolBuffer = "Protocol Buffer"
    case PublicKey = "Public Key"
    case Pug
    case Puppet
    case PureData = "Pure Data"
    case PureBasic
    case PureScript
    case Pythonconsole = "Python console"
    case Pythontraceback = "Python traceback"
    case q
    case QMake
    case QML
    case Quake
    case Racket
    case Ragel
    case RAML
    case Rascal
    case Rawtokendata = "Raw token data"
    case RDoc
    case REALbasic
    case Reason
    case Rebol
    case Red
    case Redcode
    case RegularExpression = "Regular Expression"
    case RenPy = "Ren'Py"
    case RenderScript
    case reStructuredText
    case REXX
    case RHTML
    case RichTextFormat = "Rich Text Format"
    case Ring
    case RMarkdown
    case RobotFramework
    case Roff
    case RoffManpage = "Roff Manpage"
    case Rouge
    case RPC
    case RPMSpec = "RPM Spec"
    case RUNOFF
    case Rust
    case Sage
    case SaltStack
    case SAS
    case Sass
    case Scaml
    case Scheme
    case Scilab
    case SCSS
    case sed
    case `Self`
    case ShaderLab
    case ShellSession
    case Shen
    case Slash
    case Slice
    case Slim
    case Smali
    case Smalltalk
    case Smarty
    case SMT
    case Solidity
    case SourcePawn
    case SPARQL
    case SplineFontDatabase = "Spline Font Database"
    case SQF
    case SQL
    case SQLPL
    case Squirrel
    case SRecodeTemplate = "SRecode Template"
    case Stan
    case StandardML = "Standard ML"
    case Stata
    case STON
    case Stylus
    case SubRipText = "SubRip Text"
    case SugarSS
    case SuperCollider
    case SVG
    case SystemVerilog
    case Tcl
    case Tcsh
    case Tea
    case Terra
    case Text
    case Textile
    case Thrift
    case TIProgram = "TI Program"
    case TLA
    case TOML
    case Turing
    case Turtle
    case Twig
    case TXL
    case TypeLanguage = "Type Language"
    case TypeScript
    case UnifiedParallelC = "Unified Parallel C"
    case Unity3DAsset = "Unity3D Asset"
    case UnixAssembly = "Unix Assembly"
    case Uno
    case UnrealScript
    case UrWeb
    case Vala
    case VCL
    case Verilog
    case VHDL
    case VisualBasic = "Visual Basic"
    case Volt
    case Vue
    case WavefrontMaterial = "Wavefront Material"
    case WavefrontObject = "Wavefront Object"
    case wdl
    case WebOntologyLanguage = "Web Ontology Language"
    case WebAssembly
    case WebIDL
    case WindowsRegistryEntries = "Windows Registry Entries"
    case wisp
    case WorldofWarcraftAddonData = "World of Warcraft Addon Data"
    case XBitMap = "X BitMap"
    case XFontDirectoryIndex = "X Font Directory Index"
    case XPixMap = "X PixMap"
    case X10
    case xBase
    case XC
    case XCompose
    case XML
    case Xojo
    case XPages
    case XProc
    case XQuery
    case XS
    case XSLT
    case Xtend
    case Yacc
    case YAML
    case YANG
    case YARA
    case YASnippet
    case Zephir
    case Zig
    case Zimpl
}
