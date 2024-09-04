#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

#import "@preview/cetz:0.2.2"



On dit qu'une relation $cal(R)$ sur $E$ est un ordre strict si :
- $forall x in E, not (x cal(R) x) $ (*$cal(R)$ est antiréfléxif*)
- $forall x,y,z in E, x cal(R) y and y cal(R) z => x cal(R) z$ (*$cal(R)$ est transitif*)

On dit qu'une relation d'ordre strict $cal(R)$ sur $E$ est un _bon ordre_ strict si pour toute partie $S subset.eq E$ non vide, $S$ admet un plus petit élément. On dit qu'un ensemble $E$ est _transitif_ si $forall X in E, X subset.eq E$.

Un _ordinal_ est un ensemble transitif $alpha$ tel que $(alpha, in)$ est un bon ordre strict

=== Introduction

On défini $[0] := emptyset$ et pour tout $n$ on pose $$

=== Construction de $omega_1$

=== Alephs

=== Calcul de cardinaux

=== Axiome de régularité