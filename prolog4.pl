/*facts*/

male(ishaan).			
male(yohaan).
male(croot).			

female(alisa).			

mother(liza, ishaan).		
mother(liza, alisa).		
father(yohaan, ishaan).
father(yohaan, alisa).
brother-in-law(yohaan, croot).
sister(liza, croot).

/*rules*/
parent(X, Y) :- mother(X, Y).
parent(X, Y) :- father(X, Y).
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y).
uncle(X, Y) :- male(X), brother-in-law(Z, X), parent(Z, Y). 
uncle(X, Y) :- male(X), sister(Z, X), parent(Z, Y). 

