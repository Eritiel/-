in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

write_list([X]):-write(X),!.
write_list([X|Y]):-write(X),write_list(Y).

List=[_],
(
  (
    (   in_list(List,[vitya]); in_list(List,[kolya])),

    (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])),

    (
     (  (   in_list(List,[vitya]); in_list(List,[kolya])),
        (   in_list(List,[vitya]); in_list(List,[jura])));

     (  (   in_list(List,[andrew]); in_list(List,[dima]);in_list(List,[jura])),
        (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])))),

    (
     (  (   in_list(List,[vitya]); in_list(List,[kolya])),
        (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])));
     (  (   in_list(List,[andrew]); in_list(List,[dima]);in_list(List,[jura])),
        (   in_list(List,[vitya]); in_list(List,[jura])))));


   (
    (   in_list(List,[andrew]); in_list(List,[dima]);in_list(List,[jura])),

    (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])),

    (
     (  (   in_list(List,[vitya]); in_list(List,[kolya])),
        (   in_list(List,[vitya]); in_list(List,[jura])));

     (  (   in_list(List,[andrew]); in_list(List,[dima]);in_list(List,[jura])),
        (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])))),

    (
     (  (   in_list(List,[vitya]); in_list(List,[kolya])),
        (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])));
     (  (   in_list(List,[andrew]); in_list(List,[dima]);in_list(List,[jura])),
        (   in_list(List,[vitya]); in_list(List,[jura])))));


  (
    (   in_list(List,[vitya]); in_list(List,[kolya])),

    (   in_list(List,[vitya]); in_list(List,[jura])),

    (
     (  (   in_list(List,[vitya]); in_list(List,[kolya])),
        (   in_list(List,[vitya]); in_list(List,[jura])));

     (  (   in_list(List,[andrew]); in_list(List,[dima]);in_list(List,[jura])),
        (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])))),

    (
     (  (   in_list(List,[vitya]); in_list(List,[kolya])),
        (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])));
     (  (   in_list(List,[andrew]); in_list(List,[dima]);in_list(List,[jura])),
        (   in_list(List,[vitya]); in_list(List,[jura])))));





  (
    (   in_list(List,[vitya]); in_list(List,[kolya])),

    (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])),

    (
     (  (   in_list(List,[vitya]); in_list(List,[kolya])),
        (   in_list(List,[vitya]); in_list(List,[jura])));

     (  (   in_list(List,[andrew]); in_list(List,[dima]);in_list(List,[jura])),
        (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])))));





  (
    (   in_list(List,[vitya]); in_list(List,[kolya])),

    (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])),

    (
     (  (   in_list(List,[vitya]); in_list(List,[kolya])),
        (   in_list(List,[kolya]); in_list(List,[andrew]);in_list(List,[dima])));
     (  (   in_list(List,[andrew]); in_list(List,[dima]);in_list(List,[jura])),
        (   in_list(List,[vitya]); in_list(List,[jura])))))),



 write_list(List).
