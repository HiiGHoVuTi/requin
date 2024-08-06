#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

_"A generating function is a clothesline on which we hang up a sequence of numbers for display."_
#align(right, "- Herbert S. Wilf")

Si $u in AA^NN$ est une suite à valeurs dans un anneau $AA$, on peut définir une _série formelle_ $S in AA[[X]]$ comme $S := sum u_n X^n$.
On utilise alors la somme terme-à-terme et le produit de Cauchy pour munir $AA[[X]]$ d'une structure d'anneau. On a $AA[X] tilde.equiv AA^NN$.
On munit aussi $AA[[X]]$ de la composition et de la dérivation formelle.
On notera $AA((X))$ le _corps des fractions_ de $AA[[X]]$ si $AA$ est un corps.

=== Une mise en bouche

Dans cette partie, on choisit $AA := CC$.

Soit $F in CC((X))$ la série formelle associée à la suite de Fibonacci (l'unique suite $f$ telle que $f_0 = 0$, $f_1 = 1$ et $f_(n+2)=f_(n+1)+f_n$).

#question(0)[Calculer $F + X F$.]

#question(1)[En déduire $F = (-X)/(X^2 + X - 1).$]

#question(1)[En faisant un développement en éléments simples, en déduire la _formule de Binet_ donnant explicitement $f_n$.]

=== `ADT`, ou l'anneau des types

_À partir de cette partie, on travaille à la bijection près, mais sans s'autoriser à dénombrer les types polymorphes (du type `'a` en `OCaml`)._

On considère ici l'ensemble des types `OCaml`, qu'on notera `Type`.
On munit `Type` des deux lois de composition internes suivantes
#align(center, grid(columns: (1fr, 1fr), 
[- `type a+b = A of a | B of b`],
[- `type a*b = AB of a * b`]
))

#question(0)[Montrer que `int * (float + string) = int * float + int * string`.]
#question(1)[Montrer que l'on a muni `Type` d'une structure d'anneau.]
#question(0)[Définir le type `'a list` en `OCaml`.]
On note $1$ le type à un seul élément.

#question(1)[En déduire une équation vérifiée par $"list"(alpha)$.]
#question(1)[Résoudre cette équation dans $CC$. En déduire une expression de $"list"(alpha)$ sous forme de série.]
#question(0)[Interpréter ce résultat. Est-il cohérent ?]

=== Classes combinatoires

Une #gls(entry: "Classe combinatoire")[_classe combinatoire_] est un ensemble $cal(C)$ muni d'une fonction $"taille" = |dot| : cal(C) --> NN$ telle que pour tout $n in NN$, $"taille"^(-1)(n)$ est un ensemble fini.
On la munit d'une suite $c_n := |"taille"^(-1)(n)|$ (lettre minuscule) et de la série formelle $C_n in CC((X))$ (lettre majuscule droite).

On introduit les classes
#align(center, grid(columns: (1fr, 1fr, 1fr), 
[- $cal(E) = emptyset$],
[- $cal(Z) = {circle.filled}$, $|circle.filled|=1$],
[- $cal(N) = NN$, $|n| = n$]
))

#question(0)[Déterminer $E$, $Z$ et $N$.]

On munit les classes combinatoires d'une structures d'anneau grâce à leurs séries formelles.
On identifiera $k in NN$ et son équivalent dans l'anneau ainsi défini.

#question(1)[Comment interpréter les objets de $cal(A+B)$ ? De $cal(A times B)$ ?]

On pose $cal(P) := cal(N times N)$.

#question(2)[Déterminer combien il existe de paires d'entiers naturels dont la somme vaut $n$.]

#question(0)[Par analogie à un type `OCaml`, définir $cal(T)$ la classe combinatoire des arbres binaires.]

#question(2)[En déduire le nombre d'arbres binaires à $n$ noeuds.]

On introduit $compose$ l'opérateur de composition de séries formelles, étendu aux classes combinatoires.

#question(1)[Que représente la classe combinatoire $cal(N) compose cal(C)$ pour $cal(C)$ quelconque ?]

En considérant que $cal(N)$ est la classe des suites à support fini d'éléments indistinguables,

#question(1)[En déduire la signification de $cal(A compose B)$ en général.]

Soit $cal(B)$ une classe combinatoire, et $"MSet"(cal(B))$ la classe combinatoire des multi-ensembles d'éléments de $cal(B)$.

#question(3)[Montrer que la série associée à $"MSet"(cal(B))$ est $ exp( sum_(k=1)^oo B(z^k)/k ) $]

#correct[
  Chaque élément de $cal(B)$ peut apparaître un nombre arbitraire de fois dans $"MSET"(cal(B))$.
  $ "MSet"(cal(B)) = product_(k in NN) cal(N) compose b_k$
  ... à finir.
]
