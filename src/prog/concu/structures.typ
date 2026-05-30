#import "../../lib.typ": *
#show heading: heading_fct

== Structures de données concurrentes

=== Structures à verrou

On suppose l'existence de verrous vérifiant l'exclusion mutuelle, l'absence d'interblocage et l'absence de famine.

#q(1)[Implémenter une structure de compteur concurrent.]

On implémente maintenant une file qui implémente `file vide(void)`, `void enfile(file, int)` et enfin `bool defile(file, int*)`.

#q(0)[Proposer une implémentation de file séquentielle.]

#q(1)[Modifier cette implémentation pour qu'elle puisse être utilisée de manière concurrente.]

#q(2)[Ajouter `int defile_blocking(file)` qui, si la file est vide, attend qu'elle soit remplie avant de défiler.]

#q(3)[Sans utiliser de verrou supplémentaire, donner une implémentation d'une table de hachage concurrente.]

=== Fabrication d'un verrou

On suppose désormais disposer d'une opération `bool TAS(T* trg, T old, T new)` atomique pour tout `T` qui écrit `new` dans `trg` si `*trg` vaut `old`.

#q(1)[Implémenter une pile concurrente en utilisant `TAS`.]

#q(1)[Proposer une implémentation d'un verrou basé sur l'attente active.]

#q(1)[Démontrer l'exclusion mutuelle.]

_On admettra l'absence d'interblocage..._

On note $t_c$ le temps de calcul de la section critique et $t_a$ le temps de calcul de l'attente active d'un autre fil voulant accéder au verrou,
et enfin $t_p$ le temps d'attente passive sans calcul (pour l'instant nul).
On suppose que $t_c$ domine le temps d'exécution de `TAS`.

#q(2)[Modifier l'implémentation pour avoir $t_a = O(log t_c)$ et $t_p = O(t_c)$.]


=== Compromis et stabilité

On suppose désormais seulement que l'écriture dans un pointeur est atomique.

#q(2)[Proposer une implémentation d'arbre binaire (non-équilibré) partageable entre des fils.]

#q(3)[La modifier pour en faire un arbre auto-équilibré concurrent.]

#q(1)[Quelle est sa complexité en contexte séquentiel ? concurrent ?]
