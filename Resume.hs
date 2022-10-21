module Resume (resume) where

import Data.List
import TeX
import ResumeData

plct :: Resume
plct = paragraph
  [ datedSection2 (date "2020" "12" ~~ present) $ paragraph
    [ cn "\\textbf{PLCT 实验室}, 远程"
    , en "\\textbf{PLCT Lab}, Remote"
    ]
  , paragraph
    [ cn "\\role{依值类型系统实现}{开源维护者}"
    , en "\\role{Implementation of Dependent Types}{Opensource Maintainer}"
    ]
  , noSimple $ itemize
    [ cn $ "\\item 带领类型小队探索现代化的依值类型实现策略，包括但不限于基于模式合一化、依值模式匹配的检查、Cubical 类型论、递归函数停机性检查等。"
    , elab $ "\\item Leading a team to explore modern techniques in type theory implementation, such as "
        ++ "pattern unification, elimination of dependent pattern matching, cubical type theory, termination check of recursive functions, etc."
    , simple "\\item Leading a team to explore modern techniques in type theory implementation."
    ]
  ]

singularityData :: Resume
singularityData = paragraph
  [ datedSection2 (date "2022" "7" ~~ present) $ paragraph
    [ cn "\\textbf{北京奇点无限数据科技有限公司}，远程"
    , en "\\textbf{RisingWave Labs}, Remote"
    ]
  , paragraph
    [ cn "\\role{数据库开发}{实习}"
    , en "\\role{Streaming Database}{Developer Intern}"
    ]
  , itemize
    [ en "\\item Proposed an overhaul of the query plan AST design, which better facilitates the enum feature implemented in the Rust programming language."
    , cn "\\item 提案重构查询计划语法树的设计以更好地使用 Rust 编程语言的枚举功能。"
    ]
  ]

mcREU :: Resume
mcREU = paragraph
  [ datedSection2 (date "2019" "5" ~~ date "2019" "8") $ paragraph
    [ en "\\textbf{Multi-Campus REU}, State College"
    , cn "\\textbf{跨校区本科科研活动}, 州学院"
    ]
  , itemize
    [ en "\\item Extensively studied the literature on row polymorphism and record calculus."
    , en "\\item Implemented and formalized a row polymorphic dependent type theory."
    , cn "\\item 广泛地调研关于行多态和结构体演算的研究，设计、实现并形式化了一个相关的依值类型系统。"
    ]
  ]

la461 :: Resume
la461 = paragraph
  [ datedSection2 (date "2022" "8" ~~ present) $ paragraph
    [ en "\\textbf{Learning Assistant} for Cmpsc 461, State College"
    , cn "担任课程 Cmpsc 461 \\textbf{助教}, 州学院"
    ]
  ]

resume :: Resume
resume = paragraph
  [ pure "% !TEX program = xelatex"
  , pure "% This file is generated, don't manually edit!"

  -- head
  , paragraph
    [ pure "\\documentclass{resume}"
    , cn   "\\usepackage{lastpage}"
    , cn   "\\usepackage{fancyhdr}"
    -- disable extra space before next section
    , pure "\\usepackage{linespacing_fix}"
    -- , en   "\\usepackage{mathpazo}"
    , cn   "\\usepackage[fallback]{xeCJK}"
    ]

  --  \setmainfont[]{SimSun}
  --  \setCJKfallbackfamilyfont{rm}{HAN NOM B}
  --  \setCJKmainfont{Source Han Serif SC Regular}
  --  \renewcommand{\thepage}{\Chinese{page}}

  -- begin document
  , pure "\\begin{document}"
  , cn "\\renewcommand\\headrulewidth{0pt}"

  -- dare?
  , tex "name" "张寅森" "Tesla Zhang"

  , basicInfo
  , education

  , section "工作经历" "Job Experience"
    [ singularityData
    , plct
    , jetbrains
    , pingcap
    , sourcebrella
    ]

  , noSimple $ section "学术经历" "Academic Experience"
    [ mcREU
    , la461
    ]

  , section "相关项目" "Related Projects"
    [ aya
    , intellijPest
    -- , noSimple $ voile
    , noSimple $ guest0x0
    , noSimple $ devKt
    -- , noSimple $ agdaMode
    , noSimple $ jimgui
    -- , noSimple $ arendIO
    , noSimple $ arendVSCode
    -- , noSimple $ arendLSP
    ]

  , skills

  , section "其他" "Miscellaneous"
    [ let intellij = "https://plugins.jetbrains.com/author/10a216dd-c558-4aaf-aa8a-723f431452fb"
          osc      = url "https://ice1000.org/opensource-contributions"
          -- bintray  = "https://bintray.com/ice1000"
          crates   = "https://crates.io/users/ice1000"
          personal = "https://personal.psu.edu/yqz5714"
          seRep    = "6000+"
          stackex  = href "https://stackexchange.com/users/9532102"
          -- https://raw.githubusercontent.com/ice1000/resume/master/resume.pdf
          enSimple = url "https://tinyurl.com/y8xdlfug"
          -- https://raw.githubusercontent.com/ice1000/resume/master/resume-elab.pdf
          enElab   = url "https://tinyurl.com/y2v59t36"
          -- https://raw.githubusercontent.com/ice1000/resume/master/resume-cn.pdf
          cnLink   = url "https://tinyurl.com/ya4urea8"
          codewars = href "https://www.codewars.com/users/ice1000" "CodeWars"
          cwLevel  = "\\textbf{1 dan}"
          cwPerc   = "0.019\\%"
          cwRank   = "\\#78"
          projects = "\\textsf{agda, Arend, KaTeX, shields.io, grpc-rs, intellij-solidity, intellij-haskell, "
                  ++ "intellij-rust, TeXiFy-IDEA, rust-analyzer}"
    in itemize
    [ cn "\\item 相关个人页面链接（请使用支持超链接的 PDF 阅读器）："
    -- , cn $ href bintray "Bintray 主页" ++ "（用于发布 JVM 库），"
    , cn $ href crates "Crates.io" ++ " 主页（用于发布 Rust 库），"
    , cn $ href intellij "IntelliJ" ++ " 插件市场主页，"
    , cn $ href personal "研究目标"
    , simple "\\item Profile Links (please use a PDF reader with hyperlink support):"
    -- , simple $ href bintray "Bintray profile" ++ " (for publishing JVM libraries),"
    , simple $ href crates "Crates.io" ++ " (publishing Rust libraries),"
    , simple $ href intellij "IntelliJ" ++ " Marketplace,"
    , simple $ href personal "Research profile"
    -- , elab $ "\\item Bintray profile: " ++ url bintray ++ ", for publishing useful JVM libraries"
    , elab $ "\\item Crates.io: " ++ url crates ++ ", publishing interesting Rust libraries"
    , elab $ "\\item IntelliJ Marketplace: " ++ url intellij
    , elab $ "\\item Research profile: " ++ url personal

    , en "\\item Languages: English - fluent (TOEFL 100), Chinese - native speaker"
    , cn "\\item 语言: English - 熟练 (托福 100)，汉语 - 母语水平"

    , cn $ "\\item 开源贡献: " ++ osc
    , cn $ "向 " ++ projects ++ " 等项目贡献过代码"
    , en $ "\\item Opensource Contributions: " ++ osc
    , elab "\\\\ member of \\textsf{JuliaEditorSupport, agda, pest-parser, EmmyLua, arend-lang} and more,"
    , en $ "contributed to " ++ projects ++ " and other projects"
    , elab "(apart from organization ones)"

    , pure $ "\\item" ++ href "https://tinyurl.com/y5cmw3dz" "StackOverflow" ++ ":"
    , cn $ seRep ++ " 声誉，同时也在" ++ stackex "其他 StackExchange 子站" ++ "活跃"
    , en $ seRep ++ " reputations, also active on " ++ stackex "other StackExchange sites"

    , cn $ "\\item 获取此简历的最新中文版本: " ++ cnLink
    , cn $ "\\item 获取此简历的最新英语版本: " ++ enElab
    , cn $ "\\item 获取此简历的最新单页版本（仅英语）: " ++ enSimple
    , en $ "\\item Latest one-page version of this resume: " ++ enSimple
    , en $ "\\item Latest complete version of this resume: " ++ enElab
    , elab $ "\\item Get the Chinese version of this resume: " ++ cnLink

    , cn $ "\\item 在 " ++ codewars ++ " 上，以 Haskell、Agda 和 Idris 为主，达到"
          ++ cwLevel ++ "，全站排名" ++ cwRank ++ "（前 " ++ cwPerc ++ "）"
    , en $ "\\item " ++ cwLevel ++ " on " ++ codewars ++ ","
    , en $ "ranked " ++ cwRank ++ " on the whole site (Top " ++ cwPerc ++ "),"
    , elab "solving and \\textit{making} new problems primarily in Haskell, Agda, and Idris"
    , simple "primarily in Haskell, Agda, and Idris"

    -- , cn "\\item 很喜欢交朋友"
    -- , elab "\\item Love making friends"
    ] ]

  , section "论文发表" "Publications" . pure $ enumerate
  [ pure "\\item \\fullcite{SIT}"
  ]
  -- end document
  , pure "\\end{document}"
  ]
