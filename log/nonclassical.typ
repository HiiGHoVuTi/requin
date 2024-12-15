#import "../lib.typ": *
#show heading: heading_fct
#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

On note $cal(V)$ l'ensemble des variables propositionnelles.

=== Logique classique

On s'intéresse au calcul des propositions sans quantificateurs.

#question(0)[Quelle est la règle différenciant la logique classique de la logique intuitionniste ?]
#question(1)[Montrer qu'ajouter à la logique intuitionniste la règle $not not P tack P$ donne la même logique que l'ajout de $tack P or not P$.]

On s'autorise désormais les quantificateurs et des prédicats.

#question(1)[Montrer que la formule $exists x, (P => Q(x)) => (P => forall y, Q(y))$ n'est pas démontrable.]

#question(2)[Dériver $tack not(forall x, F(x)) => (exists x, not F (x))$.]

#question(2)[Donner une procédure pour déterminer si une formule est une tautologie.]

=== Algèbres de Heyting

De nouveau, on étudie les propositions sans quantificateurs.

Une _algèbre de Heyting_ est un ensemble $HH$ partiellement ordonné avec un maximum $bb(1)$ et un minimum $bb(0)$ tel que toute paire ${a,b}$ admette un suprémum noté $a or b$ et un infimum noté $a and b$ et ${x in HH : a and x <= b}$ admette un maximum noté $a => b$.

#question(0)[Montrer que les booléens forment une algèbre de Heyting.]

#question(1)[Montrer qu'une algèbre de Heyting induit un modèle de la logique intuitionniste.]

#question(2)[En déduire que $not not P tack P$ n'est pas dérivable en logique intuitionniste.]

#question(2)[Montrer que toute logique admettant un VRAI et un FAUX stable par _modus ponens_, _ou_, _et_ et _équivalence_ est modélisée par une algèbre de Heyting.]

=== Modèles de Kripke

On revient aux propositions avec quantificateurs. Dans cette partie, on écrira $diamond$ pour $exists$ et $square$ pour $forall$ pour éviter les confusions syntaxiques.

Un _cadre de Kripke_ est un graphe _orienté_ $cal(W)=(S_cal(W), A_cal(W))$.

Un #gls(entry: "Modèle de Kripke")[_modèle de Kripke_] est un cadre de Kripke muni d'une fonction $h : cal(V) -> frak(P)(S_cal(W))$ telle que $ forall u v in A_cal(W), h(u) => h(v) $

#question(0)[Montrer que $h$ définit pour chaque $P in cal(V)$ une partition $S_cal(W) =: cal(W)(P) union.sq cal(W)(not P)$.]

On définit par induction sur les formules logiques une relation $models_h$, avec $w in S_cal(W)$ :
$ forall P in cal(V), w models_h P "si" w in cal(W)(P)
\ forall P in cal(V), w models_h not P "si" w in cal(W)(not P)
\ forall phi, psi, w models_h phi and psi "si" w models_h phi "et" w models_h psi
\ forall phi, psi, w models_h phi or psi "si" w models_h phi "ou" w models_h psi
\ forall phi, w models_h diamond phi "si il existe" w v in A_cal(W) "avec" v models_h phi
\ forall phi, w models_h square phi "si pour tout" w v in A_cal(W) "on a" v models_h phi
$

#question(1)[Donner une définition cohérente pour $w models_h phi => psi$.]
#question(0)[En déduire une condition nécessaire pour $w models_h bot$.]

On note $models_h phi$ lorsque $forall w, w models_h phi$. On note $cal(W) models phi$ lorsque $models_h phi$ pour tout $h$.
On dira que $phi$ est Kripke-valide lorsque $cal(W) models phi$ pour tout modèle $cal(W)$, noté $models phi$.

#question(1)[Montrer que $square(phi => psi) => (square phi => square psi)$ est Kripke-valide.]

#question(2)[Montrer que pour toute formule $phi$, il existe $S_cal(W) =: cal(W)(phi)union.sq cal(W)(not phi)$ tel que
$ forall w in S_cal(W), w models phi <==> w in cal(W)(phi) $
]

#question(1)[Montrer que $bot => P$ n'est pas Kripke-valide.]

==== Logique intuitionniste

Pour être plus spécifique à la logique intuitionniste, on suppose désormais que la relation d'acccessibilité dans $cal(W)$ est un ordre partiel.

#question(1)[Montrer que le tiers exclus n'est pas Kripke-valide.]

// TODO(Juliette): ajouter une question intermédiaire (juste)
// #question(2)[Montrer que si $u models_h phi$ et que $u <= v$ alors $v models_h phi$.]

#question(3)[Démontrer le théorème de complétude : une proposition est démontrable en logique intuitionniste si et seulement si elle est Kripke-valide dans un cadre d'ordre partiel.]

#question(1)[Conclure sur la différence entre la logique classique et la logique intuitionniste du premier ordre.]

==== Propriétés sur la relation

On ne suppose plus rien sur la relation $A_cal(W)$ que l'on notera $tilde$ désormais.

#question(1)[Montrer que $tilde$ est réflexive si et seulement si $forall phi, cal(W) models (square phi => phi) or (phi => square phi)$.]

#question(2)[Donner une condition nécessaire et suffisante sur $tilde$ pour que $ forall phi, cal(W) models phi => square diamond phi $]

#question(1)[Donner une formule paramétrée $F$ telle que $tilde$ est antisymétrique si et seulement si $forall phi, cal(W) models F (phi)$.]

#question(2)[Montrer que $~$ est transitive si et seulement si $ forall phi, cal(W) models (square phi => square square phi) or (diamond diamond phi => diamond phi) $]

// NOTE(Juliette): si ça aide à faire la question requinesque du théorème de complétude, le déplacer ci-dessus
#question(2)[Montrer que $~$ est un ordre partiel si et seulement si $(cal(W),h)$ est un modèle de la logique intuitionniste.]

// TODO(Juliette): ajouter confluence au glossaire...
#question(2)[Donner une condition nécessaire et suffisante pour que $tilde$ soit confluente.]
