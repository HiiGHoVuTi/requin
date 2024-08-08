#import "../lib.typ": *
#show heading: heading_fct

On dit qu'un tableau $T$ d'entiers de longueur $n$ est _auto-référent_ si pour tout $i < n$, $T[i]$ représente le nombre d’occurrence de $i$ dans $T$. Les tableaux commence à l'indice 0.

Par exemple, $[1,2,1,0]$ est un tableau autoréférent de longueur 4.

#question(0)[Donner le deuxième tableau autoréférent de longueur 4]
#question(2)[Donner un code $"C"$ qui vérifie si un tableau de longueur $n$ est autoréférent en $O(n)$]
#question(2)[Donner un code $"C"$ de recherche exaustive qui renvoie le nombre de tableaux référent de longueur $k$]

#question(2)[Montrer que pour $n>6$, il existe un tableau auto-référent de longueur $n$] 

#correct[
0. C'est $[2,0,2,0]$
1. ```C
int is_auto_ref(int* arr, int n) {
  int* occ = malloc(sizeof(int)*n);
  for (int i=0;i<n;i++) { // init
    occ[i] = 0;
  }
  for (int i=0;i<n;i++) { // fill the occurence table
    if (arr[i]>=n || arr[i]<0)
      return 0;
    occ[arr[i]]++;
  }
  for (int i=0;i<n;i++) { // check if occ = table
    if (occ[i] != arr[i])
      return 0;
  }
  return 1;
}
```
2. ```C
int search_rec(int* arr, int i, int n) {
  if (i == n)
    return is_auto_ref(arr,n);
  int count = 0;
  for(int j=0;j<n;j++) {
    arr[i] = j;
    count += search_rec(arr,i+1,n);
  }
  return count;
}
```
3. Soit $n >4$, le tableau $[n-4,2,1,0,...,1,0,0,0]$ est toujours autoréférent.
]

#question(3)[Montrer que pour $n>6$, le tableau autoréférent donné à la question précédente est l'unique tableau autoréférent.]