#import "../../lib.typ": *
#show heading: heading_fct

== Solitaire

On considère $Sigma := {a,b,c}$. Un _bloc_ d'un mot est un facteur de taille $3$ ou plus maximal composé d'une même lettre.
On définit $-> med subset.eq Sigma^star times Sigma^star$ où $u b v -> u v$ si $b$ est un bloc de $u b v$.
On dit que $w in Sigma^star$ est _gagnant_ lorsque $w -> ... -> epsilon$.

#q(1)[Montrer que $a b b c c c c c b b b a a a a$ est gagnant.]

#q(1)[Montrer que $b c b b a a a b c b b c$ n'est pas gagnant.]

#q(1)[Montrer que les stratégies suivantes ne sont pas gagnantes :
  + Supprimer le premier bloc.
  + Supprimer le plus grand bloc.]

#q(2)[Montrer que l'ensemble des mots gagnants n'est pas rationnel.]

#q(2)[Montrer qu'il est algébrique.]

#q(2)[Qu'en est-il si $Sigma = {a,b}$ ?]

#let nf(w) = $frak(N)_#w$

Pour $w in Sigma^star$, on note $nf(w) := { u in Sigma^star : w -> ... -> u "et" exists.not v, med u -> v }$.

#q(2)[Montrer que $nf(w)$ est rationnel.]

Pour $L subset.eq Sigma^star$, on note $nf(L) := union.big_(w in L) nf(w)$.

#q(2)[Montrer que si $L$ est rationnel alors $nf(L)$ est algébrique.]

#q(3)[$star$ Que dire si $L$ est algébrique ?]
