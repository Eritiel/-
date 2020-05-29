:- dynamic gender/2, alive/2, signs/2, age/2, hair/2, family/2, pets/2, forest/2, height/2.

write_list([]):-!.
write_list([H|T]):-write(H), write(" "), write_list(T).

write_str([]):-!.
write_str([H|T]):-write(H), write_str(T).

read_str(A):-get0(X),get0(X1),r_str(X1,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1), get0(X1), r_str(X1,A,B1).

start_game:-see('base_of_pers.txt'), get_pers, seen, question1(Answer1), question2(Answer2), question3(Answer3), question4(Answer4), question5(Answer5), question6(Answer6), question7(Answer7), question8(Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8), check_answers(Answer1, Answer2, Answer3, Answer4, Answer5, Answer6, Answer7, Answer8),!.

get_pers:-readln(Character), Character\= [], readln(Info), assertGender(Character, Info), get_pers.
get_pers:-!.

assertGender(_,[]):-!.
assertGender(Person,[H|T]):-asserta(gender(Person,H)),assertAlive(Person,T).

assertAlive(_,[]):-!.
assertAlive(Person,[H|T]):-asserta(alive(Person,H)), assertSigns(Person,T).

assertSigns(_,[]):-!.
assertSigns(Person,[H|T]):-asserta(signs(Person,H)), assertAge(Person,T).

assertAge(_,[]):-!.
assertAge(Person,[H|T]):-asserta(age(Person,H)), assertHair(Person,T).

assertHair(_,[]):-!.
assertHair(Person,[H|T]):-asserta(hair(Person,H)), assertFamily(Person,T).

assertFamily(_,[]):-!.
assertFamily(Person,[H|T]):-asserta(family(Person,H)), assertPets(Person,T).

assertPets(_,[]):-!.
assertPets(Person,[H|T]):-asserta(pets(Person,H)), signs(Person, Sign), Sign = 1, hair(Person, Color), Color = 2, family(Person,Members), Members = 3, assertForest(Person,T), !.
assertPets(Person, [_|T]):-assertHeight(Person, T).

assertForest(_,[]):-!.
assertForest(Person,[H|_]):-asserta(forest(Person,H)).

assertHeight(_,[]):-!.
assertHeight(Person,[H|_]):-asserta(height(Person,H)).


question1(Answer):-write('Пол вашего персонажа?'), nl, write('1. Мужской'), nl, write('2. Женский\n'),read(Answer).

question2(Answer):-write('Ваш персонаж ещё есть в аске?'), nl, write('1. Да'), nl, write('2. Нет\n'),read(Answer).

question3(Answer):-write('Есть ли у персонажа особые признаки растения?'), nl, write('1. Да'), nl, write('2. Нет\n'),read(Answer).

question4(Answer):-write('Возраст вашего персонажа?'), nl, write('1. Взрослый'), nl, write('2. Подросток'), nl, write('3. Ребёнок\n'),read(Answer).

question5(Answer):-write('У вашего персонажа естественный цвет волос?'), nl, write('1. Да'), nl, write('2. Нет\n'),read(Answer).

question6(Answer):-write('Какая у персонажа ситуация в семье?'), nl, write('1. У него обычная семья'), nl, write('2. У него большая семья'), nl, write('3. Он потерял семью или члена семьи, или у него нет семьи\n'),read(Answer).

question7(Answer):-write('Есть ли у персонажа домашние животные?'), nl, write('1. Да'), nl, write('2. Нет\n'),read(Answer).

question8(_,_,1,_,2,3,_,Answer):- write('Ваш персонаж живёт в лесу?'),nl,write('1. Да'), nl, write('2. Нет\n'),read(Answer).

question8(_,_,_,_,_,_,_,Answer):- write('Ваш персонаж высокого роста?'),nl,write('1. Да'), nl, write('2. Нет\n'),read(Answer).


check_answers(Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8):- gender(Person,Answer1), alive(Person,Answer2), signs(Person,Answer3), age(Person, Answer4), hair(Person, Answer5), family(Person, Answer6), pets(Person, Answer7), (forest(Person,Answer8); height(Person,Answer8)), write('Ваш персонаж - '), write_str(Person), deleteInfo, !.
check_answers(Answer1,Answer2,Answer3,Answer4,Answer5,Answer6,Answer7,Answer8):- write('Ваш персонаж не был найден. Хотите его добавить?\n1. Да\n2. Нет\n'), read(Answer), user_answer(Answer, [Answer1, Answer2, Answer3, Answer4, Answer5, Answer6, Answer7, Answer8]),deleteInfo.

user_answer(1, List):- write('Введите имя персонажа: '), read_str(PersonName), name(Person, PersonName), addPerson(Person, List), !.
user_answer(2, _):- !.

deleteInfo:-deleteGender, deleteAlive, deleteSigns, deleteAge, deleteHair, deleteFamily, deletePets, deleteForest, deleteHeight.

deleteGender:-repeat,(gender(X,Y) -> retract(gender(X,Y)),fail;X=nil,Y=nil,!).
deleteAlive:-repeat,(alive(X,Y) -> retract(alive(X,Y)),fail;X=nil,Y=nil,!).
deleteSigns:-repeat,(signs(X,Y) -> retract(signs(X,Y)),fail;X=nil,Y=nil,!).
deleteAge:-repeat,(age(X,Y) -> retract(age(X,Y)),fail;X=nil,Y=nil,!).
deleteHair:-repeat,(hair(X,Y) -> retract(hair(X,Y)),fail;X=nil,Y=nil,!).
deleteFamily:-repeat,(family(X,Y) -> retract(family(X,Y)),fail;X=nil,Y=nil,!).
deletePets:-repeat,(pets(X,Y) -> retract(pets(X,Y)),fail;X=nil,Y=nil,!).
deleteForest:-repeat,(forest(X,Y) -> retract(forest(X,Y)),fail;X=nil,Y=nil,!).
deleteHeight:-repeat,(height(X,Y) -> retract(height(X,Y)),fail;X=nil,Y=nil,!).

addPerson(PersonName,List):-append('base_of_pers.txt'), nl, write(PersonName), nl, write_list(List), told.



























