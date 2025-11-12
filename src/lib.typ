#import "to_republicain.typ":todayDate

#let TITLE = "REQUIN"
#let AUTHORS_DOC = ("Coda","Juliette")
#let AUTHORS = "Coda & Juliette"

#let input = sys.inputs.at("corrige",default:"false");
#let show_correct = input=="true";

#let q_count = counter("questions")
#let is_wip = state("wip",false)
#let is_correct = state("corr",show_correct)


#let levels_emojis = (
  "emojis/chick.svg",
  "emojis/cat.svg",
  "emojis/octopus.svg",
  "emojis/shark.svg",
  "emojis/dragon.svg",
  "emojis/biohazard.svg",
).map(x => box(image(x)))


// Questions
#let question(score, content) = context [
  #levels_emojis.at(score) *Question #q_count.display()* #h(10pt) #content #h(1fr)
  #q_count.step()
  #linebreak()
]
// Corrections
#let correct(content) = context {
  if (is_correct.get()) {
    let color = green.darken(50%);
    rect(width: 100%,stroke: color)[#text(color)[*Correction* #content]]
  }
}
// Notations
#let q = question;
#let c = correct;

// ----------- Standard visuals ----------- 
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

// ----------- TEMPLATE ----------- 
// headings
#let heading_fct(it) = context {
    if (it.level == 1) [
      #v(1fr)
      #state("wip").update(b => false);
      #align(center, [
        #text(size: 40pt)[
          Chapitre\ #it.body
        ]
      ])
      #v(1fr)
      #pagebreak()
    ] else if (it.level == 2) [
      #let s =  counter(page).at(here()).at(0);
      #q_count.update(0)
      #if is_wip.get() {
        align(center, [
          #set text(size: 1.2em)
          * #it.body #text(red)[(WIP)] * 
        ])
      } else {
        align(center, [
          #set text(size: 1.2em)
          * #it.body * 
        ])
      }
    ] else [
      #set text(size: 1.2em)
      * #it.body * 
    ]
  
}

#let set_wip(x) = {state("wip").update(b => true); x};
#let set_correct(x:true) = {state("corr").update(b => true)}
// main template
#let template(body,is_main:false,set_heading:true) = {
  let correct_field = sys.inputs.at("correct",default:"false");
  let lbl = correct_field == "true";

  set document(
    title: TITLE,
    author: AUTHORS_DOC,
    date: datetime.today(),
  )

  set page(
    numbering: "1",
    header: context {
    
    if not is_main or counter(page).get().at(0) >1 {
      
      let elems = query(selector(heading.where(level: 1)).before(here()),)
      let chapter = if elems.len() == 0 { [Sommaire] } else  {elems.last().body }

      [
        #set text(style: "italic", size: 12pt)
        REQUIN -- #chapter
        #h(1fr)
        Coda & Juliette
        #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
      ]
    } 
  }, 
  footer: context if not is_main or counter(page).get().at(0) >1 {
    set text(size: 12pt)
    block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
    "Page "; counter(page).display("1/1", both: true)
    h(1fr)
    set text(style: "italic")
    todayDate
  })

  if set_heading {
    show heading: it => context heading_fct(it)
    body
  } else {
    body
  }

}