#import "../lib.typ" : *
#show heading: heading_fct

Soit $G = (S,A)$ un graphe puis $phi : A -> {mono(R), mono(B)}$. On note $r$ le nombre d'arêtes rouges ($mono(R)$).

Un sous-graphe induit _triangle_ est un triplet ${x,y,z} subset S$ tel que $G[{x,y,z}] tilde.eq K_3$.

On suppose que dans tout sous-graphe induit triangle, il y a au moins une arête rouge.

On note $n in NN$ la taille de la plus grande partie de $S$ qui induit un graphe biparti.

Si $v in S$, on note $N(v)$ l'ensemble des voisins de $v$ reliés à lui par une arête rouge.
$ N(v) := { w, {x,w} in phi^(-1)(mono(R)) } $

#question(1)[Montrer que $N(v)$ est un stable.]
#question(1)[Que dire de $N(v)$ et $N(w)$ si ${v,w} in.not A$ ?]
// TODO(Juliette): mets au moins une question intermédiaire en plus...
#question(3)[Montrer que $ |S| >= (4r)/n $]
