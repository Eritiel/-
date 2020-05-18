read_list(A,N):-rl([],A,0,N).
rl(A,A,N,N):-!.
rl(B,A,I,N):-I1 is I+1,read(X), append(B,[X],B1), rl(B1,A,I1,N).

bubblesort(InputList,SortList) :-
    swap(InputList,List), ! , bubblesort(List,SortList).
bubblesort(SortList,SortList).

swap([X,Y|List],[Y,X|List]) :- X > Y.
swap([Z|List],[Z|List1]) :- swap(List,List1).

write_list([X]):-write(X),!.
write_list([X|Y]):-write(X),write_list(Y).
