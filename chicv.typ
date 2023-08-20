// Modified by ice1000 at 2023-08-16

#let chiline() = {
  v(-3pt);
  line(length: 100%, stroke: gray);
  v(-10pt)
}

#import "fontawesome.typ": *;
#let iconlink(
  uri, text: [], icon: link-icon) = {
  if text == [] {
    text = uri
  }
  link(uri)[#fa[#icon] #text]
}

#let githublink(userRepo) = {
  link("https://github.com/" + userRepo)[#fa[#github]]
}

#let cventry(
  tl: lorem(2),
  tr: "1145/14 - 1919/8/10",
  bl: [],
  br: [],
  content
) = {
  block(
    inset: (left: 0pt),
    tl + h(1fr) + tr +
    linebreak() +
    if bl != [] or br != [] {
      bl + h(1fr) + br + linebreak()
    } +
    content
  )
}

#let chicv(body) = {
  set par(justify: true)

  show heading.where(
    level: 1
  ): set text(
    size: 18pt,
    weight: "light",
  )

  let the-font = (
    "Palatino Linotype",
    "Source Han Serif SC",
    "Source Han Serif",
  )
  show heading.where(
    level: 2
  ): it => text(
    size: 12pt,
    font: the-font,
    weight: "bold",
    block(
      chiline() + it,
    )
  )
  set list(indent: 0pt)
  set text(
    size: 9pt,
    font: the-font
  )

  show link: it => underline(offset: 2pt, it)
  set page(
   margin: (x: 0.5cm, y: 0.9cm),
  )
  set par(justify: true)

  body
}