#import "../../lib.typ": *
#show :template

== Puissance et racine de languages

Soit $Sigma$ un alphabet avec $abs(Sigma) >= 2$. Pour $cal(L) subset.eq Sigma^star$, on introduit pour $k in NN^star$ :

#align(center, grid(columns: (1fr, 1fr), $cal(L)^((k)) := {w^k | w in cal(L)}$,  $cal(L)^((1\/k)) := {w | w^k in cal(L)}$))

#question(1)[Calculer $cal(L)^((1\/2))$ pour $cal(L)$ reconnu par l'expression régulière $a b(Sigma Sigma)^*$]

#question(2)[Pour $k,ell>=1$, montrer les propriétés suivantes :
 - $(cal(L)^((k)))^((ell)) = cal(L)^((k ell))$
 - $(cal(L)^((1\/k)))^((1\/ell)) = cal(L)^(1\/k ell)$
 - $(cal(L)^((1\/k)))^((k)) subset.eq cal(L)$
]
#correct([
   - $(L^((k)))^(l) = {w^l | w in L^k} = {w^l | exists u in L : w = u^k} = {u^(k l) | exists u in L : w = u} = L^((k l))$
])
   
#question(1)[Donner un langage rationnel $cal(L)$ tel que si $k>=2$, alors $cal(L)^((k))$ n'est pas rationnel]

#question(3)[Montrer que pour $k in NN^star$, si $cal(L)$ est rationnel, alors $cal(L)^((1\/k))$ aussi.]

#question(1)[Si $cal(L)$ est rationnel, $union.big_(k>=1) cal(L)^((1\/k))$ l'est-il ?]

#question(4)[$star$ Montrer que si $cal(L)$ est rationnel, alors "Root"$(cal(L)) = {w in Sigma^* : w^(|w|) in cal(L)}$ l'est aussi.]
#correct([
  Soit $cal(A) = (Q, Sigma, delta, q_0, F)$ l'automate reconnaissant $L$.
  On pose alors $Q' = Q^Q times [| 0; 2(|Q|!!)|]$.
  
  Pour chaque $alpha in Sigma$ on pose $f_alpha : Q --> Q$ "l'action" de $alpha$ sur $Q$, définie formellement par $f_alpha (q) = delta(q,alpha)$.\ 
  Finalement, on définit $delta' : Q' times Sigma --> Q'$ par : $delta'((f,n),a) = (f_a compose f ,k)$ avec $k=n+1$ si $n<2|Q|!$ et $k=|Q|!$ sinon. On dit qu'un couple $(f,n) in Q'$ est final si $f^n (q_0) in F$.

  (lemme) On remarque que pour tout $f : Q --> Q$ on a $f^(|Q|!!) = f^(2|Q|!!)$, car par finitude de $Q^Q$ (tiroirs) il existe $i > j$ tel que $f^i = f^j$, et $i-j < |Q^Q|=|Q|!$ donc $i-j | |Q|!!$, donc $f^(|Q|!!) = f^((i-j)k) = f^(2(i-j)k) = f^(2Q!!)$ avec $k = |Q|!!\/(i-j)$
  
  Soit $u$ un mot qui nous fait aller sur $(f,n)$ un état final. On a que $f^(|u|)(u)$ est l'état obtenu après lecture de $u^(|u|)$, car par la construction de $f$, on a $f(q) = q'$ ssi $q'$ est obtenue après lecture de $u$ depuis $q$.
  Or on a que $n = |u| - k|Q|!!$ donc par le lemme précédent, $f^(|u|) = f^n$, ce qui montrer que $u in "Root"(L)$

  Soit $u in "Root"(L)$, alors si on ce situe en $(f,n)$ après lecture de $u$, on a par construction $f^(|u|)(u) in F$. Par le même argument que sur le point précédent, on a $f^n(u) = f^(|u|)(u) in F$, donc $u$ reconnu.
])

#question(4)[Donner un algorithme qui détermine si un langage rationnel $cal(L)$ vérifie $cal(L) = (cal(L)^((1\/2)))^((2))$]
