#import "../lib.typ": *

On se propose ici de créer une structure de donnée permettant de représenter un ensemble infini sous la forme d’une fonction de `'a -> bool` déterministe et qui *termine toujours*. On fixe dans cet exercice $X$ un ensemble quelconque. On défini donc le type suivant en OCaml :

```ml
type 'a set = 'a -> bool;;
```

#question(0)[Expliciter la bijection entre $cal(P)(X)$ et ${0,1}^X$]

#correct([
  C'est, si on pose $bold(1)_E$ l'indicatrice de l'ensemble $E$, $ phi : cases(
          cal(P)(X) &--> {0,1}^X,
          A &|-> bold(1)_A
) $
])

#question(0)[ Donner une fonction ```ml make_finite: 'a list -> 'a set``` qui à une liste finie renvoie l'ensemble de ses valeurs]

#correct([
  ```ml
  let make_finite li x = match li with 
    | [] -> false
    | e::q when e=x -> true
    | e::q -> make_finite q x 
  ```
])
#question(1)[Construire des objets de type `int set` pour représenter les ensembles suivants :
 - L’ensemble des nombres pairs
 - $PP$, l’ensemble des nombres premiers
 - L’image d’une fonction fixée `f` positive et strictement croissante
]
    
#correct([
  ```ml
  let first  x = x mod 2 = 0;;
  let second x = 
    let rec aux p = if x mod p = 0 then false else p*p>x || aux (p+1) in
    aux 2;;
  let third  x = 
    let rec aux i = if f i >= x then f i = x else aux (i+1) in
    aux 0;;
  ```
])

#question(1)[ Donner le code d’une fonction `union` qui réalise l’union de deux ensembles.]
    
#correct([
  ```ml let union f1 f2 x = f1 x || f2 x```
])
#question(2)[ Donner un ensemble que l’on ne pourra pas représenter par notre structure. Le nombre d’ensembles non représentable est-t’il fini ? Dénombrable ? Indénombrable ?]

#correct([
  L'ensemble des codes (`string`) ocaml qui termine n'est pas représentable, car il n'existe pas d'algorithme permettant de savoir si un code donné termine ou pas (Problème de l'arrêt). \
  Etant donné que à chaque élément représentable, on peut associer un code d'un fonction pouvant définir l'objet, le nombre d'ensemble représentable est dénombrable. Or il y a un nombre indénombrable d'ensembles, donc il y a un nombre indénombrable d'ensemble non représentable.
])
// #correct([])
#question(3)[ Soit ```ml val P: int set set```, montrer qu’il existe un $N in NN$ tel que pour tout ```ml val x: int set```, `P x` ne regarde que les entrées inférieure à $N$ dans `x`. Est-ce vrai avec ```ml val P: (int -> int) set``` ?]

#correct([
  On fait l'arbre des évaluations de l'argument de `P`: Chaque neoud correspond à une évaluation de l'argument, et les branches corresponds au choix pris par l'algorithme si la réponse est oui ou non.\
  Comme le calcul termine toujours et que le nombre de fils dans chaque neoud est fini et bornée par 2, on peut démontrer (ce n'est pas trivial) que l'arbre à un nombre bornée de neouds. Le max des noeuds nous donne alors le $N$.

  Pour la démonstration: par l'absurde, supposons qu'il a un nombre infini de noeud. Alors à la racine il y a un des 2 sous-arbres qui à unnombre infini de noeud et on se déplace dedans. Un peu à la weirestrass, on crée un chemin dans l'arbre. Sauf que ce chemin doit s'arreter car il correspond à un calcul, et que tout les calculs sont terminant. Comme le chemin se termine, il n'y a pas un nombre infini de noeuds, absurde. 

  Ce n'est pas vrai pour ```ml val P: (int -> int) set``` car dans ce cas, l'arbre est à branchement infini, et peut donc avoir un nombre infini de noeuds. Par exemple, la fonction ```ml let P f = f (f 0) = 42``` qui regarde le `f 0` argument, n'est pas majoré indépendament de `f`.
])

#question(4)[ Écrire une fonction ```ml val f : (int set set) -> int set``` qui à un `int set set` non vide associe un de ces éléments.]

#correct([
  Le code est plus diffile à faire que la preuve que ce soit possible. En effet, il nous suffit de simuler tout les ensembles `int set` d'entrée plus bas que $N$, et stoquer tout les résultats dans un tableau.
  
  Code de "Tito" Nguyễn Lê Thành Dũng, adapté du blog en Haskell de Martin Escardo :

```ml
let cons : 'a -> 'a set -> 'a set = fun x u ->
  function
  | 0 -> x
  | i -> u (i-1)
           
let rec f : int set set -> (int set) = fun p ->
  let u0 = try_first_bit false p in
  if p u0 then u0
  else try_first_bit true p
and try_first_bit : bool -> int set set -> int set = fun b p ->
  cons b (fun i -> find (fun u -> p (cons b u)) i)
```
  
])