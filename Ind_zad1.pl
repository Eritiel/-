findNum(_,A,_,Res,Res):-A>100000,!.
findNum(0,A,Sum,B,Res):-A1 is A+1, Sum \=A, findNum(A1,A1,0,B,Res), !.
findNum(0,Sum,Sum,B,Res):-A1 is Sum+1,
B1 is Sum+B, findNum(A1,A1,0,B1,Res), write(Sum), write("|"), !.
findNum(S,A,Sum,B,Res):-S\=0,S1 is S mod 10, Sum1 is S1*S1*S1*S1*S1, Sum2 is Sum+Sum1, S2 is S div 10, findNum(S2,A,Sum2, B,Res).

findNum(2,2,0,0,Res).
