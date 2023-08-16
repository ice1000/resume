#import "chicv.typ": *;

#show: chicv
#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(
    zh: "",
    en: ""
  ) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(
    month,
    year
  ) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year]
  )

  translate(
    en: [= Tesla Zhang],
    zh: [= 张寅森],
  )

  [ice1000kotlin\@gmail.com $dot.c$ #iconlink("https://ice1000.org") $dot.c$ #iconlink("https://github.com/ice1000", icon: github)]

// education :: Resume
// education = section "教育经历" "Education"
//   [ datedSection2 (date "2018" "08" ~~ date "2022" "12") $ paragraph
//     [ en "B.S. in Computer Science at \\textbf{The Pennsylvania State University}, PA, US"
//     , cn "\\textbf{宾夕法尼亚州州立大学}，计算机科学专业，本科，美国"
//     ]
//   , en $ "Minor in Mathematics,"
//   , cn $ "副专业：数学,"
//   , pure gpa
//   , datedSection2 (date "2023" "08" ~~ present) $ paragraph
//     [ en "Ph.D. in Computer Science at \\textbf{Carnegie Mellon University}, PA, US"
//     , cn "\\textbf{卡内基梅隆大学}，计算机科学专业，博士，美国"
//     ]
//   ] where
//     gpa = "GPA 3.28/4.00"

  translate(
    en: [== Education],
    zh: [== 教育经历]
  )
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

#runReader(1)
