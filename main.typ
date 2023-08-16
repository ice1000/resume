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
  let noSimple(content) = {
    if mode == Simplified {
      ""
    } else {
      content
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year]
  )

  translate(en: [= Tesla Zhang], zh: [= 张寅森])

  [ice1000kotlin\@gmail.com $dot.c$ #iconlink("https://ice1000.org") $dot.c$ #iconlink("https://github.com/ice1000", icon: github)]

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

  translate(en: [== Work Experience], zh: [== 工作经历])

  let sbrella-date = [#translate-date(2, 2018) -- #translate-date(7, 2018)]
  translate(
    en: cventry(
      tl: [Developer Intern at *Sourcebrella Inc.*, Shenzhen, China],
      tr: sbrella-date,
      bl: noSimple[Static Analysis, Compiler Frontend, IDE Plugin Development],
    )[#noSimple[
    - Created IntelliJ/CLion/Eclipse plugin for the Pinpoint analyzer. Co-worked on the SonarQube plugin.
    - Created a multi-threading cross Java/Kotlin source code indexer which can index Hadoop within 4 minutes.
    - Learned a lot about Linux programming and the Clang/LLVM codebase.
    ]],
    zh: cventry(
      tl: [深圳市前海源伞科技有限公司，深圳，中国],
      tr: sbrella-date,
      bl: noSimple[静态分析，编译器前端，IDE 插件开发实习],
    )[#noSimple[
    - 负责 pinpoint 分析器的 IntelliJ/CLion/Eclipse 工具集成，协助开发 SonarQube 插件。
    - 编写了一个多线程的跨 Java/Kotlin 的源代码索引工具，索引 Hadoop 源码仅需 4 分钟。
    - 学到了很多 Linux 编程和 Clang/LLVM 源码相关的知识。
    ]],
  )
}

#runReader(1)
