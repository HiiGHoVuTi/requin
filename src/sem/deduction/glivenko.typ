#import "../../lib.typ": *
#show heading: heading_fct

== Théorème de Glivenko

On cherche à démontrer le théorème suivant :

#rect[
  *Théorème* (_Glivenko_) : Si $tack phi$ est dérivable si et seulement si $tack not not phi$ est dérivable sans l'absurde. #h(1fr)
]

On commence par rappeler les règles usuelles.
On rappelle aussi que $not phi eq.def phi -> bot$.
$ quad ()/(Gamma, A tack A) quad (#smallcaps("Axiome")) quad quad
  (Gamma tack bot)/(Gamma tack A) quad (#smallcaps("ExFalsoQuodlibet"))
$
$
  (Gamma tack A quad Gamma tack B) / (Gamma tack A and B) quad (and_i) quad quad
  (Gamma tack A and B) / (Gamma tack A) quad (and_e^g) quad quad
  (Gamma tack A and B) / (Gamma tack B) quad (and_e^d)
$
$
  (Gamma tack A) / (Gamma tack A or B) quad (or_i^g) quad quad
  (Gamma tack B) / (Gamma tack A or B) quad (or_i^d) quad quad
  (Gamma tack A or B quad Gamma, A tack C quad Gamma, B tack C) / (Gamma tack C) quad (or_e)
$
$
  (Gamma, A tack B) / (Gamma tack A -> B) quad (scripts(->)_i) quad quad
  (Gamma tack A -> B quad Gamma tack A) / (Gamma tack B) quad (scripts(->)_e)
$
$ (x in.not "vl"(Gamma) quad Gamma tack P(x)) / (Gamma tack forall x, P(x)) quad (forall_i) quad quad
  (Gamma tack forall x, P(x)) / (Gamma tack P(t)) quad (forall_e)
$
$ (Gamma tack P(t)) / (Gamma tack exists x, P(x) quad ) quad (exists_i) quad quad
  (x in.not "vl"(Gamma) union "vl"(C) quad Gamma tack exists x, P(x) quad Gamma, P(x) tack C) / (Gamma tack C) quad (exists_e)
$
$
  (Gamma, not A tack bot) / (Gamma tack A) quad (#smallcaps("ReductioAdAbsurdum"))
$

#q(1)[Montrer que $not not phi tack phi$ est dérivable. En déduire le sens facile du théorème.]

#q(2)[Montrer que $phi tack not not phi$ est dérivable sans l'absurde. Est-ce que cela suffit à conclure ?]

Si $Gamma$ est un ensemble de formules, on note $not Gamma := {not phi : phi in Gamma}$. Si $Gamma tack Delta$ est un séquent,
on appelle $G(Gamma tack Delta) := not not Gamma, not Delta tack bot$ sa transformée de Glivenko.

#q(2)[Montrer que si $S$ est dérivable sans l'absurde, alors $G(S)$ aussi.]

#q(2)[Montrer que si $S$ est dérivable alors $G(S)$ l'est sans l'absurde.]

#q(2)[Conclure la preuve du théorème.]

#q(2)[Montrer que si $tack not phi$ est dérivable alors il est dérivable sans l'absurde.]
