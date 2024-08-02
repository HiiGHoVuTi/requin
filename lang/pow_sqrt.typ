#import "../lib.typ": *

Soit $Sigma$ un alphabet possédant au moins 2 lettres. Pour $L$ un langage sur $Sigma$ et $k>1$ on pose

$ L^((k)) = {w^k | w in L} "et" L^(1\/k) = {w | w^k in L} $

#question(1)[Calculer $L^(1\/2)$ pour $L$ reconnu par l'expression régulière $a b(Sigma Sigma)^*$]

#question(2)[Pour $k,l>=1$, montrer que 
 - $(L^((k)))^((l)) = L^((k l))$
 - $(L^(1\/k))^(1\/l) = L^(1\/k l)$
 - $(L^(1\/k))^((k)) subset.eq L$
]
   
#question(1)[Donner un langage rationnel $L$ tel que $forall k>=2, L^((k))$ n'est pas rationnel]

//#correct([])
#correct([
1. On a $L^(1\/2) = L$
2.
   - $(L^((k)))^(l) = {w^l | w in L^k} = {w^l | exists u in L : w = u^k} = {u^(k l) | exists u in L : w = u} = L^((k l))$
   - 
])

#question(1)[ Montrer que pour $L$ reconnu par un automate $A=(Sigma, Q, q_i, delta, F)$, on a
$ w in L^(1\/2) <=> exists q in Q, cases(delta (q_i,w) = q ,delta (q,w) in F) $
]

#question(2)[Montrer que si $L$ rationnel, alors $L^(1\/2)$ aussi.]
#question(3)[Montrer que soit $k in NN$, si $L$ est rationnel, alors $L^(1\/k)$ aussi.]
#question(1)[ Si $L$ est rationnel, est-ce forcément aussi le cas de $union.big_(k>=1) L^(1\/k)$ ?]
#question(4)[ Donner un algorithme qui détermine si un langage rationnel $L$ respecte $L = (L^(1\/2))^((2))$]

#question(4)[ Montrer que si $L$ est rationnel, alors $"Root"(L) = {w in Sigma^* : w^(|w|) in L}$ l'est aussi.]

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