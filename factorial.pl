% factorial
factorial(0, Ans) :- Ans is 1.
factorial(N, Ans) :-  N > 0, Tmp is N-1, factorial(Tmp, Var), Ans is (Var * N).

% pow(N, P)

pow(0, P, Ans) :- Ans is 0.
pow(N, 0, Ans) :- Ans is 1.
pow(N, P, Ans) :- N > 0, P > 0, Tmp is P-1, pow(N, Tmp, Var), Ans is (N * Var).

% It goes on recursively calling the function till the base condition 
% either Ans is 1 or 0. Now it will backtrack juct like stack "Var" will be first 0 or 1.
% than it will go on updating Var and N * Var till we finally get the answer.


%(write-line "Hello world").
factorial :- write('Hello World, This is my first program in Prolog!!!').
% open prolog console type ['factorial'] than type factorial.

man(socrates).
mortal(X) :- man(X).






