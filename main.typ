#import "src/to_republicain.typ": *
#import "src/lib.typ": *


// the template but the without ornements
#show :it => template(it,is_main:true,set_heading:false)

#set heading(numbering: (..nums) => {
  nums = nums.pos()
  let roman = romanise(nums.at(0))
  if nums.len() == 1 {
    [ Chapitre #roman.
    ]
  } else if nums.len() == 2 {
    [Problème #roman.#nums.at(1):]
  } 
  else {
    numbering("I.1.a.i", ..(..nums).slice(2))
  }
})

/* Make the title */
#align(center, {
  text(size: 1.6em, weight: "bold")[REQUIN \ ]
  text(size: 1.2em, weight: "semibold")[Coda & Juliette \ ]
  emph[
    #todayDate
  ]
  box(line(length: 100%, stroke: 1pt))
})

#v(1fr)
#align(center)[
  #text(size: 30pt)[REQUIN]
  #v(10pt)
  #text(size: 20pt)[*RE*\cueil de *QU*\estions d'*IN*\formatique]
]
#v(1fr)

#pagebreak()

*Niveaux de difficulté*
// - #levels_emojis.at(0) : Question d'introduction. Prend entre quelques secondes et 1 minutes. Faisable de tete, il s'agit souvent de trouver un exemple ou un contre-exemple.
// - #levels_emojis.at(1) : Question demandant des méthodes classique, mais sans autre difficulté apparante. Très bien pour réviser le cours.
// - #levels_emojis.at(2) : Question relativement difficile, qui peut nécessiter un peu de travail et/ou des astuces relativement classique. Toutefois, avec un peu de persévérance, tout le monde y est capable. Très bien pour réviser des exercices. Il est fortement conseiller de les poser sur feuille.
// - #levels_emojis.at(3) : Question difficile du sujet, qui peut prendre entre une dizaine de minute pour les plus fort et plusieurs heures. Parfois, elles demandent de sortir des astuces peu communes. On ce doit de les poser sur feuille.
// - #levels_emojis.at(4) : Questions très très difficilles demandant beaucoup de recherche / connaissances externes. Demande plusieurs jours de travail.
// - #levels_emojis.at(5) : Questions ouvertes à la connaissance des autrices.

- #levels_emojis.at(0) : Question d'introduction servant à s'approprier l'énoncé
- #levels_emojis.at(1) : Question classique ou pouvant être résolue en déroulant une méthode simple
- #levels_emojis.at(2) : Question nécessitant un raisonnement plus complet ou une astuce, mais à la portée de tous
- #levels_emojis.at(3) : Question difficile du sujet demandant une réflexion posée ou une bonne intuition
- #levels_emojis.at(4) : Question très difficile pour les plus courageux qui n'ont pas peur de réfléchir longtemps
- #levels_emojis.at(5) : Question ouverte à la connaissance des autrices, ou de difficulté déraisonnable


// *Notation de cet ouvrage*
*Notations*

#figure(block(width: 95%,
  table(columns: (80pt, 1fr), inset: 7pt,
    $x := a$, [Définition de $x$ comme $a$],
    $NN, ZZ, QQ, RR$, [Respectivement les entiers naturels, relatifs, nombres rationnels et réels],
    $[n]$, [L'ensemble des entiers naturels de $1$ à $n$. On a $[n] := {1,2,...,n}$],
    [$frak(P)(A)$, $cal(P)(A)$], [L'ensemble des parties de $A$],
    [$frak(P)_f (A)$, $cal(P)_f (A)$], [L'ensemble des parties finies de $A$],
    $A^k$, [L'ensemble des $k$-uplets d'éléments de $A$],
    $binom(A, k)$, [L'ensemble des parties à $k$ éléments de $A$],
    $A^B$, [L'ensemble des fonctions de $B$ dans $A$],
    $A union.sq B$, [L'union disjointe de $A$ et $B$, présuppose $A inter B = emptyset$],
    $T[i]$, [Le $i$#super("ème") élément du tableau $T$],
    $G = (S,A)$, [$G$ est un graphe non orienté avec les sommets $S$ et les arêtes $A subset.eq binom(S, 2)$],
    $K_n$, [Le graphe complet à $n$ sommets],
    $K_(n,m)$, [Le graphe biparti complet sur $n+m$ sommets],
    $G[S']$, [Le sous-graphe induit par l'ensemble de sommets $S'$ de $G$],
    $Sigma^star$, [L'étoile de Kleene sur l'alphabet $Sigma$],
    $w_a$, [Le nombre d'occurrences de la lettre $a$ dans le mot $w$]
)))

Voir le glossaire pour les définitions.

#pagebreak()

// -------------------- SOMMAIRE --------------------
#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}
#show outline.entry.where(
  level: 2
): it => context {
  if is_wip.at(it.element.location()) {
    let body = it.body() + text(red)[ (WIP)]
    link(
      it.element.location(),
      it.indented(
        it.prefix(),
        body + sym.space + box(width: 1fr, it.fill) + sym.space + sym.wj + it.page()
      )
    )
  } else [ #it  ]
}

#outline(title: "Sommaire", depth: 2, indent: 10pt)

// now enable the real template
#show :template

// And include everything! 
#include "src/all.typ"


// Glossary doesn't work :c
/*
= Glossaire

#import "@preview/gloss-awe:0.0.5": *
#import "src/glossary-pool.typ": glossary-pool
#pagebreak()
#set text(font: ("Arial", "Trebuchet MS"), size: 8pt)
#columns(2)[
    #make-glossary(glossary-pool)
]


*/