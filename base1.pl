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

pere(michel, charlie).
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

% Toute personne ayant un époux ou un épouse est marié
marie(X) :-
  epoux(X, Y);
  epouse(X, Y).

% Toute personne mariée est heureuse
heureux(X) :-
  marie(X).

% Toute personne père ou mère de quelqu'un est un parent
parent(X) :-
    pere(X, Y);
    mere(X, Y).

% X est soit père de Y, soit mère de Y
parent_de(X, Y) :-
  pere(X, Y);
  mere(X, Y).

% Réciproquement à definir à partir de parent(,)
enfant_de(Y, X) :-
  parent_de(X, Y).

% À definir à partir de parent et de homme
fils(Y, X) :-
  parent_de(X, Y),
  homme(Y).

% À definir à partir de parent et de femme
fille(Y, X) :-
  parent_de(X, Y),
  femme(Y).

% Y1 et Y2 ont mêmes parents - (Corriger !)
frere_ou_soeur(Y1, Y2) :-
  parent_de(X, Y1),
  parent_de(X, Y2).

% À definir à partir de frère_ou_soeur et de homme - (Corriger !)
frere(Z, Y) :-
  frere_ou_soeur(Z, Y),
  homme(Z).

% À definir à partir de frère_ou_soeur et de femme - (Corriger !)
soeur(Z, Y) :-
  frere_ou_soeur(Y, Z),
  femme(Z).

% Grand-parent est le parent d'un parent de W
grand_parent(W, Y) :-
  parent_de(X, Y),
  parent_de(W, X).

% X est le frère d'un parent de Y - (Corriger !)
oncle(X, Y) :-
  parent_de(X2, Y),
  frere(X, X2).

% X est la soeur d'un parent de Y - (Corriger !)
tante(X, Y) :-
  parent_de(X2, Y),
  soeur(X, X2).



