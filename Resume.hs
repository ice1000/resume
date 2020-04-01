{-# LANGUAGE LambdaCase #-}
module Main where

import Control.Monad
import Control.Monad.Reader
import Data.List
import System.Environment
import TeX

basicInfo :: Resume
basicInfo = paragraph
  [ pure "\\basicInfo{"
  , pure $ "\\email{ice1000kotlin@foxmail.com}" ++ period
  -- , cn $ "\\phone{(+86) 180-8192-5082}" ++ period
  -- , en $ "\\phone{(1) 717-728-6526}" ++ period
  , pure $ "\\github[ice1000]{https://github.com/ice1000}" ++ period
  , pure $ "\\homepage[ice1000.org]{https://ice1000.org}" ++ period
  , pure "\\linkedin[ice1000]{https://www.linkedin.com/in/ice1000}"
  , pure "}"
  ] where period = "\\textperiodcentered\\"

education :: Resume
education = section "教育经历" "Education"
  [ datedSection (date "2018" "08" ~~ present) $ paragraph
    [ en "\\textbf{The Pennsylvania State University}, PA, US"
    , cn "\\textbf{宾夕法尼亚州州立大学}, 美国"
    ]
  , en $ "Major: Computer Science, Anticipated Graduation Date: 06/2022, " ++ gpa
  , cn $ "专业：计算机科学，预计毕业日期： 2022 年 6 月， " ++ gpa
  ] where gpa = "GPA 3.20/4.00"

sourcebrella :: Resume
sourcebrella = paragraph
  [ datedSection (date "2018" "02" ~~ date "2018" "07") $ paragraph
    [ cn "\\textbf{深圳市前海源伞科技有限公司}, 深圳, 中国"
    , en "\\textbf{Sourcebrella Inc.}, Shenzhen, China"
    ]
  , paragraph
    [ cn "\\role{静态分析}{编译器前端，IDE 插件开发实习}"
    , en "\\role{Static Analysis}{Compiler Front-End, IDE Plugin Dev Intern}"
    ]
  , itemize
    [ cn "\\item 负责 pinpoint 分析器的 IntelliJ/CLion/Eclipse 工具集成，协助开发 SonarQube 插件。"
    , en "\\item Created IntelliJ/CLion/Eclipse plugin for the Pinpoint analyzer. Co-worked on the SonarQube plugin."

    , cn "\\item 编写了一个多线程的跨 Java/Kotlin 的源代码索引工具，索引 Hadoop 仅需 4 分钟，"
    , en "\\item Created a multi-threading cross Java/Kotlin source code indexer which can index Hadoop within 4 minutes."

    , cn "\\item 学到了很多 Linux 编程和 Clang/LLVM 源码相关的知识。"
    , elab "\\item Learned a lot about Linux programming and the Clang/LLVM codebase."
    ]
  ]

pingcap :: Resume
pingcap = paragraph
  [ datedSection (date "2018" "08" ~~ date "2019" "08") $ paragraph
    [ cn "\\textbf{北京平凯星辰科技发展有限公司}, 远程"
    , en "\\textbf{PingCAP Inc.}, Remote"
    ]
  , paragraph
    [ cn "\\role{分布式存储系统}{TiKV 实习 - Ecosystem 小组}"
    , en "\\role{Distributed Storage Systems}{TiKV Intern - Ecosystem Team}"
    ]
  , itemize
    [ cn $ "\\item 改进各种 TiKV 的外部依赖库，如优化" ++ grpcio
          ++ "的内存性能，增加" ++ procinfo ++ "的功能。"
    , en $ "\\item Improved many TiKV-relevant libraries, "
          ++ "like optimizing the performance of " ++ grpcio
          ++ ", adding new features to " ++ procinfo ++ "."

    , cn $ "\\item 协助迁移 TiKV 及其 Raft 实现所使用的 " ++ protobuf ++ " 库。"
    , en $ "\\item Helped to migrate the " ++ protobuf ++ " library used by TiKV and its Raft implementation."

    , cn "\\item 学到了很多 Rust 编程、分布式系统、远程工作和数据库相关的知识。"
    , elab "\\item Learned a lot about Rust programming, distributed system, working remotely, and databases."
    ]
  ]
  where
    grpcio   = "\\href{https://docs.rs/crate/grpcio} {grpcio}"
    procinfo = "\\href{https://docs.rs/crate/procinfo} {procinfo}"
    protobuf = "Protocol-Buffer"


jetbrains :: Resume
jetbrains = paragraph
  [ datedSection (date "2020" "01" ~~ present) $ paragraph
    [ cn "\\textbf{JetBrains Research}, 远程"
    , en "\\textbf{JetBrains Research}, Remote"
    ]
  , paragraph
    [ cn "\\role{同伦类型论与依赖类型}{定理证明器 Arend 开发实习}"
    , en "\\role{HoTT and Dependent Types}{Theorem Prover Arend development Intern}"
    ]
  , itemize
    [ cn $ "\\item 使用 composite build 和 buildSrc 等复杂的构建功能改善编译速度、提高自动化程度。"
    , en $ "\\item Used features like composite build and buildSrc to reduce build time and improve automation."

    , cn $ "\\item 设计与实现更多实用语法糖、IDE 插件功能，如 \\textsf{\\_\\_} 语法、子表达式访问器等。"
    , en $ "\\item Designed and implemented syntax sugars and IDE features, such as the \\textsf{\\_\\_} syntax, subexpr visitor, etc."
    ]
  ]

devKt :: Resume
devKt = paragraph
  [ github "ice1000/dev-kt" `datedSection` bold "DevKt"
  , cn "跨平台轻量级代码编辑器兼 Kotlin IDE"
  , en "Cross-platform lightweight code editor / Kotlin IDE"

  , itemize
    [ cn "\\item 内置 Java/Kotlin 的高亮、补全，其他语言可以借助插件"
    , cn "（可移植自 JetBrains IDE）做到同样的支持。\\\\对 Kotlin 有额外的编译运行支持。"
    , en "\\item Built-in Java/Kotlin highlights and completion, that can support other languages"
    , en "via plugins (transplantable from JetBrains IDE's)."
    , en "Has extra build \\& run support for Kotlin."

    , cn "\\item 架构灵活，编辑器上层逻辑和 UI 框架彻底解耦，易于向其他 UI 框架移植。"
    , en "\\item Flexible architecture, decoupled high-level logic with UI, migration to other UI frameworks is easy."

    , cn "\\item 提供细粒度的高亮颜色和快捷键设置，设置可以热更新。"
    , en "\\item Provides fine-grained highlight color and keymap settings, supports hot reload."
    ]
  ]

voile :: Resume
voile = paragraph
  [ github "owo-lang/voile-rs" `datedSection` bold "Voile"
  , cn "实验型依赖类型编程语言，支持基于 kind 的 Row-polymorphism"
  , en "Experimental dependently-typed language with kind-based row-polymorphism"

  , itemize
    [ cn "\\item 支持依赖类型，值的自动推导（元变量）以及非依赖的 row-polymorphism 的 Record 和 Variant 类型。"
    , en "\\item Supports dependent types, meta variable unification, and non-dependent row-polymorphic record and variant."

    , cn "\\item 支持 cumulative 的类型层级和类型层级的提升运算符以避免对 Set$\\omega$ 的使用。"
    , en "\\item Supports cumulative universe levels and uses a universe lifting operation to get rid of Set$\\omega$."

    , cn "\\item 借助 Rust 语言的生态系统实现命令行解析、代码解析和支持命令补全的交互式解释器。"
    , en "\\item Implements CLI parser/source code parser and interactive REPL with the help of Rust language's ecosystem."
    ]
  ]

intellijPest :: Resume
intellijPest = paragraph
  [ github "pest-parser/intellij-pest" `datedSection` bold "IntelliJ Pest"
  , cn "基于 IntelliJ Platform 的 IDE 的 Pest 文法语言插件"
  , en "A Pest grammar language plugin for IDEs based on the IntelliJ Platform"

  , itemize
    [ cn "\\item 支持基于语义的高亮、错误检查、定义跳转、变量补全、提取定义、内联定义以及与 Rust 插件集成。"
    , cn "\\item 提供实时高亮功能——可根据语法定义为用户代码动态提供高亮以测试语法定义文件，并支持导出 HTML。"

    , en "\\item Semantic-based highlighting, completion, navigation, definition extraction/inlining, and Rust plugin integration."
    , en "\\item Provides live preview -- test grammar files by dynamically highlighting user code according to the grammar."
    , en "\\item Supports exporting the highlighted user code to HTML format."
    ]
  ]

devTools :: Resume
devTools = paragraph
  [ itemTeX "开发工具" "Development Tool"
  , cn "能适应任何编辑器/操作系统，平常在 Ubuntu 下使用 JetBrains IDE、Emacs，"
  , cn $ "有使用 " ++ intercalate "、" tools ++ " 等团队协作工具的经验。"
  , en "can adapt to any editors/OSs, usually use JetBrains IDEs and Emacs under"
  , simple "Ubuntu."
  , elab "Ubuntu, have experience with team collaboration tools like "
  , elab $ intercalate ", " tools ++ "."
  ] where
     tools = ["YouTrack", "Jira", "GitHub", "BitBucket", "Coding.net", "Tower", "Slack", "JetBrains Space"]

skills :: Resume
skills = section "技能" "Skills" . pure $ itemize
  [ itemTeX "编程语言" "Program Language"
  , cn "\\textbf{泛语言}（编程不受特定语言限制），"
  , cn $ "且尤其熟悉 " ++ very ++ "，"
  , cn $ "较为熟悉 " ++ somehow ++ " (排名均不分先后)。"
  , en "\\textbf{multilingual} (not limited to any specific language),"
  , en $ "especially experienced in " ++ very ++ ","
  , en $ "comfortable with " ++ somehow ++ " (in random order)."

  , itemTeX "编译原理" "Compiler"
  , cn "理解各种程序表示，例如控制流图或者 A-Normal Form。"
  , cn "熟悉大部分语法分析器生成器，理解基于布局的语法解析。"
  , en "understand various program representations such as"
  , en "Control Flow Graphs and A-Normal Form."
  , elab "Familiar with most parser generators, understand layout syntax parsing."

  , pure "\\item \\textbf{Kotlin/Java}:"
  , cn "\\textbf{4 年}开发经验，"
  , cn $ "\\textbf{4} 个项目被 " ++ akotlin ++ " 收录，"
  , cn "熟悉 JNI、Gradle、Swing，理解 Contract DSL 和 Kotlin coroutines，"
  , cn "有使用 Kotlin 编译器分析代码的经验。"
  , en "\\textbf{4 years} of experience,"
  , elab $ "\\textbf{4} projects collected in " ++ akotlin ++ ","
  , en "familiar with JNI, Gradle, and Swing, understand Contract DSL and Kotlin coroutines,"
  , en "did some code analysis with Kotlin's compiler."

  , itemTeX "类型系统" "Type System"
  , cn "掌握 Martin-L\\\"{o}f 类型论、逆归纳和 Cubical 类型论，正在学习同伦类型论；"
  , en "understand Martin-L\\\"{o}f Type Theory, coinduction and Cubical Type Theory,"
  , en "currently studying Homotopy Type Theory,"

  , cn "熟悉 Idris, Agda (\\textbf{2 年}使用经验，开发组成员之一)，F$\\star$, Arend 和一些 Coq。"
  , en "familiar with Idris, Agda (\\textbf{2 years} of experience, contributor),"
  , en "F$\\star$, Arend and some Coq."

  , let last   = "Arend"
        others = "Agda, Idris, MiniAgda, Mini-TT, elaboration-zoo"
    in paragraph
    [ cn $ "\\subitem 读过代码的项目： " ++ others ++ " 和 " ++ last ++ "。"
    , elab $ "\\subitem Source code studied: " ++ others ++ " and " ++ last ++ "."
    ]

  , noSimple $ paragraph
    [ pure "\\item \\textbf{JetBrains MPS}:"
    , cn "理解\\textbf{面向语言编程}的概念和应用。"
    , en "understand concepts and applications of \\textbf{Language-Oriented Programming}."
    ]

  , itemTeX "IDE 工具开发" "IDE Tooling"
  , cn "\\textbf{3 年}开发经验，"
  , en "\\textbf{3 years} of experience,"

  , cn $ "熟悉 IntelliJ 平台的基础设施（开发了"
        ++ " " ++ julia ++ "、" ++ dtlc ++ "、" ++ pest ++ " "
        ++ "和很多其他插件），同时了解 Eclipse/SonarQube 的插件开发。"
  , en $ "familiar with the IntelliJ Platform infrastructure (created"
        ++ " " ++ julia ++ ", " ++ dtlc ++ ", " ++ pest ++ " "
        ++ "and many other plugins), also have experience with Eclipse/SonarQube plugin development."

  , noSimple $ paragraph
    [ itemTeX "移动开发" "Mobile Development"
    , cn "\\textbf{2 年}开发经验，"
    , en "\\textbf{2 years} of experience,"
    , pure "Android (Java, Kotlin (Anko)), Fuchsia (Flutter)"
    , cn "。"
    ]

  , devTools
  ] where
      somehow = "Dart C C++ F\\# F$\\star$ Idris Perl"
      very    = "Java Kotlin Rust C\\# Agda Haskell Arend"
      akotlin = "\\href{https://kotlin.link/?q=ice} {Awesome Kotlin}"
      julia   = "\\href{https://plugins.jetbrains.com/plugin/10413} {Julia}"
      dtlc    = "\\href{https://plugins.jetbrains.com/plugin/12176} {DTLC}"
      pest    = "\\href{https://plugins.jetbrains.com/plugin/12046} {Pest}"

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
  , tex "name" "张寅森" "Tesla Ice Zhang"

  , basicInfo
  , education

  , section "工作经历" "Work Experience"
    [ jetbrains
    , pingcap
    , sourcebrella
    ]

  , section "个人项目" "Personal Projects"
    [ noSimple $ devKt
    , voile
    , intellijPest
    ]

  , skills

  , section "其他" "Miscellaneous"
    [ let intellij = "https://plugins.jetbrains.com/author/10a216dd-c558-4aaf-aa8a-723f431452fb"
          osc      = url "https://ice1000.org/opensource-contributions"
          bintray  = "https://bintray.com/ice1000"
          crates   = "https://crates.io/users/ice1000"
          personal = "https://personal.psu.edu/yqz5714"
          stackex  = href "https://stackexchange.com/users/9532102"
          -- https://raw.githubusercontent.com/ice1000/resume/master/resume.pdf
          enSimple = url "https://tinyurl.com/y8xdlfug"
          -- https://raw.githubusercontent.com/ice1000/resume/master/resume-elab.pdf
          enElab   = url "https://tinyurl.com/y2v59t36"
          -- https://raw.githubusercontent.com/ice1000/resume/master/resume-cn.pdf
          cnLink   = url "https://tinyurl.com/ya4urea8"
          codewars = href "https://www.codewars.com/users/ice1000" ++ "{CodeWars}"
          cwLevel  = "\\textbf{1 dan}"
          cwRank   = "\\#31"
    in itemize
    [ cn "\\item 一些个人页面链接（请使用支持超链接的 PDF 阅读器查看此项）："
    , cn $ href bintray ++ "{Bintray 主页}（用于发布 JVM 库），"
    , cn $ href crates ++ "{Crates.io 主页}（用于发布 Rust 库），"
    , cn $ href intellij ++ " {IntelliJ 插件开发者主页}，"
    , cn $ href personal ++ "{科研计划}"
    , simple "\\item Some profile links (please use a PDF reader with web link support):"
    , simple $ href bintray ++ "{Bintray profile} (for publishing JVM libraries),"
    , simple $ href crates ++ "{Crates.io profile} (for publishing Rust libraries),"
    , simple $ href intellij ++ " {IntelliJ Plugin developer profile},"
    , simple $ href personal ++ "{Research Statement}"
    , elab $ "\\item Bintray profile: " ++ url bintray ++ ", for publishing useful JVM libraries"
    , elab $ "\\item Crates.io profile: " ++ url crates ++ ", for publishing interesting Rust libraries"
    , elab $ "\\item IntelliJ Plugin developer profile: " ++ url intellij
    , elab $ "\\item Research profile: " ++ url personal

    , en "\\item Languages: English - fluent (TOEFL 100), Chinese - native speaker"
    , cn "\\item 语言: English - 熟练 (托福 100)，汉语 - 母语水平"

    , cn $ "\\item 开源贡献: " ++ osc
    , cn "向 \\textsf{agda, KaTeX, shields.io, raft-rs, grpc-rs, intellij-solidity,"
    , cn "intellij-haskell, intellij-rust, rust-analyzer} 等项目贡献过代码"
    , en $ "\\item Opensource Contributions: " ++ osc
    , elab "\\\\ member of \\textsf{JuliaEditorSupport, agda, pest-parser, EmmyLua, arend-lang} and more,"
    , en "contributed to \\textsf{agda, KaTeX, shields.io, raft-rs, grpc-rs, intellij-solidity, intellij-haskell,"
    , en "intellij-rust, rust-analyzer} and other projects"
    , elab "(apart from organization ones)"

    , pure "\\item StackOverflow: \\url{https://tinyurl.com/y5cmw3dz}"
    , cn $ "4500+ 声誉，同时也在" ++ stackex ++ "{其他 StackExchange 子站}活跃"
    , en $ "4500+ reputations, also active on " ++ stackex ++ "{other StackExchange sites}"

    , cn $ "\\item 获取此简历的最新版本: " ++ cnLink
    , cn $ "\\item 获取此简历的完整版本（英语）: " ++ enElab
    , simple $ "\\item Get the latest version of this resume: " ++ enSimple
    , simple $ "\\item Get the complete version of this resume: " ++ enElab
    , elab $ "\\item Get the latest version of this resume: " ++ enElab
    , elab $ "\\item Get the Chinese version of this resume: " ++ cnLink
    , elab $ "\\item Get the simplified version of this resume: " ++ enSimple

    , cn $ "\\item 在" ++ codewars ++ "上，以 Haskell、Agda 和 Idris 为主，达到"
          ++ cwLevel ++ "，全站排名" ++ cwRank
    , en $ "\\item " ++ cwLevel ++ " on" ++ codewars ++ ","
    , en $ "ranked " ++ cwRank ++ " on the whole site,"
    , elab "solving and making new problems primarily in Haskell, Agda and Idris"
    , simple "primarily in Haskell, Agda and Idris"

    , cn "\\item 很喜欢交朋友"
    , en "\\item Love making friends"
    ] ]

  -- end document
  , pure "\\end{document}"
  ]

main :: IO ()
main = getArgs >>= \case
  ["cn"]   -> f Chinese
  ["en"]   -> f English
  ["elab"] -> f Elaborated
  _        -> putStrLn $ unlines
    [ "Usage: <program> MODE"
    , "MODE can be cn, en or elab"
    ]
  where f = putStrLn . runReader resume
