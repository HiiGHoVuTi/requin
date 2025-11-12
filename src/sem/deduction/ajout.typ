#import "../../lib.typ": *
#show :template

#set_correct()

== Ajout d'opérateurs à la logique

Dans cet exercice on considère les règles de la logique classique. On cherche à ajouter certains opérateurs de la logique propositionelle et de faire des liens avec des système déductif.

=== Ajout de l'équivalence

En général, l'équivalence est défini de manière "méta" en disant que $A <-> B$ est une notation pour $(A -> B) and (B -> A)$. On cherche ici a vraiment rajouter à notre grammaire de terme le symbole $<->$ avec une sémantique.

#q(0)[Soit $mu$ une valuation, proposer une définition de $mu tack.double A <-> B$ telle que $mu tack.double A <-> B$ si et seulement si $mu tack.double (A -> B) and (B -> A)$]

#c[On défini $mu tack.double A <-> B$ si et seulement si soit $mu tack.double A$ et $mu tack.double B$, soit $mu tack.double.not A$ et $mu tack.double.not B$.]

#q(1)[Proposer une règle d'introduction et deux règles d'élimination.]

#c[Par exemple, on peut poser:
$
 (Gamma, A tack B #h(15pt) Gamma, B tack A)/(Gamma tack A <-> B) scripts(<->)_i
 #h(50pt)
 (Gamma tack A <-> B)/(Gamma tack A -> B) scripts(<->)_l
 #h(50pt)
 (Gamma tack A <-> B)/(Gamma tack B -> A) scripts(<->)_r
$
]

#q(2)[Montrer leur correction.]

#c[
- *Règle $scripts(<->)_i$:* Suppossons que les prémisses sont correctes, montrons que la conclusion l'est. Soit $mu tack.double Gamma$. Si $mu tack.double A$, alors par la première prémisse, $mu tack.double B$ donc $mu tack.double A <-> B$. Sinon, $mu tack.double.not A$. Il est alors absurde que $mu tack.double B$ car par la deuxième prémise ont aurai $mu tack.double A$. Donc $mu tack.double A <-> B$
- *Règle $scripts(<->)_l$:* Suppossons que les prémisses sont correctes, montrons que la conclusion l'est. Soit $mu tack.double Gamma$. Supposons que $mu tack.double A$. Alors comme $mu tack A <-> B$, $mu tack.double B$. Donc $mu tack.double A -> B$.
- La règle $scripts(<->)_r$ est simmillaire à $scripts(<->)_l$.
]

#q(1)[Montrer les séquents $A <-> B tack (A -> B) and (B -> A)$ et $(A -> B) and (B -> A) tack A <-> B$]


=== Ajout du XOR

On rajoute au langage des formules logique propositionelles l'opérateur $xor$ (prononcé XOR) d'arité 2, tel que pour $eta$ une valuation, on a $eta tack.double phi xor psi$ si et seulement si $eta tack.double phi$ et $eta tack.double.not psi$ ou bien $eta tack.double.not phi$ et $eta tack.double psi$.

#q(1)[Proposer 2 règles d'introduction et 1 règle d'élimination pour l'opérateur $xor$.]
#c[
$
 (Gamma tack A #h(15pt) Gamma, B tack bot)/(Gamma tack A xor B) scripts(xor)^1_i
 #h(50pt)
 (Gamma, A tack bot #h(15pt) Gamma tack B)/(Gamma tack A xor B) scripts(xor)^2_i
 #h(50pt)
 (Gamma tack A xor B #h(15pt) Gamma, A, B tack C )/(Gamma tack A) scripts(xor)_e
$
]
#q(2)[Montrer la correction de la règle.]
#q(1)[Utilliser vos règles pour montrer que $tack A xor B -> B xor A$]



=== L'opérateur de Sheffer (NAND)

On rajoute au langage des formules logique propositionelles _l'opérateur de Sheffer_ $A arrow.t B$ tel que $A arrow.t B equiv not (A and B)$.

#q(0)[Montrer que $A -> B equiv A arrow.t (B arrow.t B)$]
#q(1)[Proposer une règle d'introduction et une règle d'élimination pour l'opérateur de Sheffer et montrer qu'elles sont correcte.] 
#q(2)[Montrer que pour chaque formule $F$ il existe une formule $F^*$ équivalente n'utillisant que l'opérateur de sheffer et $top$ ou $bot$.]
#q(2)[Montrer que si $tack F$ est prouvable en logique classique alors $tack F^*$ l'est aussi.]

