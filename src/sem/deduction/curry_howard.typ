#import "../../lib.typ": *
#show heading: heading_fct

#let zstack(..args) = {
  $med med$
  for arg in args.pos() {
    place(center + horizon, arg)
  }
  $med med$
}
#let unpl = $zstack(union, text(#0.6em, +))$

== Correspondance de Curry-Howard

#let env = $cal(E)$

On commence par rappeler les règles du fragment _implicatif_ de la logique du premier ordre.

$ quad ()/(Gamma, A tack A) quad (#smallcaps("Ax")) quad quad
  quad (Gamma, A tack B) / (Gamma tack A -> B) quad (scripts(->)_i) quad quad
  quad (Gamma tack A -> B quad Gamma tack A) / (Gamma tack B) quad (scripts(->)_e)
$

On considère ensuite le problème du typage de `OCaml` (une toute petite partie). 
On exprimera le jugement "`x` est de type `A` dans l'environnement $env$" comme $env tack x : A$.
L'environnement est un dictionnaire et par défaut il ressemble à $[0 : #`int`, #"\"hello\"" : #`string`, ...]$.
On note l'ajout à un dictionnaire comme $env unpl [x : t]$.

#q(0)[Proposer une règle analogue à #smallcaps[Ax] pour le typage.]

#q(1)[En prenant $(env unpl [x : t] med tack med e : t')/(env med tack #`fun` x #`=>` e : t -> t') med (#smallcaps("Abs"))$
  pour le typage d'une fonction, proposer une règle de typage pour l'application.]

#q(1)[Dériver un typage pour `(fun x => x) (fun x => 5)`.]

On rapelle les règles du _fragment multiplicatif_ de la logique du premier ordre.

$ quad (Gamma tack A quad Gamma tack B) / (Gamma tack A and B) quad (and_i) quad quad
  quad (Gamma tack A and B) / (Gamma tack A) quad (and_e^g) quad quad
  quad (Gamma tack A and B) / (Gamma tack B) quad (and_e^d)
$

#q(1)[Proposer une règle de typage pour les paires (`a * b`).]

#q(1)[Proposer une règle de typage pour `fst` and `snd`.]

$ quad (Gamma tack A) / (Gamma tack A or B) quad (or_i^g) quad quad
  quad (Gamma tack B) / (Gamma tack A or B) quad (or_i^d) quad quad
  quad (Gamma tack A or B quad Gamma, A tack C quad Gamma, B tack C) / (Gamma tack C) quad (or_e)
$

#q(2)[En suivant les questions précédentes, déterminer le type correspondant à la disjonction.]

#q(2)[Comment interpréter la règle d'élimination ? En déduire une règle de typage.]

On rappelle enfin les règles de la quantification universelle.

$ quad (x in.not "vl"(Gamma) quad Gamma tack P(x)) / (Gamma tack forall x, P(x)) quad (forall_i) quad quad
  quad (Gamma tack forall x, P(x)) / (Gamma tack P(t)) quad (forall_e)
$

#q(2)[Proposer des règles de typage correspondantes puis les interpréter.]

#q(1)[Dériver deux typages de `fun x => x`.]

#q(2)[Peut-can directement déduire une correspondance avec la quantification universelle ?]
