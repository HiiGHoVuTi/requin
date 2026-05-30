#import "../../lib.typ": *
#import "@preview/finite:0.5.0": automaton
#show heading: heading_fct

== Automates à pile

Un _automate à pile_ est un quintuplet $(Sigma, Pi, Q, q_0, pi_0, delta)$ où $Sigma$ et $Pi$ sont des alphabets,
$Q$ est un ensemble d'états, $q_0 in Q$ est un état initial, $pi_0$ est le symbole de fond de pile et $delta subset.eq Q times Sigma_epsilon times Pi_epsilon times Pi_epsilon times Q$ est la relation de transition, où $A_epsilon := A union {epsilon}$.
On peut ensuite définit $delta^star subset.eq Q times Sigma^star times Pi^star times Pi^star times Q$ la fonction de transition étendue avec :

$ forall q in Q, (q, epsilon, epsilon, epsilon, q) in delta^star quad quad
  forall (q, w, alpha, pi beta, q') in delta^star, forall (q', sigma, pi, rho, q''), (q, w sigma, alpha, rho beta, q'') in delta^star
$

On dit qu'un automate _accepte_ $w$ si il existe $q$ tel que $(q_0, w, pi_0, epsilon, q) in delta^star$.
#figure(automaton((
  q0: (q0: "a,𝜀,a / b,𝜀,b", q1: "𝜀,𝜀,𝜀"),
  q1: (q1: "a,a,𝜀 / b,b,𝜀", q2: "𝜀,𝜋,𝜀"),
  q2: ()
)), caption: [L'automate $cal(A)_0$])

#q(1)[Déterminer le langage $cal(L_0)$ reconnu par $cal(A)_0$.]

#q(1)[Est-il rationnel ? algébrique ?]

#q(2)[Montrer que tout langage algébrique est reconnu par un automate à pile.]

Si $cal(A) =: (Sigma, Pi, Q, q_0, delta)$ est un automate et $q,q' in Q$ et $pi in Pi$, on pose le lange intermédiaire\ $cal(L)_(q,q',pi) := { w in Sigma^star : (q, w, pi, epsilon,q') in delta^star }$.

#q(1)[Exprimer $cal(L(A))$ en fonction des $cal(L)_(q,q',pi)$.]

#q(2)[Exprimer $cal(L)_(q,q',pi)$ en fonction d'un nombre fini de langages intermédiaires.]

#q(2)[En déduire que tout langage reconnu par un automate à pile est algébrique.]

On peut en déduire des preuves plus simples des propriétés de clôture rationnelle des langages algébriques.

#q(2)[Montrer que l'intersection et l'union d'un langage algébrique et d'un langage rationnel sont algébriques.]
