#import "../../lib.typ": *
#import "@preview/tiptoe:0.3.2": *
#show heading: heading_fct

== Langages à saut

#let zstack(..args) = {
  $med med$
  for arg in args.pos() {
    place(center + horizon, arg)
  }
  $med med$
}
#let jump = zstack([ ], box({
  arc(
    tip: triangle.with(length: 1.5pt, width: 2pt, stroke: 0.4pt),
    angle: -160deg,
    arc: 145deg,
    radius: 4pt,
    stroke: 0.4pt
  )
}))
#let jums = $zstack(star, jump)$

Soit $cal(A) =: (Sigma, Q, delta, q_i, F)$ un automate fini.
Si $w,x,y,z in Sigma^star$, $q,r in Q$ et $a in Sigma union {epsilon}$,
alors on note $(x,q, a y) jump (z,r,w)$ lorsque $(q,a,r) in delta$ et $x y = z w$.
Enfin, on écrira $a jums b$ si un nombre fini de $jump$ relie $a$ à $b$.

#let las = $cal(L)_jums$

On définit le langage des sauts de $cal(A)$ comme $las(cal(A)) := { u v in Sigma^star : exists f in F, (u,q_i,v) jums (epsilon, f, epsilon) }$.

#let lab = $cal(L)_(a b)$

Soit $lab := { u in Sigma^star : abs(u)_a = abs(u)_b }$.

#q(2)[Montrer que #lab n'est pas rationnel.]

#q(2)[Donner $cal(A)$ tel que $lab = las(cal(A))$.]

#let perm = $frak(S)$
#let perml = $perm(cal(L))$

On note $perml$ l'ensemble des permutations de mots de $cal(L)$.

#q(2)[Si $cal(L)$ est régulier, $perml$ l'est-il ?]

#q(1)[Montrer que si $cal(L)$ est fini, $perml$ est rationnel.]

#q(2)[Que dire de la réciproque ?]

On suppose $Sigma = {a,b}$.

#q(2)[Montrer que si $cal(L) subset a^star b^star$ est régulier, alors $perml$ l'est aussi.]
