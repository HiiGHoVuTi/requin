
#import "template.typ": pset


#show: pset.with(
  title: "REQUIN",
  author: "Coda & Juliette",
  date: datetime.today(),
  // collaborators: ("Ben Bitdiddle", "Louis Reasoner")
)

#import "@preview/codly:1.0.0": *
#show: codly-init.with()

#let solutions = false

#let grandTitre(titre, sousTitre) = [
 #v(1fr)
#align(center)[
  #text(size: 30pt)[REQUIN]

  #text(size: 20pt)[*re*\cueil de *qu*\estions d'*in*\formatique]
]
#v(1fr)
]

// PREMIERE PAGE
#grandTitre("REQUIN", [*re*\cueil de *qu*\estions d'*in*\formatique])

#pagebreak()
// SOMMAIRE
#outline(title: "Sommaire", depth: 2)

#let question(n, score, setup, question, indication, correction) = [

  #setup

  #n. _#question _ #h(1fr) 
  #array.range(5).map(i => if i < score {$star.filled$} else {$star.stroked$}).sum()

  #if indication != none {
    h(5%) 
    indication
  }

  #if solutions {
    line(length: 100%)
    correction
  }
]

#let fichier(nom) = context {
  import(nom) as file
  file.main(question)
  // if counter(page).get().at(0) < counter(page).final().at(0) {
  //   pagebreak()
  // }
}

#let chapitre(nom, body) = {[
#pagebreak()
#v(1fr)
#align(center, [
#set text(size: 20pt)
= #nom
])
#v(1fr)
#pagebreak()
#body
]}


#chapitre("Algorithmique")[
  _c'est si vide ici..._
]
#chapitre("Arbres & Graphes")[
  _c'est si vide ici..._
]
#chapitre("Langages formels")[
  _c'est si vide ici..._
]
#chapitre("Théorie des jeux")[
  _c'est si vide ici..._
]
#chapitre("Calculabilité")[
  _c'est si vide ici..._
]
#chapitre("Logique")[
  _c'est si vide ici..._
]
#chapitre("Langages fonctionnels")[
  _c'est si vide ici..._
]
#chapitre("Mathématiques pour l'informatique")[
  #fichier("mathematiques/semigroupes-et-langages.typ")
]


// #question(3, "Soit A un automate", "Pourquoi", "feur", "parce que")
