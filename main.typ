#import "template.typ": pset
#import "lib.typ": *


#show: pset.with(
  title: "REQUIN",
  author: "Coda & Juliette",
  date: datetime.today(),
  // collaborators: ("Ben Bitdiddle", "Louis Reasoner")
)

#import "@preview/codly:1.0.0": *
#show: codly-init.with()


// -------------------- PREMIERE PAGE --------------------
#v(1fr)
#align(center)[
  #text(size: 30pt)[REQUIN]
  #v(10pt)
  #text(size: 20pt)[*RE*\cueil de *QU*\estions d'*IN*\formatique]
]
#v(1fr)

#pagebreak()

// -------------------- SOMMAIRE --------------------
#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}
#outline(title: "Sommaire", depth: 2, indent: 10pt)





// -------------------- FORMAT HEADINGS --------------------
#show heading.where(level: 1): name => [
  #pagebreak()
  #v(1fr)
  #align(center, [
    #text(size: 20pt)[#name]
  ])
  #v(1fr)
]
#show heading.where(level: 2): name => [
  #pagebreak()
  #setup_ex()
  #align(center, [
    #set text(size: 1.2em)
    * #name * 
  ])
]

= Algorithmique
_c'est si vide ici..._


= Arbres & Graphes
== Mots univers
#include "graph/univers.typ"

= Langages formels
== Language permuté et inclusions
#include "lang/inclusions.typ"
== Language continuables
#include "lang/continuables.typ"
== Puissance et racine de languages
#include "lang/pow_sqrt.typ"


= Théorie des jeux
== Nim à choix
#include "jeux/nim_set.typ"

= Calculabilité
== Calculabilité et représentation d'ensembles infinis
#include "calc/ens_fct.typ"

= Logique
== Compacité
#include "log/compacite.typ"

= Langages fonctionnels

= Mathématiques pour l'informatique
== Monoïdes libres, langages et actions
#include "math/semigroupes-et-langages.typ"



// #question(3, "Soit A un automate", "Pourquoi", "feur", "parce que")
