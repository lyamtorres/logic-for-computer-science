% Commande pour compiler : swipl -s base1.pl

% Question 1

homme(jean).
homme(gaston).
homme(michel).
homme(popeye).
homme(david).
homme(charly).

femme(marie).
femme(gertrude).
femme(laure).
femme(olive).
femme(virginie).
femme(julie).
femme(mimosa).
femme(sidonie).

pere(jean, gaston).
pere(jean, laure).
pere(jean, popeye).

pere(gaston, david).
pere(gaston, virginie).

pere(michel, charly).
pere(michel, julie).

pere(popeye, mimosa).
pere(popeye, sidonie).

mere(marie, gaston).
mere(marie, laure).
mere(marie, popeye).

mere(gertrude, david).
mere(gertrude, virginie).

mere(laure, charly).
mere(laure, julie).

mere(olive, mimosa).
mere(olive, sidonie).

epoux(jean, marie).
epoux(gaston, gertrude).
epoux(michel, laure).
epoux(popeye, olive).

epouse(marie, jean).
epouse(gertrude, gaston).
epouse(laure, michel).
epouse(olive, popeye).

epoux(ken, julie).
epouse(julie, ken).
mere(julie, franc).

% Question 2

% Toute personne ayant un époux ou un épouse est marié | OK
est_marie(X) :-
  epoux(X, Y);
  epouse(X, Y).

% Toute personne mariée est heureuse | OK
heureux(X) :-
  est_marie(X).

% Toute personne père ou mère de quelqu'un est un parent | Corriger rédondances
parent(P) :-
  pere(P, E);
  mere(P, E).

% X est soit père de E, soit mère de E | OK
parent_de(P, E) :-
  pere(P, E);
  mere(P, E).

% Réciproquement à definir à partir de parent(,) | OK
enfant_de(E, P) :-
  parent_de(P, E).

% À definir à partir de parent et de homme | OK
fils(E, P) :-
  parent_de(P, E),
  homme(E).

% À definir à partir de parent et de femme | OK
fille(E, P) :-
  parent_de(P, E),
  femme(E).

% E1 et E2 ont mêmes parents | OK
frere_ou_soeur(E1, E2) :-
  parent_de(P, E1),
  parent_de(P, E2),
  E1 \= E2.

% À definir à partir de frère_ou_soeur et de homme | OK
frere(G, E) :-
  frere_ou_soeur(G, E),
  homme(G).

% À definir à partir de frère_ou_soeur et de femme | OK
soeur(F, E) :-
  frere_ou_soeur(F, E),
  femme(F).

% Grand-parent est le parent d'un parent de E | OK
grand_parent(GP, E) :-
  parent_de(P, E),
  parent_de(GP, X).

% O est le frère d'un parent de E | OK
oncle(O, E) :-
  parent_de(P, E),
  frere(O, P).

% X est la soeur d'un parent de E | OK
tante(T, E) :-
  parent_de(P, E),
  soeur(T, P).

% A est un parent de E, ou un grand-parent, ou un arrière-grand-parent | À terminer !
ancetre(A, E) :- 
  parent(A, M), 
  ancetre(M, E).