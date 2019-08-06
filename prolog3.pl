/*facts*/

male(ishaan).			
male(yohaan).			

female(alisa).			

mother(liza, ishaan).		
mother(liza, alisa).		
father(yohann, ishaan).
father(yohaan, alisa).

/*rules*/
parent(X, Y) :- mother(X, Y).
parent(X, Y) :- father(X, Y).
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y).
