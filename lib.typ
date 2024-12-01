#let show_correct = false


#let q_count = counter("questions")

#let setup_ex() = {
  q_count.update(0)
}

#let levels_emojis = (
  "emojis/chick.svg",
  "emojis/cat.svg",
  "emojis/octopus.svg",
  "emojis/shark.svg",
  "emojis/dragon.svg",
  "emojis/biohazard.svg",
).map(x => box(image(x)))

// ---- headings ----
#let heading_fct(it) = {
  if (it.numbering == none) {it} else {
    let numb = counter(heading).display(it.numbering)
    if (it.level == 1) [
      #pagebreak()
      #v(1fr)
      #align(center, [
        #text(size: 20pt)[#numb #it.body]
      ])
      #v(1fr)
    ] else if (it.level == 2) [
      #pagebreak()
      #setup_ex()
      #align(center, [
        #set text(size: 1.2em)
        * #numb #it.body * 
      ])
    ] else [
      #set text(size: 1.2em)
      * #numb #it.body * 
    ]
  }
}
#show heading: heading_fct


#let question(score, question) = {

  [ #levels_emojis.at(score) *Question #q_count.display()* #h(10pt) #question #h(1fr) /*#array.range(5).map(i => if i < score {$star.filled$} else {$star.stroked$}).sum()*/ \ ]

  q_count.step()
}

// et pour afficher la correction
#let correct(body) = {
  if (show_correct) {
    set text(white)
    rect(
      fill: rgb(196,255,181),
      inset: 8pt,
      radius: 4pt,
      width: 100%,
      [
        #set text(white)
        #rect(
          fill: green,
          inset: 8pt,
          radius: 4pt,
          width: 100%,
          [Correction],
        )
        #set text(black)
        #body
      ],
    )
  } else {}
}


#let problem(name,entry,output) = {
  set align(center)
  rect(outset: 3pt)[
    *#name*\
    #set align(left)
    *ENTREE:* #entry \
    *SORTIE:* #output
  ]
  set align(left)
}

#let prbl(name) = {
  box(stroke: black, baseline: 3pt, inset: 3pt, [#name])
}
#let theo(content, title: none) = {
  if title == none {
    title = [ *-- Théorème --* ]
  } else {
    title = [*-- Théorème #title --*]
  }
  align(center,
  rect(width: 400pt)[
    #title
    #set align(left)
    #content
  ])
}