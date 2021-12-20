module Resume (resume) where

import Data.List
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
  , en $ "Major: Computer Science (Undergraduate), Anticipated Date of Graduation:"
  , cn $ "专业：计算机科学（本科），预计毕业日期："
  , graduation
  , pure gpa
  ] where
    graduation = date "2023" "01"
    gpa = "GPA 3.27/4.00"

sourcebrella :: Resume
sourcebrella = paragraph
  [ datedSection (date "2018" "02" ~~ date "2018" "07") $ paragraph
    [ cn "\\textbf{深圳市前海源伞科技有限公司（现蚂蚁金服研发效能团队）}, 深圳, 中国"
    , en "\\textbf{Sourcebrella Inc. (now Ant Financial Code Insight)}, Shenzhen, China"
    ]
  , paragraph
    [ cn "\\role{静态分析}{编译器前端，IDE 插件开发实习}"
    , en "\\role{Static Analysis}{Developer Intern}"
    ]
  , noSimple $ itemize
    [ cn "\\item 负责 pinpoint 分析器的 IntelliJ/CLion/Eclipse 工具集成，协助开发 SonarQube 插件。"
    , en "\\item Created IntelliJ/CLion/Eclipse plugin for the Pinpoint analyzer. Co-worked on the SonarQube plugin."

    , cn "\\item 编写了一个多线程的跨 Java/Kotlin 的源代码索引工具，索引 Hadoop 仅需 4 分钟。"
    , en "\\item Created a multi-threading cross Java/Kotlin source code indexer which can index Hadoop within 4 minutes."

    , cn "\\item 学到了很多 Linux 编程和 Clang/LLVM 源码相关的知识。"
    , en "\\item Learned a lot about Linux programming and the Clang/LLVM codebase."
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
    [ cn $ "\\item 改进各种 TiKV 的外部依赖库，如优化 " ++ grpcio
          ++ " 的内存性能，增加 " ++ procinfo ++ " 的功能。"
    , en $ "\\item Improved many TiKV-relevant libraries, "
          ++ "like optimizing the performance of " ++ grpcio
          ++ ", adding new features to " ++ procinfo ++ "."

    , cn $ "\\item 协助迁移 TiKV 及其 Raft 实现所使用的 " ++ protobuf ++ " 库。"
    , elab $ "\\item Helped to migrate the " ++ protobuf ++ " library used by TiKV and its Raft implementation."

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
  [ datedSection (date "2020" "01" ~~ date "2020" "12") $ paragraph
    [ cn "\\textbf{JetBrains Research}, 远程"
    , en "\\textbf{JetBrains Research}, Remote"
    ]
  , paragraph
    [ cn "\\role{同伦类型论与依值类型}{定理证明器 Arend 开发实习}"
    , en "\\role{HoTT and Dependent Types}{Arend Team Intern}"
    ]
  , itemize
    [ cn $ "\\item 使用 gradle composite build 和 buildSrc 等复杂的构建功能改善编译速度、提高构建自动化程度。"
    , elab $ "\\item Used features like gradle composite build and buildSrc to reduce build time and improve automation."

    , cn $ "\\item 实现了一些语言特性和 IDE 插件功能，如 section 语法、卫生宏、优化的 \\texttt{Fin} 类型、语义高亮等。"
    , en $ "\\item Improved the language/IDE, such as sections, hygiene macros, optimized \\texttt{Fin} type, semantic highlighting, etc."

    , cn $ "\\item 开发了一个可扩展的 REPL 框架，并提供命令行实现（可基于上下文补全）、IntelliJ IDEA 实现（可与打开的项目进行交互，支持补全、高亮和跳转）。"
    , elab $ "\\item Created an extensible REPL framework, provided implementations in CLI (with contextual completion) and in IntelliJ IDEA (interacts with the opened project, supports completion, highlighting and goto definition)."

    , cn $ "\\item 设计并实现了一个表达式类型检查的调试器，支持显示局部变量和表达式栈帧，同时支持单步调试。"
    , elab $ "\\item Designed and implemented an expression type-checking debugger that supports step-into and displays local context and expressions as stack frames."

    , simple $ "\\item Created a debugger for inspecting bidirectional type-checking and REPL in both CLI and IDE."
    ]
  ]

plct :: Resume
plct = paragraph
  [ datedSection (date "2020" "12" ~~ present) $ paragraph
    [ cn "\\textbf{PLCT 实验室}, 远程"
    , en "\\textbf{PLCT Lab}, Remote"
    ]
  , paragraph
    [ cn "\\role{依值类型系统实现}{类型小队队长}"
    , en "\\role{Implementation of Dependent Types}{Types team lead}"
    ]
  , itemize
    [ cn $ "\\item 带领类型小队探索现代化的依值类型实现策略，包括但不限于基于模式的合一化、模式匹配的类型检查、递归函数停机性检查等。"
    , en $ "\\item Leading the types team to explore modern techniques in dependent type implementation, such as "
        ++ "pattern unification of implicit variables, type checking of pattern matching, termination check of recursive definitions, etc."
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

    -- , cn "\\item 架构灵活，编辑器上层逻辑和 UI 框架彻底解耦，易于向其他 UI 框架移植。"
    -- , en "\\item Flexible architecture, decoupled high-level logic with UI, migration to other UI frameworks is easy."

    , cn "\\item 提供细粒度的高亮颜色和快捷键设置，设置可以热更新。"
    , en "\\item Provides fine-grained highlight color and keymap settings, supports hot reload."
    ]
  ]

aya :: Resume
aya = paragraph
  [ github "aya-prover/aya-dev" `datedSection` bold "Aya"
  , cn "实用的依值类型系统实现（职位：项目组长）"
  , en "Practical implementation of a dependent type system (role: project leader)"

  , itemize
    [ cn "\\item 支持依值类型、依值模式匹配及重叠情况一致性检查、高阶归纳类型、泛化代数数据类型、和隐式参数的推导。"
    , en $ "\\item Supports dependent types, dependent pattern matching with confluence check for overlapping cases, "
        ++ "higher inductive types, GADTs, and implicit arguments."

    , cn "\\item 支持可视化类型检查的完整证明树、导出繁饰结果到网页或 LaTeX。支持 VSCode 的语言服务器协议。"
    , en "\\item Supports visualization of the type checking traces and exporting elaboration result to HTML or LaTeX. Supports LSP in VSCode."
    ]
  ]

voile :: Resume
voile = paragraph
  [ github "owo-lang/voile-rs" `datedSection` bold "Voile"
  , cn "实验型依值类型编程语言，支持基于 kind 的 Row-polymorphism"
  , en "Experimental dependently-typed language with kind-based row-polymorphism"

  , itemize
    [ cn "\\item 支持值的自动推导（元变量）以及非依值的 row-polymorphism 的和与积类型。"
    , en "\\item Supports meta variable unification and non-dependent row-polymorphic sum and product type."

    , cn "\\item 支持 cumulative 的类型层级和歧义类型多态以避免对 Set$\\omega$ 的使用。"
    , en "\\item Supports cumulative universe and typical ambiguity to get rid of Set$\\omega$."

    -- , cn "\\item 借助 Rust 语言的生态系统实现命令行解析、代码解析和支持命令补全的交互式解释器。"
    -- , en "\\item Implements CLI parser/source code parser and interactive REPL with the help of Rust language's ecosystem."
    ]
  ]

arendVSCode :: Resume
arendVSCode = paragraph
  [ github "ice1000/vscode-arend" `datedSection` bold "VSCode extension for Arend"
  , cn "Arend 语言的 VSCode 语言客户端，基于实验性的 Arend 语言服务实现。在 VSCode 插件市场发布。"
  , en $ "VSCode language client for the Arend language, build on top of the experimental implementation of the Arend language server. "
      ++ "Available from the VSCode extension marketplace."
  ]

arendLSP :: Resume
arendLSP = paragraph
  [ github "ice1000/arend-language-server" `datedSection` bold "Arend language server"
  , cn "实验性的 Arend 语言服务实现，基于 lsp4j 框架和 Arend 编译器内部接口。"
  , en "An experimental implementation of the Arend language server, based on the lsp4j framework and Arend compiler's internal interfaces."
  ]

agdaMode :: Resume
agdaMode = paragraph
  [ github "ice1000/agda-mode" `datedSection` bold "External tactics for Agda"
  , cn $ "通过与 Agda 的 CLI 接口交互实现的类 Coq Ltac 的 REPL，"
      ++ "支持在 REPL 中进行绝大多数原本在 Emacs mode 里实现的操作，例如 case split、显示表达式与洞的类型等。"
      ++ "通过 tokio 和 serde 实现 IO，并在 Agda 编译器中实现所需的 json 接口。"
  , en $ unlines
      [ "A REPL interacts with Agda CLI interface, simulating Ltac in Coq."
      , "Supports most actions available in the Emacs mode, like case-split, show expression and goal type, etc.,"
      , "implements IO via tokio and serde along with the required json interface in Agda compiler."
      ]
  ]

jimgui :: Resume
jimgui = paragraph
  [ github "ice1000/jimgui" `datedSection` bold "JImgui"
  , cn $ "JNI 实现的 \\textit{dear imgui} 接口，通过定制工具生成 FFI 接口，利用 HotSpot 虚拟机的 Critical Native 特性优化 JNI 性能，"
      ++ "内置并自动加载主流平台的动态链接库，在 imgui 的基础上支持图片加载和窗口缩放。"
  , en $ unlines
      [ "Java port of \\textit{dear imgui} implemented in JNI, with FFI code generated by custom tool."
      , "Optimized JNI performance using the \\textit{Critical Native} feature of the HotSpot VM,"
      , "Supports auto-load built-in native libraries for mainstream platforms,"
      , "implements image loading and window scaling apart from the vanilla imgui library."
      ]
  ]

arendIO :: Resume
arendIO = paragraph
  [ github "ice1000/arend-io" `datedSection` bold "Arend IO"
  , cn "实验性 Arend IO 库，实现了 \\textsf{unsafePerformIO} 和简单的 \\textsf{IO} 操作。"
  , en "Experimental IO library for Arend, implements \\textsf{unsafePerformIO} and simple \\textsf{IO} actions."
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
    , en $ "\\item Provides live preview -- test grammar files by dynamically highlighting user code according to the grammar on the fly. "
        ++ "These highlighted code could be exported to HTML."
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

compiler :: Resume
compiler = paragraph
  [ itemTeX "编译器" "Compiler"
  , cn $ "理解多种程序表示，例如 " ++ repre ++ " 等。"
  , cn "熟悉大部分 parser 生成器，理解基于布局的语法解析。"
  , en $ "understand various program representations such as " ++ repre ++ ", etc."
  , elab "Familiar with most parser generators, understand layout syntax parsing."
  ] where repre = "CFG, ANF, (P)HOAS"

programmingLanguages :: Resume
programmingLanguages = paragraph
  [ itemTeX "编程语言" "Program Language"
  , cn "\\textbf{泛语言}（编程不受特定语言限制），"
  , cn $ "且尤其熟悉 " ++ very ++ "，"
  , cn $ "较为熟悉 " ++ somehow ++ " (排名均不分先后)。"
  , en "\\textbf{multilingual} (not limited to any specific language),"
  , en $ "especially experienced in " ++ very ++ ","
  , en $ "comfortable with " ++ somehow ++ " (in random order)."
  ] where
      somehow = "Dart C C++ F\\# F$\\star$ Idris Perl"
      very    = "Java Kotlin Rust C\\# Agda Haskell Arend"

ideDev :: Resume
ideDev = paragraph
  [ itemTeX "IDE 工具开发" "IDE Tooling"
  , cn "\\textbf{3 年}开发经验，"
  , en "\\textbf{3 years} of experience,"

  , cn $ "熟悉 IntelliJ 平台的基础设施（开发了"
        ++ " " ++ julia ++ "、" ++ dtlc ++ "、" ++ pest ++ " "
        ++ "等插件），同时了解 Eclipse/SonarQube/VSCode 的插件开发。"
  , en $ "familiar with the IntelliJ Platform infrastructure (created"
        ++ " " ++ julia ++ ", " ++ dtlc ++ ", " ++ pest ++ ", "
        ++ "etc.), also have experience with Eclipse/SonarQube/VSCode plugin development."
  ] where
      julia = pref ++ "10413} {Julia}"
      dtlc  = pref ++ "12176} {DTLC}"
      pest  = pref ++ "12046} {Pest}"
      pref  = "\\href{https://plugins.jetbrains.com/plugin/"

kotlinJava :: Resume
kotlinJava = paragraph
  [ pure "\\item \\textbf{Kotlin/Java}:"
  , cn "\\textbf{6 年}经验，"
  , cn $ "\\textbf{4} 个项目被 " ++ akotlin ++ " 收录，"
  , cn "熟悉 JNI、Gradle、Swing，理解 Contract DSL 和 Kotlin coroutines，"
  , cn "有使用 Kotlin 编译器分析代码的经验。"
  , en "\\textbf{6 years} of experience,"
  , elab $ "\\textbf{4} projects collected in " ++ akotlin ++ ","
  , en "familiar with JNI, Gradle, and Swing, understand Contract DSL and Kotlin coroutines,"
  , en "did some code analysis with Kotlin's compiler."
  ] where akotlin = "\\href{https://kotlin.link/?q=ice} {Awesome Kotlin}"

typeTheory :: Resume
typeTheory = paragraph
  [ itemTeX "类型论" "Type Theory"
  , cn "掌握直觉类型论、逆归纳法、同伦类型论、立方类型论；"
  , en "understand Martin-L\\\"{o}f type theory, coinduction, Homotopy type theory and Cubical type theory,"

  , cn "熟悉 Idris, Agda (\\textbf{3 年}经验，开发组成员)，Arend （前开发组成员）和一些 F$\\star$/Coq。"
  , en "familiar with Idris, Agda (\\textbf{3 years} of experience, contributor),"
  , en "Arend (past member) and some F$\\star$/Coq."

  -- , cn $ "\\subitem 读过代码的项目： " ++ pref ++ " 和 " ++ last ++ "。"
  -- , elab $ "\\subitem Source code studied: " ++ pref ++ " and " ++ last ++ "."
  ] where
      last = "Arend"
      pref = "Agda, Idris, MiniAgda, Mini-TT, elaboration-zoo"

mobileDev :: Resume
mobileDev = paragraph
  [ itemTeX "移动开发" "Mobile Development"
  , cn "\\textbf{2 年}经验，"
  , en "\\textbf{2 years} of experience,"
  , pure "Android (Java, Kotlin (Anko)), Flutter"
  , cn "。"
  ]

skills :: Resume
skills = section "技能" "Skills" . pure $ itemize
  [ programmingLanguages
  , compiler
  , kotlinJava
  , typeTheory

  , noSimple $ paragraph
    [ pure "\\item \\textbf{JetBrains MPS}:"
    , cn "理解\\textbf{面向语言编程}的概念和应用。"
    , en "understand concepts and applications of \\textbf{Language-Oriented Programming}."
    ]

  , ideDev
  , noSimple $ mobileDev
  , devTools
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

  , section "工作经历" "Work Experience"
    [ jetbrains
    , plct
    , pingcap
    , sourcebrella
    ]

  , section "个人项目" "Personal Projects"
    [ noSimple $ devKt
    , noSimple $ voile
    , aya
    , intellijPest
    , noSimple $ agdaMode
    , noSimple $ jimgui
    , noSimple $ arendIO
    , noSimple $ arendVSCode
    , noSimple $ arendLSP
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
          cwPerc   = "0.021\\%"
          cwRank   = "\\#59"
          projects = "\\textsf{agda, Arend, KaTeX, shields.io, grpc-rs, intellij-solidity, intellij-haskell, "
                  ++ "intellij-rust, TeXiFy-IDEA, rust-analyzer}"
    in itemize
    [ cn "\\item 一些个人页面链接（请使用支持超链接的 PDF 阅读器查看此项）："
    , cn $ href bintray ++ "{Bintray 主页}（用于发布 JVM 库），"
    , cn $ href crates ++ "{Crates.io 主页}（用于发布 Rust 库），"
    , cn $ href intellij ++ " {IntelliJ 插件开发者主页}，"
    , cn $ href personal ++ "{科研计划}"
    , simple "\\item Some profile links (please use a PDF reader with hyperlink support):"
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
    , cn $ "向 " ++ projects ++ " 等项目贡献过代码"
    , en $ "\\item Opensource Contributions: " ++ osc
    , elab "\\\\ member of \\textsf{JuliaEditorSupport, agda, pest-parser, EmmyLua, arend-lang} and more,"
    , en $ "contributed to " ++ projects ++ " and other projects"
    , elab "(apart from organization ones)"

    , pure "\\item StackOverflow: \\url{https://tinyurl.com/y5cmw3dz}"
    , cn $ "5000+ 声誉，同时也在" ++ stackex ++ "{其他 StackExchange 子站}活跃"
    , en $ "5000+ reputations, also active on " ++ stackex ++ "{other StackExchange sites}"

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
    , elab "solving and making new problems primarily in Haskell, Agda and Idris"
    , simple "primarily in Haskell, Agda and Idris"

    -- , cn "\\item 很喜欢交朋友"
    -- , elab "\\item Love making friends"
    ] ]

  -- end document
  , pure "\\end{document}"
  ]
