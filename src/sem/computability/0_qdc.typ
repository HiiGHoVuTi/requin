#import "../../lib.typ": *
#show :template

#let q = it => q(0)[#it]

== Révisions du chapitre

Toutes les questions ici sont indépendantes et courtes.

=== Question du cours

#q[
Rapeller le problème de l'arret. Montrer qu'il est indécidable.
]

=== Hors-programme classique

Un problème est _semi-décidable_ s'il existe un algorithme qui termine et renvoie True pour toute les entrée positives, mais qui peut ne pas terminer pour toute les entrées fausse.

#q[
  Donner un exemple de problème semi-décidable non décidable et montrer qu'il est semi-décidable et pas décidable.
]

#q[
  Montrer qu'un problème est décidable ssi il est semi-décidable et co-semi-décidable.
]

#q[
  Donner un exemple de problème qui n’est pas semi-décidable et le prouver.
]

=== Questions simples

#q[
Montrer que le problème "Arret sur $epsilon$ <facile>" suivant est indécidable:
- *Entrée:* Un programme $P$
- *Sortie:* Est-ce que $P(epsilon)$ termine?]
#q[
Montrer que le problème "Arret sur $42$" suivant est indécidable:
- *Entrée:* Un programme $P$
- *Sortie:* Est-ce que $P(42)$ termine?]
#q[
Montrer que le problème "Non arret" suivant est indécidable:
- *Entrée:* Un programme $P$ et une entrée $w$
- *Sortie:* Est-ce que $P(w)$ ne termine pas?]
#q[
Montrer que le problème "Fonctions equivalentes" suivant est indécidable:
- *Entrée:* Deux programmes $P,Q$ prenant en entrée des naturels
- *Sortie:* Est-ce que pour tout $n in NN$, $P(n)$ termine ssi $Q(n)$ termine?]
#q[
Montrer que le problème "Arret-$exists$" suivant est indécidable:
- *Entrée:* Un programme $P$ prenant en entrée un naturel.
- *Sortie:* Est-ce qu'il existe un $n$ tel que $P(n)$ termine?]
#q[ 
Montrer que le problème "Arret-$forall$" suivant est indécidable:
- *Entrée:* Un programme $P$ prenant en entrée un naturel.
- *Sortie:* Est-ce que pour tout $n in NN$ on a $P(n)$ qui termine?]