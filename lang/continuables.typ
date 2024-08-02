#import "../lib.typ": *

Soit $Sigma = {a,b}$. On dit que $w in Sigma^*$ est _primitif_ s’il n’existe pas de mot $u in Sigma^*$ et de $p>1$ tels que $w=u^p$

Un langage $L$ est dit _continuable_ si pour tout $u in Sigma^*$, il existe un $v in Sigma^*$ tel que $u v in L$


#question(0)[Pour chacun des cas suivants donner des exemples de langage sur $Sigma = {a,b}$:
  - Un langage infini régulier ne reconnaissant aucun mot primitif
  - Un langage infini régulier ne reconnaissant que des mots primitifs
  - Un langage infini régulier continuable
  - Un langage infini algébrique continuable ne reconnaissant que des mots primitifs
]

#correct([
  1.
    - Celui reconnu par l'expression rationnel $(a a)^*$ fonctionne 
    - Celui reconnu par l'expression rationnel $b a^*$ fonctionne 
    - Celui reconnu par l'expression rationnel $Sigma^*$ fonctionne 
    - Celui reconnu par la grammaire $S -> a S b | b S b | a $ 
])

#question(1)[Proposer un algorithme pour tester si un mot est primitif en $O(|w|^(3/2))$. _C'est possible de le faire en $O(|w|)$_]

#correct([
2. On peut se donner :
  #rect([$ 
    &"Si " (w = a^(|w|) or w = b^(|w|)) and |w|>1 " renvoyer NON-PRIMITIF"\
    &"Pour " p <-- 2,...,floor(sqrt(|w|)) "faire :"\
    &#h(20pt) "Si " p | |w| "alors faire :"\
    &#h(40pt) "Si " w = (w[0..p])^p "alors renvoyer NON PRIMITIF Fin si"\
    &#h(20pt)"Fin si"\
    &"Fin pour"\
    &"Renvoyer PRIMITIF"
  $])
  qui est en $O(|w| + sqrt(|w|)times |w|) = O(|w|^(3/2))$.

  La solution en $O(|w|)$ est en utillisant le tableau LPS. Une fois le tableau LPS calculé en $O(|w|)$, on fait juste la vérification en $O(|w|)$ de si LPS$[ |w| ]$ est une bonne puissance. Voir le sujet "Autour des préfixes" pour plus d'informations.
])

#question(1)[Étant donné un automate $A$, proposer un algorithme pour déterminer si le langage reconnu par $A$ est continuable.]

#correct([
3. Une fois l'automate déterministe complet crée, il suffit de vérifier si tout les états sont co-accesible. Un simple parcours depuis tout les états pour tester si on peut atteindre des états final suffit (ou un test d'un états puit).

  Cette CNS est vraie car si tout les états sont co-accesibles alors depuis n'importe que mot, on atteint un état depuis lequel il est possible d'aller vers un état final. Réciproquement, si $L$ est continuable, alors depuis chaque état il existe un chemin étiquetté par la continuation pour aller vers un état final.
])

#question(3)[Montrer que tout langage régulier continuable sur $Sigma = {a,b}$ contient une infinité de mots primitifs. Quelle est la condition sur $Sigma$ pour que cela soit vrai ?]

#correct([
4. Tout viens d'une chose : le fait que la continuation est bornée en taille.
   On considère le mot $a b^(2N)$ pour le $N$ du lemme de l'étoile. Alors il existe un $v$ tel que $a b^(2N) v in L$, mais par le lemme de l'étoile on peut réduire ce $v$ jusqu'à ce que sa longeur soit plus petite que $N$ (le lemme de l'étoile ne dit pas exactement ça, mais quitte à considérer l'automate dont l'état initial est l'état obtenu après lecture de $a b^(2N)$ ce que je dit est correct)

   On montre assez facilement que $a b^(2N) v$ est primitif : si on avait $a b^(2N) v = u^p$ avec $p>1$, alors $u=a b^(|u|-1)$, or la deuxième répétition de $u$ commence dans la série de $b$, donc $u[0] = b$, absurde.

   Cela ne marche que car $Sigma = {a,b}$ est de cardinal >2. Si $Sigma = {a}$, alors tout langage continuable génère des mots composite (sinon, c'était un langage infini inclus dans ${a^p : p in PP}$ qui n'est pas rationnel).
])

#question(4)[ Existe-t'il un langage infini rationnel continuable ne comportant que des mots primitifs?\
  _Indication: Considérer l'ensemble des applications partielles ${ delta^*(u,\_) : u in Sigma^* }$, et trouver un bon groupe pour la composition inclut dans cet ensemble.\
  $delta^*$ est définie par $delta^*(u a,q) = delta (a,delta^*(u,q))$ et $delta^*(epsilon,q) = q$ pour $(a,u,q) in Sigma times Sigma^* times Q$
  _]


#correct([

  _Cette preuve (très belle!) nous viens de #link("https://www.univ-orleans.fr/lifo/Members/Nicolas.Ollinger/")[Nicolas Ollinger]. Une autre preuve utillisant la reconnaissance par morphisme de monoïdes fini et le fait que dans toute $J$-classe maximal il existe un groupe (et donc une puissance laissant final le mot) à été donné par Colin du LIP de l'ENS de Lyon._

  Soit $(Q, Sigma, delta, q_0, F)$ un automate fini déterministe complet qui reconnaît $L$. Posons $k = min {|delta(Q,w)| : w in Sigma^*}$ et définissons $K = {w in Sigma^* : |delta(Q,w)| = k}$.
  
  Une fois le langage $K$ atteint, on en reste captif : $K Sigma^* subset.eq K$. Comme $L$ est continuable et non vide, $K$ l’intersecte. Choisissons $u in K sect L$ et posons $Q_u = delta(Q,u)$.
  
  Par construction $delta(Q_u,u) = Q_u$ car $delta(Q_u,u) = delta(Q_u,u^2) subset.eq Q_u$ et $|Q_u| = k$. L’application $q |-> delta(q,u)$ est donc une permutation de $Q_u$. Ce dernier étant fini, il existe $n>0$ tel que $q |-> delta(q,u^n)$ est l’identité sur $Q_u$.
  
  On en déduit $delta(q_0, u^(n+1))=delta(q_0, u) in F$ donc $u^(n+1) in L$.
])