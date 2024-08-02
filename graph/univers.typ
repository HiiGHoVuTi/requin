#import "@preview/diagraph:0.2.1": *
#import "../lib.typ": *

On dit qu'un mot $w in Sigma^*$ est $n$-univers si tout les mots de $Sigma^n$ sont des facteurs de $w$. On s'intéresse à créer les plus petits mots $n$-univers.

#question(0)[Montrer qu'un mot $n$-univers sur un alphabet à $k$ lettres à au moins une longueur de $k^n+n-1$]

#correct([
1. Le nombre de préfixes distincts de $n$ lettres dans un mot de $l$ lettres est au plus $p <= l-n+1$. En sachant qu'il y a $k^n$ préfixes à $n$ lettres, on a donc $k^n <= l-n+1$ donc $l >= k^n+n-1$ 
])

Soit $G=(V,E)$ un graphe *orienté*, on définit $L(G)$ le _graphe ligne_ de $G$ par le graphe orienté $(E,E')$ avec $E'$ l'ensemble des arêtes de la forme $((x,y),(y,z))$ pour $(x,y),(y,z) in E$.

#question(1)[Donner le graphe ligne du cycle à $4$ éléments et d'un arbre binaire parfait de hauteur 2.]


#correct([
a. Le graphe ligne d'un graphe du cycle à 4 éléments est aussi le cycle à 4 élément.\
b. Cela donne une foret de deux arbres binaire parfait de hauteur 1.
])

On construit alors la famille des graphes de Bruijn $("DB"(n))_(n in NN^*)$ par $"DB"(1) = ({0,1},{0,1}^2)$ et $"DB"(n+1) = L("DB"(n))$.

#question(1)[Construire $"DB"(2)$]

#correct([
C'est 
#set align(center)
#raw-render(
  ```dot
  digraph ex {
    	fontname="Helvetica,Arial,sans-serif"
    	node [fontname="Helvetica,Arial,sans-serif"]
    	edge [fontname="Helvetica,Arial,sans-serif"]
    	rankdir=LR;
    	node [shape = circle] 00 01 10 11;
     00 -> 01 -> 10 -> 11
     00 -> 00
     11 -> 11
     10 -> 01
     01 -> 11
     10 -> 00
  }
  ```,
  width: auto
)
#set align(left)
  
])
#question(1)[Montrer que pour tout $n in NN^*$, chaque sommet de $"DB"(n)$ à autant d’arêtes sortantes que entrantes. Combien de sommets et d'arêtes $"DB"(n)$ possède t'il ?]
#correct([
Le dégrée sortant est de dégrée 2 pour chaque sommet.
a. Par récurrence sur $n in NN^*$.
- Les deux sommets de $"DB"(2)$ sont de degrée 2
- Supposons que $forall x in V("DB"(n)), deg x = 2$.\ Soit $(u,v) in V("DB"(n+1))$.
  Par HR, $deg (v) = 2$\ donc $|{x in V("DB"(n)) | (v,x) in E("DB"(n))}| = 2$\
  donc $|{(a,b) in E("DB"(n)) | a = x }| = 2$\
  donc $|{x in V("DB"(n+1)) | ((u,v),x) in E("DB"(n+1)) }| = 2$ donc $deg (u,v) = 2 $

pareillement pour le degrée entrant.
  
$"DB"(n)$ possède $2^n$ sommets et $2 times 2^n = 2^(n+1)$ arrêtes: $|"DB"(n+1)| = |"DB"(n)| times deg ("DB"(n)) = 2times |"DB"(n)| $
])

#question(1)[Montrer que pour tout graphe orienté fortement connexe tel que pour tout sommet le degrée entrant est le même que le degrée sortant, il existe un cycle eulérien (un cycle passant par toutes les arêtes du graphe).

   En déduire que pour tout $n in NN^*$, $"DB"(n)$ possède un cycle eulérien.]
#correct([
Par récurrence forte sur le nombre d'arêtes.

On considère un cycle quelquonque, que l'on peut faire par un parcours en profondeur (comme deg entrant = deg sortant, on sait que dès que on entre on pourra toujours ressortir, sauf sur le premier).
On s'applique par récurrence sur chaque composante connexe. Eulérien => hamiltonien (passe par tout les sommets), donc on rencontre notre premier cycle, et on concatène la boucle.
])
#question(2)[En voyant les sommets de $"DB"(n)$ comme des mots dans ${0,1}^(n-1)$, et en étiquetant les arêtes par $0$ ou $1$, montrer qu'il existe un mot $n$-univers sur l'alphabet ${0,1}$ de taille $2^n+n-1$]
#correct([
  On montre que l'on peut étiqueté les mots tels que $w -->^0 w'$ ssi $w=alpha . w'$ et $w'0 =w$. Par récurrence sur $n in NN^*$

  - On le fait sur le schéma de $"DB"(2)$ (et $"DB"$(1)).
  - Si on a une bonne numérotation de $"DB"(n)$, alors chaque arête $(u,v)$ est uniquement identitifié par $u in {0,1}^(n-1)$ et un $x in {0,1}$, donc par un mot de ${0,1}^n$, qui deviens nos nouveau état. De plus, si $(u,v),(v,z)$ est une arrête, alors on passe de $v$ à $z$, donc en appellant $x$ l'étiquetage de l'arête $(v,z)$, on étiquette $(u,v),(v,z)$ par $x$

Un cycle hamilotinen est donc un chemin qui passe par toutes les arrêtes: un ensemble de lettres de ${0,1}$ à choisir en partant du mot $00...0$ pour les avoir tous une seule fois. un tel cycle est de longueur $2^(n+1+1) = 2^n$, en ajoutant ce qu'il faut pour commencer sur $00...0$ on atteint $2^n-n+1$
])
#question(1)[Généraliser la question précédente pour des alphabets plus grand.]
#correct([
  On commence du graphe $"DB"(1) = ({0,1,...,k},{0,1,...,k}^2)$
  Sinon, on peut directement donner le bon graphe pour obtenir le mot $n$-univers sur ${1,...,k}$, et montrer que le degrée marche bien.
])