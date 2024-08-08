#import "../lib.typ": *
#show heading: heading_fct

Soit $w in Sigma^*$ un mot dans l'alphabet $Sigma$. On appelle $"Pref"(w)$ l’ensemble des préfixes de $w$.

On note $w[..i]$ le préfixe de longueur $i+1$. On note $w[i]$ la $(i+1)$-ème lettre de $w$ (on commence à l'indice 0).

On pose $"LPS"[i]$ (pour *Longest Prefix also Suffix*) la longueur du plus long préfixe *propre* de $w[..i]$ (préfixe différent de $w[..i]$) qui est aussi un suffixe de $w[..i]$, pour $0<i<= |w|$. 

#question(0)[Indiquer le tableau LPS de $w = "aabaacaaabaaa"$]

#question(1)[
 - Si $"LPS"[i] = k$, et que $w[i+1] = w_k$, que vaux $"LPS"[i+1]$ ?
 - Sinon si $"LPS"["LPS"[i]] = k$, et que $w[i+1] = w_k$, que vaux $"LPS"[i+1]$ ?]

#question(3)[Donner un algorithme qui calcule le tableau $"LPS"$ en $O(n)$ sur cette logique]

#question(2)[En déduire un algorithme qui cherche si un mot $v$ est facteur d'un mot $u$ en $O(|u|)$. Comparer cette complexités aux algorithmes de recherche de facteur que vous connaissez.]
