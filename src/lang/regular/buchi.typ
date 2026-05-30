#import "../../lib.typ": *
#import "@preview/finite:0.5.0": automaton
#show heading: heading_fct

== Automates de Büchi

Un _automate de Büchi_ est un automate fini (non-déterministe). Soit $Sigma$ un alphabet puis $cal(X) subset.eq Sigma^star$.
On note $cal(X)^omega$ l'ensemble des _mots infinis_ de $cal(X)$ : c'est l'ensemble des suites $(w_i in cal(X))_(i in NN)$. En particulier, $Sigma^omega$ est l'ensemble des mots infinis avec des lettres dans $Sigma$.
Si $cal(A)$ est un automate de Büchi et $x in Sigma^omega$, on dit que $cal(A)$ _accepte_ $x$ lorsqu'il existe un chemin infini dans $cal(A)$ étiqueté par $x$ commençant dans un état initial et passant une infinité de fois par un état final.

#q(0)[Déterminer le langage reconnu par l'automate suivant :
  #figure(automaton((
    q0: (q1: 0, q0: "0,1"),
    q1: (q1: 0),
  )))
]

#q(1)[Proposer un automate reconnaissant $(01)^omega$.]

#q(1)[Soient $cal(A\,B)$ deux automates de Büchi. Montrer que $cal(L(A) union L(B))$ est reconnu par un automate de Büchi.]

#q(1)[Soient $cal(A)$ un automate de Büchi et $L$ un langage régulier, montrer que le concaténé #linebreak() $L dot cal(L(A)) := {u v : u in L, v in cal(L(A))}$ est reconnu par un automate de Büchi.]

#q(1)[Si $K$ est un langage régulier, montrer que $K^omega$ est reconnu par un automate de Büchi.]

#q(1)[Montrer que si $cal(A), cal(B)$ sont des automates de Büchi, $cal(L(A)) sect cal(L(B))$ est reconnaissable par un automate de Büchi.]

#q(2)[L'ensemble des langages reconnaissables par automates de Büchi change-t-il si on choisit des automates déterministes au lieu de non-déterministes ?]
