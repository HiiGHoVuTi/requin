#import "../lib.typ": *
#show heading: heading_fct


Soit un _demi-groupe_ $(S, +)$, c'est-à-dire que
#align(center, grid(columns: (1fr, 1fr), 
[- $S$ est stable par $+$],
[- La loi $+$ est associative]))

Soit $L in S^[|1, n|]$ une liste d'éléments de $S$, et $w <= n$.


=== Un algorithme insatisfaisant

#question(0)[Justifier que `String` est un demi-groupe. Pour quelle loi ?]
#question(0)[Est-il possible d'avoir un demi-groupe sans élément neutre ?]


On définit la liste $W$ de longueur $n - w + 1$,
$ W[i] := sum_(k=0)^(w - 1) L[i + k] $

#question(0)[Si $L = ["a", "b", "c", "d", "e", "f"]$ et $w=3$, que vaut $W$ ?]
#question(0)[Déterminer un algorithme qui calcule la liste $W$.]

=== Souvenirs, souvenirs

#question(2)[En considérant $W[2],W[3],...$, déterminer un ordre judicieux d'évaluation de la somme $W[1]$.]
#question(2)[Dans le cas $w = n/2 + 1$, déterminer un algorithme s'exécutant en temps linéaire.]
#question(1)[En déduire un algorithme calculant $W$.]

Une complexité temporelle en $cal(O)(n)$ et spatiale en $cal(O)(w)$ sont attendues.

// TODO(Juliette): mettre les réponses en #correction
// 0. `String` est un demi-groupe pour la loi de concaténation.
// 1. $(NN^star, +)$ est un demi-groupe sans être un monoïde.
// 2. $W = ["abcd", "bcde", "cdef"]$.
// 3. De la brutalité.
// 4. Il est judicieux de calculer $W$ comme $"a "("b "("c "("d "("e f"))))$ 
// 5. On calcule la première moitié à l'envers, la deuxième à l'endroit, et on combine
// ```Haskell
// solution liste =
//   let (gauche, droite) = split liste in 
//   zipWith (+) 
//     (scanR (+) gauche) 
//     (scanL (+) droite)
// ```
// 6. On segmente par blocs de taille $w-1$.


