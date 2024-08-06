#import "../lib.typ": *
#show heading: heading_fct

On dit que $(M,times)$ avec $M$ un ensemble est un monoïde s'il respecte 3 axiomes:
- $times$ est une loi de composition interne, aka $(times) : M^2 --> M$
- $times$ est associative, aka $forall a,b,c in M, (a times b) times c = a times (b times c)$
- Il existe un élément neutre, aka $exists e in M, forall x in M, x times e = e times x = x$

$(T, times_M)$ est un _sous-monoide_ de $(M, times_M)$ si on a $T subset.eq M$, on a $times_M (T^2) subset.eq T$ et que $T$ possède un élément neutre.

#question(0)[Montrer que $(Sigma^*, dot)$ est un monoide pour $Sigma$ un alphabet fini non vide et $(dot)$ la concaténation.]

#correct([
  On vérifie les axiomes : l'élément neutre est $epsilon$ et on a bien $u dot (v dot w) = (u dot v) dot w$.
])

#question(1)[Montrer que $({0,...,N}, max)$ est un monoide. En conclure sur si un sous-monoide d'un monoide $M$ doit posséder toujours le même élément neutre que $M$.]

#correct([
  On vérifie les axiomes : l'élément neutre est $0$ et on a bien $max (x, max(y, z)) = max(max(x, y), z)$.
  
  On remarque que ${1,...,N}$ est un sous-monoide, et son élément neutre est $1$, donc un sous-monoide n'as pas forcément le même élément neutre.
])

On dit que $x in M$ est idempotent si $x = x^2$. On se fixe un monoide $M$ fini.

#question(2)[Montrer que $exists N in NN, forall x in M, x^N$ est idempotent.]

#correct([
  Pour ça on pose $N = |M|!$, alors comme $M$ est fini, on considère soit $x in M$ la suite 
  $ x=x^1 --> x^2 --> x^3 --> ... --> x^i --> ... --> x^j $ 
  avec $x^i = x^j$. On a que $j<=|M|$ et que $i-j <= |M|$ donc que $i-j$ divise $|M|! = N$, et en posant $k = N/(i-j)$, on a $x^N = x^N.x^((i-j)k) = x^(2N)$.
])

=== Relations de Green

Le but de cette khôlle est de démontrer que dans tout monoide fini, on peut trouver un groupe pour la même loi que celle du monoïde.

On définit 4 relations d'ordre sur $(M,.)$ :
- $x <=_J y$ ssi $exists a,b in M, a x b = y $ la relation infixe.
- $x <=_L y$ ssi $exists a in M, x b = y $ la relation préfixe (L comme Left).
- $x <=_R y$ ssi $exists b in M, a x = y $ la relation postfixe (R comme Right).
- $x <=_H y$ ssi $x <=_L y and x <=_R y$ l'intersection de la relation préfixe et infixe.

Pour chaque relation d'ordre ($forall alpha in {J,L,R,H}$) on définit une relation d'équivalence par:
  $ x equiv_alpha y "ssi" x <=_alpha y and y <=_alpha x $

On appelle les _$alpha$-classes_ les classes d'équivalence pour $equiv_alpha$ pour $alpha in {J,L,R,H}$.
  
#question(2)[Donner les partitions en $alpha$-classes pour le monoide $({0,1,2}^{0,1,2}, compose )$ pour tout $alpha in {J,L,R,H}$]



#question(2)[Montrer que toute L-classe (respectivement R-classe) est incluse dans une J-classe.]
#question(2)[Montrer que les $alpha$-classes sont ordonnées entres elles pour tout $alpha in {J,L,R,H}$.]
#question(3)[Montrer que si $X$ est une J-classe, alors toutes les $L$-classes de $X$ (respectivement $R$-classes) sont incomparable, aka si $x,y in X$ et $x <=_L y$, on a $x equiv_L y$ ]
#correct([
  Soit $x,y in X$. On a alors $x equiv_J y$, on écrit donc $x = a y b$. De plus, on suppose $x <=_L y$, on a donc aussi $x c = y$. 
    
  Alors, en combinant les deux, on a $x = a y b = a x c b$. En itérant $N$ fois (le $N$ de la question 3), il viens que $x = a^N x (c b)^N = a^N x (c b)^(2N)$. On dépile maintenant (car $a x c b = x$) et on a $x = x (c b)^(N) = y b (c b)^(N-1)$, donc $y <=_L x$, donc $x equiv_L y$.
  
  Une preuve similaire fonctionne pour $<=_R$
])
#question(3)[Montrer que dans $X$ une J-classe toutes les $L$-classes de $X$ intersectent toutes les R-classes de $X$]

#correct([
  Soit $x,y in X$. On écrit $x = a y b$. On a donc que $x = (a y) b$ donc $a y <=_L x$ mais aussi $y <=_R a y$, donc par la question 7, on a $x equiv_L a y equiv_R y$ donc l'élément $a y$ est dans les deux classes, dont l'intersection est non vide.
])

#question(3)[Montrer que si $X$ est une J-classe maximale, si $H$ est une H-classe contenue dans $X$, alors on a la stabilité du produit dans $X$]
// TODO(Coda): correct

#question(2)[Montrer que si $X$ est une J-classe maximale, alors toutes les H-classe contenue dans $X$ sont des groupes]
#correct([
  On a la stabilité du produit, il nous manque que le neutre et l'inverse.
  //TODO(Coda): continue correct
])