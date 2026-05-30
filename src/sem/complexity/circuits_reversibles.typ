#import "../../lib.typ": *
#import "@preview/fletcher:0.5.6" as fletcher: diagram, node, edge
#show heading: heading_fct

== Circuits réversibles

#let sc(x) = text.with(font: "linux libertine")(smallcaps(x))

#let nott = sc("Not")
#let cnot = sc("CNot")
#let toffoli = sc("Toffoli")

#rect[
  On identifie les booléens à $FF_2 := ZZ slash 2 ZZ$. L'opération "XOR" correspond à l'addition. On définit trois portes logiques :
  #figure(table(columns: 3,
  $nott(a) = 1 - a$,
  $cnot(a,b) = (a, a+b)$,
  $toffoli(a,b,c) = (a,b,a b + c)$,
  diagram($
    a edge("r", ">-") & plus.circle edge("r", "->") & 1-a
  $),
  diagram($
    a edge("r", ">-") & circle.filled edge("d", "-") edge("r", "->") & a \
    b edge("r", ">-") & plus.circle edge("r", "->") & a + b
  $),
  diagram($
    a edge("r", ">-") & circle.filled edge("d", "-") edge("r", "->") & a \
    a edge("r", ">-") & circle.filled edge("d", "-") edge("r", "->") & b \
    c edge("r", ">-") & plus.circle edge("r", "->") & a + b c
  $),
  ))
  On appelle les $circle.filled$ les _contrôles_ de la porte.
  Un _circuit_ est une séquence de portes logiques appliquées sur $n$ bits d'entrée afin de produire $n$ bits de sortie. 
  #upper("à") un circuit $cal(C)$ on associe donc une fonction $f_cal(C) : FF_2^n -> FF_2^n$. On appelle _circuit composé_ de $cal(C)$ et $cal(C)'$ le circuit réalisant $f_cal(C') compose f_cal(C)$.

  Par exemple, le circuit suivant implémente $(a,b,c,d) |-> (1 - (a + b c), b, a + c + b c, c + d)$
  #figure(
  diagram($
  	a edge("r", ">-") & edge("d", "-") plus.circle edge("r", "-")                        & edge("r", "-")                  & edge("r", "-") circle.filled edge("d", "-") & edge("r", "->") plus.circle \
  	b edge("r", ">-") & edge("d", "-")circle.filled   edge("r", "-") & edge("r", "-")                  & edge("r", "-") edge("d", "-")  & edge("r", "->") \
  	c edge("r", ">-") &               circle.filled   edge("r", "-") & edge("r", "-") circle.filled                  & edge("r", "-") plus.circle     & edge("r", "->") \
  	d edge("r", ">-") &                  edge("r", "-") & edge("u", "-") plus.circle edge("r", "-") & edge("r", "-")                 & edge("r", "->") \
  $))
]


#q(1)[Montrer que tout circuit réversible $cal(C)$ constitué d'une seule porte implémente une permutation. Donner leur inverse.]
#q(1)[Comment implémenter l'inverse d'un circuit quelconque ?]
#q(2)[Montrer que dans circuit sur $n$ bits, une porte de #toffoli à $n-2$ contrôles peut être implémentée à partir d'une porte de #toffoli à $n-3$ contrôles et de portes de #toffoli.]

On cherche à démontrer le théorème suivant : pour $n >= 7$, une permutation $Pi$ de $FF_2^n$ est paire si et seulement si il existe un circuit $cal(C)$ avec $f_cal(C) = Pi$.
On rappelle qu'une permutation est paire lorsque sa signature est positive, si et seulement si ses décompositions en transpositions sont de taille paire.

#q(1)[Donner des contre-exemples pour $n in {2, 3}$.]

#q(2)[Soit $cal(C)$ un circuit sur $n >= 4$ bits ne comportant qu'une porte logique. Soit $S$ l'ensemble des cycles de $f_cal(C)$.
  - Montrer qu'il existe $S_1 union.sq S_2 = S$ et une bijection $S_1 <-> S_2$ préservant la longueur des cycles.
  - En déduire un sens du théorème.]

#q(2)[Démonter les lemmes suivants :
  - Soit $n >= 4$ puis $a,b in FF_2^n$ avec $a!=b$. Montrer qu'il existe un circuit $cal(C)$ n'utilisant que les portes #nott et #cnot tel que $f_cal(C) (a) = (1...1)$ et $f_cal(C) (b) = (0,1...,1)$.
  - Soient $c,d in FF_2^(n-1)$ avec $c!=d$. Montrer qu'il existe un circuit $cal(C)$ tel que $f_cal(C)$ est la paire de transpositions $((0,c) (0,d)) med ((1,c) (1,d))$.
  - Si $Pi$ est une permutation de $FF_2^n$ laissant au moins un bit invariant, il existe un circuit $cal(C)$ tel que $Pi = f_cal(C)$.]

#q(3)[Montrer que pour $n >= 6$, toute permutation paire de $FF_2^n$ peut s'écrire comme produit de paires de transpositions disjointes, c'est-à-dire :
$ Pi = product^k_(i=1) (a_i b_i)med(c_i d_i) quad "et" quad forall i in [|1, k|], "card"{a_i,b_i,c_i,d_i} = 4 $]

#q(3)[Soit $n >= 7$ puis $x,y,z,t in FF_2^n$ distincts deux-à-deux. Montrer qu'il existe $cal(C)$ qui implémente $Pi$ :
$ Pi(x) = (0,0,1...1) quad Pi(y) = (0,1,1...1) quad Pi(z)=(1,0,1...1) quad Pi(t)=(1,1,1...1) $]

#q(2)[Conclure.]
