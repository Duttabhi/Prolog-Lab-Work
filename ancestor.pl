female(catherine).

female(elizabeth).

female(sophia).

female(claudia).

female(fay).

 

/*  parent ( child, parent).  */

parent(charles1, james1).

parent(elizabeth, james1).

parent(charles2, charles1).

parent(catherine, charles1).

parent(james2, charles1).

parent(sophia, elizabeth).

parent(george1, sophia).

parent(george1, sam).

parent(catherine, fay).

parent(charles2, fay).

parent(james2, fay).

parent(sophia, paul).

parent(elizabeth,claudia).

parent(charles1, claudia).

 

/* married ( A,B)  - A is married to B */

married ( james1, claudia).

married( claudia, james1).

married(charles1, fay).

married(fay, charles1).

married(elizabeth, paul).

married(paul, elizabeth).

married(sophia, sam).

married(sam, sophia).

 

 

/* rules */

/* Dad is the father of Child if he is male and is the child's parent */

father(Child, Dad) :- male(Dad), parent(Child, Dad).

 

 

/* Mom is the mother of Child if she is female and the child's parent*/

mother(Child, Mom) :- female(Mom), parent(Child, Mom).

 

 

/* Bro is the brother of Sibling if he is male and has the same parents as the sibling*/

brother(Sibling, Bro) :- male(Bro), father(Sibling, Father), father(Bro, Father), Bro \= Sibling,

                            mother(Sibling, Mother), mother(Bro, Mother).

 

 

/* Sis is the sister of Sibling if she is female and has the same parents as the sibling*/

sister(Sibling, Sis) :- female(Sis), father(Sibling, Father), father(Sis, Father), Sis \= Sibling,

                             mother(Sibling, Mother), mother(Sis, Mother).

 

 

/* Auntie is the aunt of Kid if she is female and a sister of the kid's parent or

                        she is female and married to the kid's uncle

 

This is the definition of an Aunt as given by dictinoary.com :

 

   1. The sister of one's father or mother.

   2. The wife of one's uncle.

 

*/

aunt(Kid, Auntie) :- female(Auntie), parent(Kid, Parent), sister(Parent, Auntie).

aunt(Kid, Auntie) :- female(Auntie), parent(Kid, Person), brother(Person, Brother), married(Auntie, Brother).

 

 

/* Unclebuck is the uncle of Kid if he is male and a brother of the kid's parent or

                            he is male and married to the kid's aunt

 

This is the definition of an Aunt as given by dictinoary.com :

 

   1. The brother of one's mother or father.

   2. The husband of one's aunt.

 

 

*/

uncle(Kid, UncleBuck) :- male(UncleBuck), parent(Kid, Parent), brother(Parent, UncleBuck).

uncle(Kid, UncleBuck) :- male(UncleBuck), parent(Kid, Person), sister(Person, Sister), married(UncleBuck, Sister).

 

 

/* Grandmother is the grandmother of Grandchild if she is female and the parent of the grandchild's parent */

grandmother(Grandchild, Grandmother) :- female(Grandmother), parent(Grandchild, Parent), parent(Parent, Grandmother).

 

 

/* Grandfather is the grandfather of GrandChild if he is male and the parent of the child's parent */

grandfather(Grandchild, Grandfather) :- male(Grandfather), parent(Grandchild, Parent), parent(Parent, Grandfather).

 

 

/*

   BInLaw is the brother in law of SiblingInLaw

   You are the brother in law if: you are male and

                            The brother of one's spouse.

                          The husband of one's sister.

                          The husband of the sister of one's spouse

*/

brother_in_law(SiblingInLaw, BInLaw) :- married(SiblingInLaw, Person), brother(Person, BInLaw).

brother_in_law(SiblingInLaw, BInLaw) :- sister(SiblingInLaw, Sister), married(Sister, BInLaw).

brother_in_law(SiblingInLaw, BInLaw) :- married(SiblingInLaw, Person), sister(Person, Sister), married(Sister, BInLaw).

 

 

/*

   SInLaw is the sister in law of SiblingInLaw

   You are the sister in law if: you are female and

                           The sister of one's spouse.

                         The wife of one's brother.

                         The wife of the brother of one's spouse.

*/

sister_in_law(SiblingInLaw, SInLaw) :- married(SiblingInLaw, Person), sister(Person, SInLaw).

sister_in_law(SiblingInLaw, SInLaw) :- brother(SiblingInLaw, Brother), married(Brother, SInLaw).

sister_in_law(SiblingInLaw, SInLaw) :- married(SiblingInLaw, Person), brother(Person, Brother), married(Brother, SInLaw).

 

     

/*

   MInLaw is the mother in law of ChildInLaw

   You are the mother in law if: you are female and

                         your son is married to ChildInLaw or

                         your daughter is married to ChildInLaw

*/

mother_in_law(ChildInLaw, MInLaw) :- female(MInLaw), married(ChildInLaw, Child), parent(Child, MInLaw).

 

 

/*

   FInLaw is the father in law of ChildInLaw

   You are the father in law if: you are male and

                         your son is married to ChildInLaw or

                         your daughter is married to ChildInLaw

*/

father_in_law(ChildInLaw, FInLaw) :- male(FInLaw), married(ChildInLaw, Child), parent(Child, FInLaw).

 

 

/* Person is an ancestor of Descendent

      You are the ancestor if you are the parent of the person or

                        you are the parent of the person's parent and so forth

*/

ancestor(Person, Ancestor) :- parent(Person, Ancestor).

ancestor(Person, Ancestor) :- parent(Person, Parent), ancestor(Parent, Ancestor).

 

 

/* Person is a descendent of Ancestor

      You are the descendent if you are the child of the person or

                        your parent is the child of the person and so forth

*/

descendent(Person, Descendent) :- parent(Descendent, Person).

descendent(Person, Descendent) :- parent(Descendent, Someone), descendent(Person, Someone).