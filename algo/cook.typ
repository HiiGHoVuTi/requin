
#import "../lib.typ": *
#show heading: heading_fct

Dans ce problème, on cherche à démontrer un des résultats les plus importants dans l'étude de la NP-complétude : le problème SAT est NP-complet.

Dans ce sujet, on notera $bb(2) := {0,1}$ qu'on identifiera à l'ensemble des booléens.

=== Caractérisation de NP

On rappelle qu'on considère les problèmes de décision : reconnaître une partie de $bb(2)^star$.

#question(0)[Justifier le choix de $bb(2)^star$ comme seul type d'entrée possible, et que les programmes solutions à des problèmes de décision sont des fonctions _totales_ de $bb(2)^star$ dans $bb(2)$.]

#question(0)[Rappeler la définition rigoureuse de NP avec les certificats.]

On appelle _programme non déterministe_ un programme prenant comme argument en plus de son entrée une suite `oracle : int -> bool` ; on considère que l'appel à `oracle` est une opération atomique. 

On dit qu'un programme non déterministe résout un problème lorsqu'il existe une suite `oracle` telle que le programme classique associé résout le problème.

#question(0)[Montrer qu'un problème est résoluble en $cal(O)(f(n))$ par un programme classique l'est également par une machine non déterministe.]

#question(1)[Si un le coût programme non déterministe est majoré par un polynome en la taille de son entrée, montrer que son nombre d'appels à `oracle` est aussi majoré par un polynome en la taille de son entrée.]

#question(2)[Justifier que tous les $m$ appels à `oracle` peuvent être faits en premier, et seulement sur les valeurs $[|1, m|]$.]

#question(2)[Montrer que la classe NP est précisément la classe des problèmes résolvables en temps polynomial par un programme non déterministe.]

=== Circuits booléens

Un _circuit booléen_ est un graphe orienté acyclique muni d'un sommet de degré sortant nul appelé _sortie du circuit_ et où chaque sommet de degré entrant non nul dispose d'une fonction booléenne avec autant d'entrées que son degré entrant et une sortie. Les sommets de degré entrant nul sont appelées _entrées du circuit_, et on notera $n$ leur nombre.

#question(0)[Proposer une manière d'évaluer un circuit booléen sur une entrée de $bb(2)^n$.]

On se munit des fonctions logiques AND, OR et NOT (on les notera $and, or, not$ dans les équations). On appellera un circuit _simple_ un circuit booléen étiqueté uniquement par ces fonctions.

#question(1)[Montrer que les fonctions booléennes de deux arguments ou moins sont calculables par un circuit simple.]

#question(1)[#upper("é")tant donnés deux circuits simples $A$ et $B$, donner un circuit simple calculant $ "if"_(A,B) := z,x_1...x_n,y_1...y_m |-> cases(A(x_1...x_n) "si" z=1, B(y_1...y_m) "sinon") $]

#question(2)[#upper("é")tant donné un circuit booléen, donner un circuit simple de taille polynomial en sa taille calculant la même fonction.]

#question(3)[#upper("é")tant donné un circuit simple sur $n$ entrées, donner une formule propositionnelle sur $n$ variables en CNF de taille polynomiale s'évaluant en le même résultat.]

=== Conclusion

#question(0)[Montrer que SAT est de classe NP.]

Soit $P in frak(P)(bb(2)^star)$ un problème de classe NP, et $x in bb(2)^n$ une instance de $P$.

#question(2)[Montrer qu'il existe un circuit booléen qui est satisfiable par $x$ si et seulement si $x$ est une instance positive.]

#question(1)[Montrer qu'il existe une instance de SAT qui est positive si et seulement si $x$ l'est.]

#question(1)[En déduire le théorème de Cook-Levin. \ _On fera attention à la taille des différents objets._]
