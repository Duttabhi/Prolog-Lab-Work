/*facts*/
male(harry).
female(liza).

parents(pikns, charles).
parents(liza, charles).
parents(charles, harry).
parents(charles, wasim).


/*rules*/
grandparent(X, Y) :- mother(X, Z), parents(Z, Y).
mother(X, Y) :- female(X), parents(W, Y).
