% factorial
factorial(0, Ans) :- Ans is 1.
factorial(N, Ans) :-  N > 0, Tmp is N-1, factorial(Tmp, Var), Ans is (Var * N).

% pow(N, P)

pow(0, P, Ans) :- Ans is 0.
pow(N, 0, Ans) :- Ans is 1.
pow(N, P, Ans) :- N > 0, P > 0, Tmp is P-1, pow(N, Tmp, Var), Ans is (N * Var).




