#import "template.typ": pset
#import "lib.typ": *


#show: pset.with(
  title: "REQUIN",
  author: "Coda & Juliette",
  date: datetime.today(),
  // collaborators: ("Ben Bitdiddle", "Louis Reasoner")
)

#show: it => show-extra(it)

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
- #levels_emojis.at(0) : Question d'introduction servant à s'approprier l'énoncé
- #levels_emojis.at(1) : Question classique ou pouvant être résolue en déroulant une méthode simple
- #levels_emojis.at(2) : Question nécessitant un raisonnement plus complet ou une astuce, mais à la portée de tous
- #levels_emojis.at(3) : Question difficile du sujet demandant une réflexion posée ou une bonne intuition
- #levels_emojis.at(4) : Question très difficile pour les plus courageux qui n'ont pas peur de réfléchir longtemps
- #levels_emojis.at(5) : Question ouverte à la connaissance des autrices, ou de difficulté déraisonnable


// *Notation de cet ouvrage*
*Notations*

#figure(block(width: 90%,
  table(columns: (1fr, 5fr), inset: 7pt,
    $x := a$, [Définition de $x$ comme $a$],
    $NN, ZZ, QQ, RR$, [Respectivement les entiers naturels, relatifs, nombres rationnels et réels],
    $[n]$, [L'ensemble des entiers naturels de $1$ à $n$],
    $frak(P)(A)$, [L'ensemble des parties de $A$],
    $frak(P)_f (A)$, [L'ensemble des parties finies de $A$],
    $binom(A, k)$, [L'ensemble des sous-ensembles de taille $k$ de $A$],
    $A^B$, [L'ensemble des fonctions de $B$ dans $A$],
    $A union.sq B$, [L'union disjointe de $A$ et $B$, présuppose $A sect B = emptyset$],
    $T[i]$, [Le $i$#super("ème") élément du tableau $T$],
    $G = (S,A)$, [Graphe $G$ de sommets $S$ et d'arêtes $A$],
    $G[S']$, [Sous-graphe de $G$ induit par $S'$],
    $K_n$, [Le graphe complet à $n$ sommets],
    $K_(n,m)$, [Le graphe biparti complet sur $n+m$ sommets],
    $Sigma^star$, [L'étoile de Kleene sur l'alphabet $Sigma$],
    $epsilon$, [Le mot vide],
    $abs(w)$, [Longueur du mot $w$],
    $abs(w)_a$, [Nombre d'occurrences de la lettre $a$ dans le mot $w$],
    $tilde(w)$, [Miroir du mot $w$],
    $cal(O), Omega, Theta$, [Notations de Landau],
)))

#pagebreak()

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
== Tableaux autoréférents
#include "algo/autoref.typ"
== Problème subsetsum 
#include "algo/subsetsum.typ"
== Fenêtre glissante
#include "algo/window.typ"
== Approximation dans les graphes
#include "algo/aprox.typ"
== Théorème de Cook-Levin
#include "algo/cook.typ"

== Lemme d'isolation (en cours d'écriture)
#include "algo/isolation-lemma.typ"

== Écrous et boulons
#include "algo/nuts-and-bolts.typ"

== Algorithme des fleurs d'Edmonds <blossom>
#include "algo/blossom-algorithm.typ"

== Décomposition de Dulmage-Mendelshon
#include "algo/dulmage-mendelsohn.typ"

== Arbres couvrants minimaux et contractions
#include "algo/mst-contraction.typ"

= Arbres & Graphes
== Mots univers
#include "graph/univers.typ"
== Graphes $k$-réguliers et couplages
#include "graph/k_regular.typ"
== Coloration d'aretes
#include "graph/col_arr.typ"
== Couplages
#include "graph/couplages.typ"
== Théorème de Turán
#include "graph/turan.typ"
== Arbres croissants
#include "graph/croissant.typ"
== Lemme de König
#include "graph/konig.typ"
== Morphisme de Graphes (en cours d'écriture)
#include "graph/morph.typ"
== Graphes Infinis
#include "graph/infini.typ"
== Théorème de Kruskal
#include "graph/kruskal-tree.typ"
== Calcul différentiel extérieur en montagne (en cours d'écriture)
#include "graph/ext-calc.typ"

== Largeur de bande
#include "graph/bandwidth.typ"

== Graphes temporels
#include "graph/temporal-graphs.typ"

== Coupe maximum et dualité planaire
#include "graph/max-cut-duality.typ"

== Largeur d'arbre
#include "graph/tree-width.typ"

= Langages formels
== Language permuté et inclusions
#include "lang/inclusions.typ"
== Automates d'arbres
#include "lang/auto_arbre.typ"
== Language continuables
#include "lang/continuables.typ"
== Puissance et racine de languages
#include "lang/pow_sqrt.typ"
== Théorème de Chomsky-Schützenberger
#include "lang/chompsky_schu.typ"
== Monoïde syntaxique
#include "lang/mon-syn.typ"
== Dangling else
#include "lang/dangling.typ"

== Origami et cactus
#include "lang/origami-cactus.typ"

== Factorisation de langages
#include "lang/unique-factorization.typ"

== Mots primitifs et langages sans étoile
#include "lang/primitive-star-free.typ"

== Langages partiellement commutatifs
#include "lang/traces.typ"

== Grammaires contextuelles
#include "lang/context-sensitive-grammars.typ"

== Problème de Frobenius et langages liés
#include "lang/frobenius-coin-problem.typ"


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
== Espaces vectoriels calculables
#include "calc/ev.typ"

== Arithmétique de Presburger
#include "calc/presburger-arithmetic.typ"

== Circuits réversibles
#include "calc/reversible-circuits.typ"

= Logique
== Compacité
#include "log/compacite.typ"
== Système à la Hilbert
#include "log/hilbert.typ"
// == SAT et typage
// #include "log/sat-types.typ"
== Modèles non-classiques
#include "log/nonclassical.typ"
== Logique temporelle
#include "log/temporal.typ"

= Langages fonctionnels
== Lambda calcul pour les nuls
#include "fonc/lc-nuls.typ"
== Composition monadique (en cours d'écriture)
#include "fonc/comp-monade.typ"
// == Optique des données
// #include "fonc/optique.typ"
== Calculs paresseux
#include "fonc/paresse.typ"

== Topologie des semi-décidables
#include "fonc/semidecidable-topology.typ"

= Mathématiques pour l'informatique
== Monoïdes libres, langages et actions
#include "math/semigroupes-et-langages.typ"
== Monoïdes et relations de Green
#include "math/green.typ"
== Méthode probabiliste <meth-proba>
#include "math/methode-probabiliste.typ"
== Théorème du point fixe de Lawvere (en cours d'écriture)
#include "math/lawvere.typ"
== Séries génératrices et formelles
#include "math/series.typ"
== Récurrence bien fondée
#include "math/well_founded.typ"
== Ordinaux (en cours d'écriture)
#include "math/ordinaux.typ"
