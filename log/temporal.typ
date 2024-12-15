
#import "../lib.typ": *
#show heading: heading_fct
#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

#import "@preview/curryst:0.3.0": *

// Adapté de infoA 2013

=== Généralités <generalites>

Soit $cal(V)$ un ensemble de variables propositionnelles. On note $frak(T)$ la plus petite classe contenant
#align(center, table(columns: 2, gutter: 2pt, stroke: 0pt,
$top$, $bot$,
$forall v in cal(V), v$, $forall phi in frak(T), not phi$, 
$forall phi, psi in frak(T), phi and psi quad$,
$forall phi, psi in frak(T), phi and psi$,
$forall phi in frak(T), circle phi$,
$forall phi in frak(T), square phi$,
$forall phi in frak(T), diamond phi$,
$forall phi,psi in frak(T), phi cal(U) psi$,
))

On pose $Sigma := frak(P)(cal(V))$ et on définit une relation $models$ sur $Sigma^star times NN times frak(T)$ :
#align(center, table(columns: 2, gutter: 2pt, stroke: 0pt,
proof-tree(rule($w, i models top$)), 
proof-tree(rule($w, i models v$, $v in w_i$)), proof-tree(rule($w, i models not phi$, $not (w, i models phi)$)),
proof-tree(rule($w, i models phi and psi$, $w,i models phi$, $w,i models psi$)), 
proof-tree(rule($w, i models phi or psi$, $w, i models phi$)), proof-tree(rule($w, i models phi or psi$, $w, i models psi$)),
proof-tree(rule($w, i models circle phi$, $w, i+1 models phi$)), 
proof-tree(rule($w, i models square phi$, $forall j >= i$, $w, j models phi$)),
proof-tree(rule($w, i models diamond phi$, $exists j >= i$, $w, j models phi$)),
proof-tree(rule($w, i models phi cal(U) psi$, $exists k >= i, forall j in [|i, k[|$, $w, j models phi$, $w, k models psi$)), 
))

Dans tout autre cas, on n'a pas $w, i models phi$.


On identifie dans la suite les singletons et leur élément.
On note $u models phi$ lorsque $u,0 models phi$. 

#question(1)[On pose $w := "cabba"{a,b}{a, c, d}"baba"$, puis $phi_1 := circle b and square (a or b)$, $phi_2 := diamond circle c$, $phi_3 := diamond square not c$, $phi_4 := (diamond circle d) and not (a or b)$, $phi_5 := (not circle c) cal(U) d$, $phi_6 := diamond (d and circle diamond d)$. \ Dire pour chaque valeur de $i$ si $w models phi_i$.]

#question(1)[Donner une formule vérifiant si un mot est vide.]
#question(1)[Donner une formule pour vérifier si une formule termine par $a$.]

#question(1)[Montrer que $#proof-tree(rule($w, i models phi cal(R) psi$, $forall j < min {k : w, k models psi}$, $w, j models phi$))$ serait redondante.]

On pose $cal(L)_phi := { u in Sigma^star | u models phi }$.
On dit que deux formules $phi$ et $psi$ sont _équivalentes_, noté $phi eq.triple psi$ lorsque $cal(L)_phi = cal(L)_psi.$

#question(0)[Montrer que $diamond diamond phi eq.triple diamond phi$.]
#question(2)[Montrer que pour tout $phi$, il existe $psi$ n'utilisant pas $square$ ni $diamond$ telle que $phi eq.triple psi$.]

On dit qu'une telle formule est _normalisée_.

#question(1)[Donner un programme polynomial qui normalise une formule.]

#question(2)[Donner un programme qui décide en temps polynomial si $w, i models phi$.]


#pagebreak()

=== Rationnalité

Ici on restreint notre alphabet : $Sigma := cal(V)$ et $Sigma$ est fini.

On pose $cal(S)_phi (w) := { psi : psi "sous-formule de" phi, w models psi }$.

#question(1)[Montrer qu'on peut déterminer $cal(S)_phi (a w)$ avec $a in Sigma$ en fonction uniquement de $cal(S)_phi (w)$ et de $a$.]

#question(2)[Donner une procédure pour calculer $cal(S)_phi (u)$ et préciser sa complexité.]

#question(2)[Montrer que la langage miroir de $cal(L)_phi$ est rationnel, en déduire que $cal(L)_phi$ aussi.]

#question(2)[Minorer la taille d'un automate non-déterministe reconnaissant $cal(L)_phi$.]

=== Satisfiabilité

Dans cette partie, sauf mention contraire, $Sigma := {0,1}$.

On dit de $phi$ qu'elle est _satisfiable_ si il existe $u in Sigma^star$ tel que $u models phi$.

#question(1)[Donner un algorithme déterminant si $phi$ est satisfiable. Quelle est sa complexité ?]

#question(1)[Majorer la longueur du plus petit mot reconnu par une formule satisfiable en fonction de sa taille.]

On introduit un lemme de pompage pour la logique temporelle : Pour tout $phi$, il existe $N in NN$ tel que :
$ forall n >= N, a^n models phi quad "ou" quad forall n >= N, not (a^n models phi) $

#question(2)[Démontrer ce lemme.]

#question(1)[En déduire qu'il existe un langage rationnel qui n'est pas reconnu par une formule temporelle restreinte.]

=== Vers l'infini et $omega$

On reprend $Sigma$ fini, mais on ne considère plus $Sigma^star$ mais $Sigma^omega := Sigma^NN$ les suites de lettres. Toutes les règles restent les mêmes et la définition de la relation $models$ ne change guère.
On note $w^omega := w w w ... in Sigma^omega$ pour $w in Sigma^star$. Formellement, la $i^"ème"$ lettre $u^omega$ est la $(i mod abs(u))^"ème"$ lettre de $w$.

#question(0)[Redémontrer les résultats précédents de satisfiabilité, sans se soucier de complexité.]

Un _automate de Büchi_ est un automate fini déterministe. On dit qu'il accepte $u in Sigma^omega$ si le chemin infini engendré par la lecture de $u$ passe une infinité de fois par un état acceptant.

#question(0)[Montrer que $u^omega a = u^omega$.]
#question(0)[Montrer que $(u^star)^omega = u^omega$.]
#question(0)[Donner un automate de Büchi qui reconnaît $b a^omega | (a^star b a | b)^omega$.]
#question(1)[En déduire une forme générale d'une "$omega$-regex".]
#question(2)[Montrer que le langage reconnu par un automate de Büchi s'écrit sous la forme d'une $omega$-regex.]
#question(2)[Démontrer que la réciproque est fausse : il existe $cal(L) cal(M)^omega$ non reconnaissable par un automate de Büchi avec $cal(L),cal(M)$ rationnels.]

#question(1)[Montrer que pour toute formule temporelle il existe un automate de Büchi reconnaissant le même langage.]

#question(1)[Montrer qu'il existe un langage reconnaissable par automate de Büchi non reconnaissable par une formule de logique temporelle.]

#question(2)[Montrer qu'il existe un langage reconnaissable par un automate de Büchi non-déterministe qui n'est pas reconnaissable par un automate de Büchi.]

=== Formules existentielles

On choisit cette fois $cal(V) =: Sigma union.sq cal(E)$, où $Sigma$ est l'alphabet de nos mots et $cal(E)$ est un ensemble fini de variables disjoint de $Sigma$.

Si $alpha : NN -> frak(P)(cal(E))$ et $w = (w_i) in Sigma^omega$, on pose $w[alpha] := lr(({w_i} union alpha(i)), size: #170%) in frak(P)(cal(V))^omega$.

On introduit alors la relation $models_exists$ définie comme suit :
$ u models_exists phi <==> exists alpha, u[alpha] models phi $

#question(0)[Montrer que si $phi$ n'utilise que des variables de $Sigma$, alors $u models phi$ si et seulement si $u[alpha] models_exists phi$.]

On pose enfin $cal(L)^exists_phi := { u in Sigma^omega : exists alpha, u[alpha] models_exists phi }$.

#question(1)[Donner une formule $phi$ telle que $cal(L)_phi^exists = cal(L)((a a)^star b^omega)$.]

#question(1)[Donner une formule $phi$ vraie si et seulement si $q in cal(V)$ apparaît une infinité de fois.]

#question(2)[Donner une formule $phi$ vraie sur $w$ si et seulement si $forall n in NN, lr(abs(w_n sect cal(E)), size: #125%) = 1$.]

#question(3)[Montrer que les automates de Büchi et les formules avec quantification existentielle sont équivalents.]

#question(4)[Monter que toute formule $phi$ avec quantification existentielle est équivalente à une formule $exists q, psi$ où $psi$ n'a pas de quantification existentielle ni l'opérateur $cal(U)$.]

=== Formules d'état

On note $frak(E)$ la plus petite classe contenant
#align(center, table(columns: 2, gutter: 2pt, stroke: 0pt,
$top$,
$forall v in cal(V), v$,
$forall Phi in frak(E), not Phi$, $forall Phi, Psi in frak(E), Phi and Psi$,
$forall phi in frak(T), A phi$, $forall phi in frak(T), E phi$
))

Soit $cal(W)$ un cadre de Kripke et $h : S_cal(W) -> frak(P)(cal(V))$. On appelle le couple $(cal(W),h)$ un _système de Kripke_. On note $pi(s)$ l'ensemble des chemins dans $cal(W)$ commençant en $s$. 


#question(0)[
Justifier que les éléments de $pi(s)$ sont des éléments de $Sigma^star$ pour $Sigma := frak(P)(cal(V))$.
]

#question(1)[Montrer que les éléments de $Sigma^omega$ peuvent être représentés comme des systèmes de Kripke.]


On définit la relation $models$ sur $S_cal(W) times frak(E)$ :

#align(center, table(columns: 2, gutter: 2pt, stroke: 0pt,
proof-tree(rule($s models top$)), 
proof-tree(rule($s models p$, $p in h(s)$)), 
proof-tree(rule($s models not Phi$, $not (s models Phi)$)), 
proof-tree(rule($s models Phi and Psi$, $not (s models Phi)$)), 
proof-tree(rule($s models A phi$, $forall w in pi(s)$, $w models phi$)), 
proof-tree(rule($s models E phi$, $exists w in pi(s)$, $w models phi$)), 
))

#question(1)[Proposer une fonction $f_cal(E)$ qui à un mot de $Sigma^omega$ associe un système de Kripke tel que $u models_exists phi <=> f_cal(E) (u) models E phi$.]

On dit d'un langage qu'il est _reconnu_ par une formule d'état $Phi$ si il existe $f$ associant à un mot un modèle de Kripke tel que $u in cal(L) <=> f(u) models Phi$.

// TODO(Juliette): vérifier que c'est vrai ptdr, j'y crois à moitié
#question(3)[Montrer que tout lanagage reconnu par un automate de Büchi non déterministe est reconnu par une formule d'état.]

