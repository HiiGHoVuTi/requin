#import "../../lib.typ": *
#show heading: heading_fct

#let gay(x) = {
 set text(fill: gradient.linear(..color.map.rainbow.map(c => c.darken(20%))))
 box(x)
}
#let bi(x) = {
 set text(fill: gradient.linear(..(blue, red).map(c => c.darken(20%)), space: color.hsl))
 box(x)
}

== Arthur et Merlin

Le roi #bi[Arthur] est un humain vivant un temps polynomial
et le sorcier #gay[Merlin] est capable de répondre à toute question,
même non calculable. #bi[Arthur] ne fait *pas* confiance à #gay[Merlin].
Arthur dispose d'une pièce équilibrée.

#let Sigma = ${0,1}$

Un _jeu de Arthur et Merlin_ se joue sur un langage $L$ de $Sigma^star$.
#bi[Arthur] reçoit un élément $x in Sigma^star$,
il peut lancer sa pièce sous la supervision de #gay[Merlin] pour obtenir $r in Sigma^star$.
Ensuite, il pose une question $q in Sigma^star$ à #gay[Merlin] qui répond $y in Sigma^star$.
Enfin, #bi[Arthur] cherche à deviner si $x in L$ avec une bonne proabilité.
#gay[Merlin] choisit toujours $y$ de sorte à ce que #bi[Arthur] réponde $x in L$ si possible.

#q(1)[Si $L$ est de classe $P$, montrer que #bi[Arthur] a une stratégie gagnante (à coup sûr).]

#q(2)[Quels sont les langages où #bi[Arthur] a une stratégie gagnante (à coup sûr) ?]

#let art = bi($cal(A)$)
#let mer = gay($frak(M)$)

Formellement, on dit qu'un langage $L$ est #bi[Arthur]-#gay[Merlin] (AM) lorsque pour tout polynôme\ $lambda in NN[X]$,
il existe $art$ un algorithme déterministe polynomial tel que si $r$ est une suite aléatoire sur $Sigma$ :
#align(center, grid(columns: 2, 
[
Si $x in L$,\ #align(center, $PP(exists mer, art(x, mer, r) = 1) >= 1 - 1 slash 2^lambda(abs(x)) $)
#h(1fr)
],
[
Si $x in.not L$,\ #align(center, $PP(exists mer, art(x, mer, r) = 1) <= 1 slash 2^lambda(abs(x))$)
#h(1fr)
]))

// TODO: questions faciles please

De plus, on dit qu'un langage $L$ est #gay[Merlin]-#bi[Arthur] (MA) lorsque pour tout polynôme $lambda in NN[X]$,
il existe $art$ un algorithme déterministe polynomial tel que si $r$ est une suite aléatoire sur $Sigma$ :
#align(center, grid(columns: 2, 
[
Si $x in L$,\ #align(center, $ exists mer, med PP(art(x, mer, r) = 1) >= 1 - 1 slash 2^lambda(abs(x)) $)
#h(1fr)
],
[
Si $x in.not L$,\ #align(center, $ forall mer, med PP(art(x, mer, r) = 0) >= 1 - 1 slash 2^lambda(abs(x)) $)
#h(1fr)
]))

#q(2)[Montrer que $"NP" subset.eq "MA" subset.eq "AM"$.]

Une instance de _non-isomorphisme de graphe_ (GNI) est la donnée de $G_1,G_2$.
Une instance est positive si et seulement si $G_1$ et $G_2$ ne sont pas isomorphes,
c'est-à-dire qu'il n'existe pas de bijection des ensembles des sommets préservant les arêtes.
#let aut = $frak(A u t)$
#let iso = $frak("Iso")$
On note $aut(G)$ l'ensemble des automorphismes de $G$ et $iso(G)$ l'ensemble des graphes isomorphes à $G$.

#q(1)[Montrer que GNI est coNP.]

#let hiso = $cal(H)$

On pose $hiso := { (H in iso(G_1) union iso(G_2), pi in aut(H)) }$ et $h := "card"(hiso)$.

#q(3)[En supposant pouvoir déterminer si $h >= 2^(k+1)$ ou $h <= 2^k$ pour tout $k in NN$, montrer que GNI est de classe AM.]

#q(3)[Montrer que GNI est de classe AM.]

Le problème SAT-Comptage ($hash "SAT"$) est de dire si,
étant donnés une instance de SAT et un entier $k in NN$,
l'instance admet au moins $2^k$ solutions.

#q(3)[Montrer que $hash "SAT"$ est de classe AM.]
