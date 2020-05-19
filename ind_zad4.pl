
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

write_list([X]):-write(X),!.
write_list([X|Y]):-write(X),write_list(Y).