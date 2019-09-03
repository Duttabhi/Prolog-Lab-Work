/*work on facts and rules*/
/*facts*/
studies-with(ram, john).
fat(jerry).
/*Q.) define a predicate that checks if a number is positive or not.
, --> and
; --> or
:- --> if
not --> NOT
*/

positive(X) :- X >= 0.
negative(X) :- X < 0.

/*program likes*/

likes(rosy, john).
likes(john, nance).
likes(nance, trevor).
likes(nance, john).					
friend(X, Y) :- likes(X, Y), likes(Y, X).
friend(X, Y) :- likes(X, Y); likes(Y, X).

/*"/" decimal division && "//" integer division*/
/*define a predicate that checks if its first argument is a number lying in the range from its second to its third argument*/
range(X, Y, Z) :- X >= Y , X < Z.

/*check if a number is even*/
even(X) :- X mod 2 =:= 0. 


/*write a prolog program to find the rules of parent, child, male, female, son, daughter, brother, sister, uncle, aunt and ancestors. Given the fact about father and wife only.*/
male(ram).
male(shyam).
male(ghanshyam).
male(veer).
female(sita).
female(rita).
female(gita).
female(archana).
father(ram, shyam).
father(ram, veer).
father(ram, archana).
father(shyam, ghanshyam).
wife(sita, ram).
wife(rita, shyam).
wife(gita, ghanshyam).

mother(X, Y) :- wife(X, Z), father(Z, Y).
parent(X, Y) :- father(X, Y); mother(X, Y).
child(X, Y) :- father(Y, X); mother(Y, X).
son(X, Y) :- male(X), child(X, Y).
daughter(X, Y) :- female(X), child(X, Y).
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y).
sister(X, Y) :- female(X), parent(Z, X), parent(Z, Y).
uncle(X, Y) :- male(X), brother(X, Z), parent(Z, Y).
aunt(X, Y) :- female(X), sister(X, Z), parent(Z, Y).
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

/*define predicate that takes a number as its first argument and return the square of that number as its second argument*/
square(X, Y) :- Y is X * X.
 
 

