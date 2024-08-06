#import "../lib.typ": *
#show heading: heading_fct

#import "@preview/gloss-awe:0.0.5": gls
#show figure.where(kind: "jkrb_glossary"): it => {it.body}

#import "@preview/commute:0.2.0": node, arr, commutative-diagram

_Ce problème est adapté de "The Mathematics of Chip-firing" de Caroline J. Klivans._

Soit $G = (S, A)$ avec $|S| =: n in NN$. Une _configuration de jetons_ $j in S -> NN$ est une fonction indiquant combien de jetons se trouvent sur un sommet. Un sommet $s in S$ est _jouable_ pour une configuration $j$ si $deg s >= j(s)$.
On _joue_ sur un sommet $s$ en transformant la configuration $j$ en $s dot j$ telle que $j_s(s) = s dot j(s)-deg s$ et $s dot j(v)=j(v)+cases(1 "si" {s v} in A, 0 "sinon")$.
Une configuration est _stable_ si aucun sommet n'est jouable.
Une _partie de CFG_ est une suite (finie ou non) de configurations respectant les règles, ne s'arrêtant que si la configuration est stable.

#question(0)[Donner un exemple de partie finie de CFG.]
#question(0)[Donner un exemple de partie infinie de CFG.]
#question(1)[Soient $s,v in S$ jouables pour $j$. Montrer que $v$ est jouable pour $s dot j$.]

On a alors le diagramme commutant suivant
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 0), $j$),
  node((1, -1), $s dot j$),
  node((1, 1), $v dot j$),
  node((2, 0), $s dot v dot j$),
  arr($j$, $s dot j$, $s$, label-pos: right),
  arr($j$, $v dot j$, $v$),
  arr($s dot j$, $s dot v dot j$, $v$, label-pos: right),
  arr($v dot j$, $s dot v dot j$, $s$),
))

Pour $bold(s) := (s_1...s_n) in S^n$, on note $bold(s) dot j := s_n dot ... dot s_1 dot j$ si cette quantité est bien définie.

#question(1)[Montrer que si $bold(s)$ est une permutation de $bold(v)$, alors $bold(s) dot j = bold(v) dot j$.]

*Propriété* (_Confluence forte_):
Si il existe $n in NN$ et $bold(s) in S^n$ tels que $bold(s) dot j_0$ existe et est stable,
- Pour tout $bold(s) in S^n$ tel que $bold(s) dot j_0$ existe, $bold(s) dot j_0$ est stable
- Pour tout $bold(s) in S^k$ pour $k<n$, $bold(s) dot j_0$ n'existe pas ou n'est pas stable
- Pour tout $bold(s) in S^k$ pour $k>n$, $bold(s) dot j_0$ n'existe pas


#question(2)[Montrer que la propriété de confluence forte.]
#question(1)[En déduire que si $bold(s) dot j$ et $bold(v) dot j$ sont stables, alors $s$ est une permutation de $v$.]

#question(1)[Montrer quand lors d'une partie infinie, chaque sommet est joué une infinité de fois.]

#question(1)[Montrer que si tous les sommets sont jouables, toutes les parties possibles sont infinies.]

#question(1)[Montrer qu'il existe une partie finie si et seulement il existe $s in S$ qui ne peut pas devenir jouable.]

#pagebreak()
*Théorème* (_CFG sur un graphe fini_):
Si $N in NN$ jetons sont en jeu,
- Si $N > 2|A| - |S|$ alors toute configuration initiale admet une partie infinie
- Si $N < |A|$ alors toute partie admet une partie finie
- Sinon, il existe une configuration admettant une partie infinie et une autre admettant une partie finie

#question(1)[Démontrer les deux premiers cas du théorème.]

On se place dans le troisième cas.

#question(1)[Donner une partie finie.]

#question(0)[Démontrer qu'il existe $cal(O)$ une orientation acyclique de $G$.]

On considère $j := s arrow.bar deg_" sortant" (s)$. 

#question(1)[Montrer qu'il existe $v in S$ tel que $"deg"(v)=j(v)$.]

#question(3)[En déduire qu'il existe une partie infinie.]

Pour $u,v in S$ on définit $d(u,v)$ comme la taille d'un plus court chemin entre $u$ et $v$, puis $ "diam"(G) := max{d(u,v), u,v in S} $

#question(2)[Montrer que dans une partie à $N$ jetons, si $u$ et $v$ sont voisins, alors $u$ ne peut pas être joué plus de $N$ fois plus de fois que $v$ à un instant donné.]

#question(3)[En déduire qu'une partie finie se termine en moins de $2 times |S| times |A| times "diam"(G)$ coups.]
