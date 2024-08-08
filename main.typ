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


// -------------------- SOMMAIRE --------------------
#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}
#outline(title: "Sommaire", depth: 2, indent: 10pt)

// setup heading to the custom one
#show heading: heading_fct


= Algorithmique
== KMP
#include "algo/kmp.typ"
== Tableaux Autoréférents
#include "algo/autoref.typ"
== Problème Subsetsum 
#include "algo/subsetsum.typ"
== Fenêtre glissante
#include "algo/window.typ"
== Approximation dans les graphes
#include "algo/aprox.typ"

= Arbres & Graphes
== Mots univers
#include "graph/univers.typ"
== Bipartition induite
#include "graph/bipartition.typ"
== Coloration d'aretes
#include "graph/col_arr.typ"
== Théorème de Tùran
#include "graph/tùran.typ"
== Arbres croissants
#include "graph/croissant.typ"
== Lemme de König
#include "graph/konig.typ"

= Langages formels
== Language permuté et inclusions
#include "lang/inclusions.typ"
== Automates d'arbres
#include "lang/auto_arbre.typ"
== Language continuables
#include "lang/continuables.typ"
== Puissance et racine de languages
#include "lang/pow_sqrt.typ"


= Théorie des jeux
== Nim à choix
#include "jeux/nim_set.typ"
== ChipLiar Game
#include "jeux/chip-liar.typ"
== ChipFiring Game
#include "jeux/chip-firing.typ"

= Calculabilité
== Calculabilité et représentation d'ensembles infinis
#include "calc/ens_fct.typ"
== Oméga de Chaitin
#include "calc/chaitin.typ"

= Logique
== Compacité
#include "log/compacite.typ"

= Langages fonctionnels
== Lambda calcul pour les nuls
#include "fonc/lc-nuls.typ"
== Composition monadique
#include "fonc/comp-monade.typ"

= Mathématiques pour l'informatique
== Monoïdes libres, langages et actions
#include "math/semigroupes-et-langages.typ"
== Monoïdes et relations de Green
#include "math/green.typ"
== Méthode probabiliste
#include "math/methode-probabiliste.typ"
== Théorème du point fixe de Lawvere
#include "math/lawvere.typ"
== Séries génératrices et formelles
#include "math/series.typ"


= Glossaire

#import "@preview/gloss-awe:0.0.5": *
#import "./glossary-pool.typ": glossary-pool

#pagebreak()
#set text(font: ("Arial", "Trebuchet MS"), size: 8pt)
#columns(2)[
    #make-glossary(glossary-pool)
]
