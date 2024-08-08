#import "../lib.typ": *
#show heading: heading_fct
#import "@preview/diagraph:0.2.1": *

Les graphes $G=(V,E)$ sont ici tous non orientés, on a donc $E$ qui est un ensemble de couples respectant $forall (x,y) in E, (y,x) in E$.

Pour tout $G=(V,E)$ un graphe, on note $Delta(G) = max{ deg s : s in V }$. Soit $G=(V,E)$ un graphe, on dit que $I subset.eq V$ est un _indépendant_ si $I^2 sect E = emptyset$.

Vous avez le choix de la structure de données utillisé pour stoquer le graphe pour les questions d'algorithmique. On introduit le problème *Maximum Independant Set (MIS)* :

#problem([*Maximum Independant Set (MIS)*],[Un graphe $G=(V,E)$],$max_(I subset.eq V) {|I| : I^2sect E = emptyset}$)


#question(3)[Montrer que si $Delta (G) = d$, il existe une $d$-approximation de *MIS* en $O(|S|^2)$.\
   On montrera la correction et la terminaison de l'algorithme.]

// #correct([])
#correct([

On considère l'algorithme suivant :
#rect(
$
&I <-- emptyset\
&"Tant que " exists x in V, forall j in I, {x,j} in.not E :\
&#h(20pt) T <-- I union {x}\
&"Fin tant que"\
&"Renvoyer" I
$)

L'algorithme termine bien ($I$ grandit strictement en cardinal à chaque itération, et si $I=V$ alors la boucle termine), et $I$ est bien un indépendant (chaque élément ajouté est indépendant avec ceux déjà présent, donc pour tout paire dans $I$, en considérent celui qui a été ajouté en dernier, l'arc entre les deux éléments n'existe pas).

On note $"GLOU"$ l'ensemble associé à la solution retourné par cet algorithme, et on note $"GLOU"^*$ un indépendant maximum. On note aussi $W(T)$ le voisinage de $T subset.eq V$ (qui contiens $T$).

On remarque d'abord que $W("GLOU") = S$. Soit $x in "GLOU"$, alors $|W({x}) sect "GLOU"^*| <= d$ car sinon, ça indiquerai que les $d+1$ sommets du voisinages aurai été pris, dont $x$ et un de ses voisins (donc non indépendant, ce qui est absurde).

On a donc: 
	 $ |"GLOU"^*| = |"GLOU"^* sect V| &= |"GLOU"^* sect sect.big_(x in "GLOU") W({x})|\ &<= sum_(x in "GLOU") |"GLOU"^* sect W(x)| <= d|"GLOU"| $
	 C'est bien une $d$-approximation.
	 $square$
])
   
On dit que $G'=(V',E')$ est un _sous-graphe_ de $G$ si $V' subset.eq V$ et que $E' subset.eq E sect V'^2$ \
On dit que $G$ est _$d$-dégénéré_ si tout sous-graphe de $G$ contiens un sommet de degrée inférieur ou égal à $d$


#question(3)[Montrer que si $G$ est $d$-dégénéré, alors il existe une $d$-approximation en $O(|S| times |E|)$]

// #correct([])
#correct([
  On garde la même notation pour les voisinages.

  #rect(
  $
  &I <-- emptyset\
  &"Tant que " W(I) != V :\
  &#h(20pt) x <-- "Sommet de degrée le plus etit dans " V \\ W(I) \
  &#h(20pt) I <-- I union {x} \
  &"Fin tant que"\
  &"Renvoyer" I
  $)
  
  L’algorithme 2 termine et renvoie bien un indépendant pour les mêmes raisons que pour la question 1. On note $"GLOU"^∗$ une solution optimale.
  
  A chaque itération, on est assuré que le sommet choisi est de degrée inférieur à d dans le sous-graphe $V \\ W(I)$ : donc pour chaque $x ∈"GLOU"$ que l’on rajoute, l’on igniore au pire $d$ éléments de $"GLOU"^∗$ (l’on ne peut pas en ignorer $d + 1$ pour les mêmes raisons qu’à l’exercice d’avant). On a donc un invarient de boucle : $|W(I) sect "GLOU"∗| <= d |I|$ qui est ce que l'on veut à la fin de l'execution.
])

=== Approximation de la $k$-coloriabilité

On dit qu'un graphe $G = (V,E)$ est _$k$ coloriable_ s'il existe une fonction $c: V -> [|0;k[|$ tel que $forall (u,v) in E, c(u) != c(v)$. On note $chi (G)$ le plus petit $k$ tel que $G$ soit $k$-coloriable.

#question(2)[Montrer que tout graphe $G$ est $Delta (G)+1$ coloriable. Donner un algorithme qui le colorie en temps $O(Delta (G) times |E|)$]

// #correct([])
#correct([
  L’idée est que l’on prend des sommets de degrées $Delta(G)$ que l’on colorie en la $Delta(G) + 1$-ème couleur.

  #rect(
  $
  &T <-- [0,0,...,0]\
  &"Pour " i <-- Delta(G),...,1,0 :\
  &#h(20pt)"Tant qu'il existe un " v in V "avec" d_V(v) = i :\
  &#h(40pt) T[v] <-- i \
  &#h(40pt) V <-- V \\ {v} \
  &#h(20pt)"Fin tant que"\
  &"Fin pour"\
  &"Renvoyer" T
  $)
  On notera $d_X (e)$ le degrée su sommet $e$ dans le sous-graphe $X$ 
  
  On montre que la boucle For possède deux invarients :
  1. $V$ est un graphe de degré maximum $i$
  2. Tout les sommets hors de $V$ sont bien coloré (il n’y a pas 2 sommets de même couleur cote à cote).
  
Concernant le premier invarient : La boucle $bold("Tant que")$ ne termine que quand la première condition est respectée.

Pour la deuxième condition, on remarque que si pour une arête $(x, y)$, on ai que $x$ et $y$ a été coloré par la même couleur (et l’on suppose que x a été coloré avant), c’est absurde car $d_(V\\{x})(y) = d_V (y)-1 = d_V (x)-1$ (en retirant x on décrémente le degrée de y, donc il sera
coloré d’une autre couleur).
L’algorithme renvoie bien un coloriage (tout les sommets on été choisi) car à la i-ème itération l’on prend tout les sommets de degrée $Delta(G)-i$ (et on abaisse des degrées)

Pour la terminaison, chaque boucle $bold("Tant que")$ termine car V décrémente de 1 à chaque itération de la boucle $bold("Tant que")$
])

#question(2)[Montrer que tout graphe $G$ _d_-dégénéré est $d+1$ coloriable. Donner un algorithme qui le colorie en temps $O(Delta (G) times |E|)$]


#correct([Le même algorithme fonctionne pour les même raisons. En effet, on n’utillise seulement dans la justification que le degrée dans le nouveau sous-graphe baisse.])

=== La $k$-coloriabilité avec des sommes

Soit $G = (V,E)$ un graphe, pour $S subset.eq V$, on pose $G[S] = (S,E sect S^2)$ le sous-graphe _induit_ par $S$.

On note $delta(S) = |{I subset.eq S | I "indépendant dans " G[S]}|$ le nombre d'indépendant dans $S$.

#question(2)[Montrer que l'on peut calculer en $O(n 2^n)$ la liste des $(delta(S))_(S subset.eq V)$]

#correct([
  Prog dyn sur les cardinaux pour calculer $delta(S)$:
  - $delta(S) = delta(S -{x}) + delta(S-N(x)-{x})$ avec $N(x)$ les voisins de $x$. Trouver les voisin est en $O(n)$, d'où la complexité.
])
#question(1)[Montrer que pour tout ensemble $X$ fini non vide, $sum_(S in cal(P)(X)) (-1)^(|S|) = 0$]

#correct([
  Par récurrence sur le cardinal, on montre qu'il existe autant de partie de cardinal paire que de parties de cardinal impair: 
  - Vrai pour $X = {x} = 1-1$ car $cal(P)(X) = {emptyset, {x}}$
  - Et pour $cal(P)(X union {x}) = { P subset.eq cal(P)(X) | x in P } union { P subset.eq cal(P)(X) | x in.not P }$. On sépare la somme et ça fonctionne.
])
#question(3)[ Montrer que
$ sum_(S subset.eq V) (-1)^(|S|)delta(S)^k != 0 <=> G "est" k-"coloriable" $
]

#correct([
$ sum_(S subset.eq V) (-1)^(|S|)delta(S)^k
&= sum_(S subset.eq V) (-1)^(|S|) underbrace(sum_(I_1 "indep de" S) ... sum_(I_k "indep de" S),k "fois")1 \
&= sum_(I_1 "indep de" S) ... sum_(I_k "indep de" S) sum_( union.big_(i =1)^k I_i subset.eq S) (-1)^(|S|)  \
&= sum_(I_1 "indep de" S) ... sum_(I_k "indep de" S) sum_( U in cal(P)(S\\ union.big_(i =1)^k I_i)) (-1)^(|union.big_(i =1)^k I_i union.sq U|)  \
&= sum_(I_1 "indep de" S) ... sum_(I_k "indep de" S) (-1)^(|union.big_(i =1)^k I_i|)sum_( U in cal(P)(S\\ union.big_(i =1)^k I_i)) (-1)^(|U|)  \
&= sum_(I_1 "indep de" S) ... sum_(I_k "indep de" S) (-1)^(|union.big_(i =1)^k I_i|)delta_((V - union.big_(i =1)^k I_i) != emptyset)\
&= sum_(I_1 "indep de" S) ... sum_(I_k "indep de" S) (-1)^(|union.big_(i =1)^k I_i|)delta_(V = union.big_(i =1)^k I_i) \
&= (-1)^(|V|)sum_(I_1 "indep de" S) ... sum_(I_k "indep de" S) delta_(V = union.big_(i =1)^k I_i)
$
Qui est non nul si et seulement si au moins un terme de la somme est non nul (et forcément positif), donc s'il existe $k$ indépendants recouvrant le graphe. C'est équivalent à être $k$-colorable.
])