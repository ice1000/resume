#import "chicv.typ": *;
#import "fontawesome.typ": *;

#let translate(
  zh: "",
  en: ""
) = {
  if isChinese {
    zh
  } else {
    en
  }
}
#let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
#let translate-date(
  month,
  year
) = translate(
  zh: [#year 年 #month 月],
  en: [#months.at(month - 1), #year]
)
