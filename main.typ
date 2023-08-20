#import "chicv.typ": *;

#show: chicv
#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(zh: "", en: "") = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let noSimple(simple: "", content) = {
    if mode == Simplified {
      simple
    } else {
      content
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year]
  )

  let edu = {
    translate(en: [== Education], zh: [== 教育经历])
    let gpa = 3.28
    let psu-date = [#translate-date(8, 2018) -- #translate-date(12, 2022)]
    translate(
      en: cventry(
        tl: [B.S. in Computer Science at *The Pennsylvania State University*, PA, US],
        tr: psu-date,
      )[Minor in Mathematics, GPA #gpa/4.00],
      zh: cventry(
        tl: [宾夕法尼亚州州立大学，计算机科学专业，本科，美国],
        tr: psu-date,
      )[副专业：数学, GPA #gpa/4.00],
    )

    let cmu-date = [#translate-date(8, 2023) -- Current]
    translate(
      en: cventry(
        tl: [Ph.D. in Computer Science at *Carnegie Mellon University*, PA, US],
        tr: cmu-date,
      )[],
      zh: cventry(
        tl: [卡内基梅隆大学，计算机科学专业，博士，美国],
        tr: cmu-date,
      )[],
    )
  }

  let sbrella = {
    let sbrella-date = [#translate-date(2, 2018) -- #translate-date(7, 2018)]
    translate(
      en: cventry(
        tl: [*Sourcebrella Inc.*, Shenzhen, China],
        tr: sbrella-date,
        bl: [_Static Analysis_, Compiler Frontend, IDE Plugin Development],
      )[#noSimple[
      - Created IntelliJ/CLion/Eclipse plugin for the Pinpoint analyzer. Co-worked on the SonarQube plugin.
      - Created a multi-threading cross Java/Kotlin source code indexer which can index Hadoop within 4 minutes.
      - Learned a lot about Linux programming and the Clang/LLVM codebase.
      ]],
      zh: cventry(
        tl: [*深圳市前海源伞科技有限公司*，深圳，中国],
        tr: sbrella-date,
        bl: [静态分析，编译器前端，IDE 插件开发实习],
      )[#noSimple[
      - 负责 pinpoint 分析器的 IntelliJ/CLion/Eclipse 工具集成，协助开发 SonarQube 插件。
      - 编写了一个多线程的跨 Java/Kotlin 的源代码索引工具，索引 Hadoop 源码仅需 4 分钟。
      - 学到了很多 Linux 编程和 Clang/LLVM 源码相关的知识。
      ]],
    )
  }

  let pingcap = {
    let grpcio = link("https://docs.rs/crate/grpcio", "grpcio")
    let procinfo = link("https://docs.rs/crate/procinfo", "procinfo")
    let protobuf = "Protocol-Buffer"
    let pingcap-date = [#translate-date(8, 2018) -- #translate-date(8, 2019)]
    translate(
      en: cventry(
        tl: [*PingCAP Inc.*, Remote],
        tr: pingcap-date,
        bl: [_Distributed Storage Systems_, TiKV Intern -- Ecosystem Team],
      )[#noSimple[
      - Improved many TiKV-relevant libraries, like optimizing the performance of #grpcio, adding new features to #procinfo.
      - Helped to migrate the #protobuf library used by TiKV and its Raft implementation.
      - Learned a lot about Rust programming, distributed system, working remotely, and databases.
      ]],
      zh: cventry(
        tl: [*北京平凯星辰科技发展有限公司*，远程],
        tr: pingcap-date,
        bl: [分布式存储系统，TiKV 实习 -- Ecosystem 小组],
      )[#noSimple[
      - 改进各种 TiKV 的外部依赖库，如优化 #grpcio 的内存性能，改善 #procinfo 的功能。
      - 协助迁移 TiKV 及其 Raft 实现所使用的 #protobuf 库。
      - 学到了很多 Rust 编程、分布式系统、远程工作和数据库相关的知识。
      ]],
    )
  }

  let jetbrains = {
    let jetbrains-date = [#translate-date(1, 2020) -- #translate-date(12, 2020)]
    translate(
      en: cventry(
        tl: [*JetBrains Research*, Remote],
        tr: jetbrains-date,
        bl: [_HoTT and Dependent Types_, Interactive Theorem Prover Development],
      )[
      #noSimple[- Used features like gradle composite build and buildSrc to reduce build time and improve automation.]
      - Improved the language/IDE, such as sections, hygiene macros, `Fin` type with elaborative subtyping, semantic highlighting, etc.
      #noSimple(
        simple: [- Created a debugger for inspecting bidirectional type-checking and REPL in both CLI and IntelliJ IDEA.]
      )[
        - Created an extensible REPL framework, provided implementations in CLI (with contextual completion) and in IntelliJ IDEA (interacts with the opened project, supports completion, highlighting and goto definition).
        - Designed and implemented an expression type-checking debugger that supports step-into and displays local context and expressions as stack frames.
      ]],
      zh: cventry(
        tl: [*JetBrains Research*，远程],
        tr: jetbrains-date,
        bl: [同伦类型论与依值类型, 交互式定理证明器 Arend 开发实习],
      )[
      - 使用 gradle composite build 和 buildSrc 等复杂的构建功能改善编译速度、提高构建自动化程度。
      - 实现了一些语言特性和 IDE 插件功能，如 section 语法、卫生宏、优化的 `Fin` 类型、语义高亮等。
      - 开发了一个可扩展的 REPL 框架，并提供命令行实现（可基于上下文补全）、IntelliJ IDEA 实现（可与打开的项目进行交互，支持补全、高亮和跳转）。
      - 设计并实现了一个表达式类型检查的调试器，支持显示局部变量和表达式栈帧，同时支持单步调试。
      ],
    )
  }

  let plct = {
    let aya-date = [#translate-date(12, 2020) -- Current]
    translate(
      en: cventry(
        tl: [*PLCT Lab*, Remote],
        tr: aya-date,
        bl: [_Implementation of Dependent Types_, Opensource Maintainer],
      )[#noSimple(
        // simple: [- Leading a team to explore modern techniques in type theory implementation.]
      )[
      - Leading a team to explore modern techniques in type theory implementation, such as pattern unification, elimination of dependent pattern matching, Cartesian cubical type theory, termination check of recursive functions, etc.
      ]],
      zh: cventry(
        tl: [*PLCT 实验室*, 远程],
        tr: aya-date,
        bl: [依值类型系统实现, 开源维护者],
      )[- 带领类型小队探索现代化的依值类型实现策略，包括但不限于基于模式合一化、依值模式匹配的检查、Cubical 类型论、递归函数停机性检查等。],
    )
  }

  let risingwave = {
    let risingwave-date = [#translate-date(7, 2022) -- #translate-date(7, 2023)]
    translate(
      en: cventry(
        tl: [*RisingWave Labs*, Remote],
        tr: risingwave-date,
        bl: [_Streaming Database_, Developer Intern],
      )[
      #noSimple[- Proposed an overhaul of the query plan AST design, which better facilitates the enum feature implemented in the Rust language.]
      - Implemented a pretty printing framework for trees with line fitting and Unicode art. Integrated into SQL explain.
      ],
      zh: cventry(
        tl: [*北京奇点无限数据科技有限公司*, 远程],
        tr: risingwave-date,
        bl: [数据库开发, 实习],
      )[
      - 提案重构查询计划语法树的设计以更好地使用 Rust 编程语言的枚举功能。
      - 实现将树状数据使用 Unicode 艺术可视化的算法，会计算行宽并支持智能断行，集成到 SQL explain 中。
      ],
    )
  }

  let aya = {
    translate(
      en: cventry(
        tl: [*Aya Prover*, Practical Implementation of Dependent Types (role: project leader)],
        tr: githublink("aya-prover/aya-dev"),
      )[
      - Supports dependent types, dependent pattern matching with confluence check for overlapping cases, higher inductive types, GADTs, hierarchial universes, cubical type theory features, and implicit arguments.
      - Supports visualization of the type checking traces and exporting elaboration result to HTML or LaTeX. Supports LSP in VSCode. Binaries releases are based on jlink and GraalVM native-image.
      ],
      zh: cventry(
        tl: [*Aya Prover*, 实用的依值类型系统实现（职位：项目组长）],
        tr: githublink("aya-prover/aya-dev"),
      )[
      - 支持依值类型、依值模式匹配及重叠情况一致性检查、高阶归纳类型、泛化代数数据类型、分层宇宙、立方类型论特性和隐式参数的推导。
      - 支持可视化类型检查的完整证明树、导出繁饰结果到网页或 LaTeX。支持 VSCode 的语言服务器协议。二进制分发基于 jlink 和 GraalVM 镜像。
      ],
    )
  }

  let arendVSCode = {
    translate(
      en: cventry(
        tl: [*VSCode extension for Arend*, Arend language server, based on lsp4j and Arend compiler's internals],
        tr: githublink("ice1000/vscode-arend"),
      )[],
      zh: cventry(
        tl: [*VSCode extension for Arend*, Arend 语言服务实现，基于 lsp4j 框架和 Arend 编译器内部接口。],
        tr: githublink("ice1000/vscode-arend"),
      )[],
    )
  }

  let arendIO = {
    translate(
      en: cventry(
        tl: [*Arend IO*, Experimental IO library for Arend, implements unsafePerformIO and simple IO actions],
        tr: githublink("ice1000/arend-io"),
      )[],
      zh: cventry(
        tl: [*Arend IO*, 实验性 Arend IO 库，实现了 unsafePerformIO 和简单的 IO 操作。],
        tr: githublink("ice1000/arend-io"),
      )[],
    )
  }

  let intellijPest = {
    translate(
      en: cventry(
        tl: [*IntelliJ Pest*, Pest language plugin for IntelliJ Platform],
        tr: githublink("pest-parser/intellij-pest"),
      )[
      - Semantic-based highlighting, completion, navigation, definition extraction/inlining, and Rust plugin integration.
      - Provides live preview -- test grammar files by dynamically highlighting user code according to the grammar on the fly. These highlighted code could be exported to HTML.
      ],
      zh: cventry(
        tl: [*IntelliJ Pest*, 基于 IntelliJ Platform 的 Pest 文法语言插件],
        tr: githublink("pest-parser/intellij-pest"),
      )[
      - 支持基于语义的高亮、错误检查、定义跳转、变量补全、提取定义、内联定义以及与 Rust 插件集成。
      - 提供实时高亮功能——可根据语法定义为用户代码动态提供高亮以测试语法定义文件，并支持导出 HTML。
      ],
    )
  }

  let devTools = {
    let tools = ("YouTrack", "Jira", "GitHub", "BitBucket", /* "Coding.net", "Tower", */ "Slack", "JetBrains Space")
  //   paragraph
  // [ itemTeX "开发工具" "Development Tool"
  // , cn "能适应任何编辑器/操作系统，平常在 Ubuntu 下使用 JetBrains IDE、Emacs，"
  // , cn $ "有使用 " ++ intercalate "、" tools ++ " 等团队协作工具的经验。"
  // , en "can adapt to any editors/OSs, usually use JetBrains IDEs and Emacs in"
  // , simple "Ubuntu."
  // , elab "Ubuntu, have experience with team collaboration tools like "
  // , elab $ intercalate ", " tools ++ "."
  // ]
  }

  let misc = {
    let intellij = "https://plugins.jetbrains.com/author/10a216dd-c558-4aaf-aa8a-723f431452fb"
    let osc      = link("https://ice1000.org/opensource-contributions")
    // bintray  = "https://bintray.com/ice1000"
    let crates   = "https://crates.io/users/ice1000"
    // What to do with this?
    // let personal = "https://personal.psu.edu/yqz5714"
    let seRep    = "6000+"
    let stackex(e) = link("https://stackexchange.com/users/9532102")[#e]
    // https://raw.githubusercontent.com/ice1000/resume/master/resume.pdf
    let enSimple = link("https://tinyurl.com/y8xdlfug")
    // https://raw.githubusercontent.com/ice1000/resume/master/resume-elab.pdf
    let enElab   = link("https://tinyurl.com/y2v59t36")
    // https://raw.githubusercontent.com/ice1000/resume/master/resume-cn.pdf
    let cnLink   = link("https://tinyurl.com/ya4urea8")
    let codewars = link("https://www.codewars.com/users/ice1000")[CodeWars]
    let cwLevel  = "\\textbf{1 dan}"
    let cwPerc   = "0.020\\%"
    let cwRank   = "\\#111"
    let projects = [*agda, Arend, KaTeX, shields.io, grpc-rs, intellij-solidity, intellij-haskell, intellij-rust, TeXiFy-IDEA, rust-analyzer*]

    translate(en: noSimple(simple: [
      - Profile links (please use a PDF reader with hyperlink support):
        #link(crates)[Crates.io],
        #link(intellij)[IntelliJ] Marketplace
    ])[
      - Crates.io: #link(crates), publishing interesting Rust libraries
      - IntelliJ Marketplace: #link(intellij)
    ], zh: [
      - 相关个人页面链接（请使用支持超链接的 PDF 阅读器）：#link(crates)[Crates.io] 主页，#link(intellij)[IntelliJ] 插件市场主页
    ])
    translate(
      en: [- Languages: English - fluent (TOEFL 100), Chinese - native speaker],
      zh: [- 语言：English - 熟练 (托福 100)，汉语 - 母语水平]
    )
    translate(
      en: [
        - Open-source contributions: #osc, #noSimple[member of JuliaEditorSupport, agda, pest-parser, EmmyLua, arend-lang and more,]
          contributed to #projects and other projects #noSimple[(apart from organization ones)]
      ],
      zh: [- 开源贡献: #osc，向 #projects 等项目贡献过代码]
    )
    [- #link("https://stackoverflow.com/users/7083401/ice1000")[StackOverflow]: #seRep
      #translate(
        en: [reputation, also active on #stackex("other StackExchange sites")],
        zh: [声誉，同时也在#stackex("其他 StackExchange 子站")活跃]
      )
    ]
    translate(
      en: [
        - Latest revision of this resume: one-page version #enSimple, complete version: #enElab
        - #noSimple[Get the Chinese version of this resume: #cnLink]
      ],
      zh: [- 获取此简历的最新更新：中文版本 #cnLink，英语版本 #enElab，单页版本（仅英语）: #enSimple]
    )
    translate(
      en: [
        - #cwLevel on #codewars, ranked #cwRank on the whole site (Top #cwPerc),
          #noSimple[solving and making new coding challenges] primarily in Haskell, Agda, and Idris
      ],
      zh: [- 在 #codewars 上，以 Haskell、Agda 和 Idris 为主，达到 #cwLevel，全站排名 #cwRank（前 #cwPerc）]
    )
  }

  // Start of the document

  translate(en: [= #smallcaps[Tesla Zhang]], zh: [= 张寅森])

  [ice1000kotlin\@gmail.com $dot.c$ #iconlink("https://ice1000.org") $dot.c$ #iconlink("https://github.com/ice1000", icon: github)]

  edu

  translate(en: [== Work Experience], zh: [== 工作经历])
  jetbrains
  plct
  risingwave
  sbrella
  pingcap

  translate(en: [== Related Projects], zh: [== 项目经历])
  aya
  intellijPest
  noSimple[
    #arendVSCode
    #arendIO
  ]

  translate(en: [== Skills], zh: [== 技能])

  translate(en: [== Misc], zh: [== 其它])
  misc
}

#runReader(1)
