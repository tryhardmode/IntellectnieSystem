% Создание предикатов для обработки списков 
%===============1. Принадлежит ли элемент списку =======================
% belongs(3, [1, 2, 3, 4, 5]).
belongs(X, [X|_]).      % X — первый элемент в голове списка
belongs(X, [_|Tail]) :- % проверка, если элемент в хвосте списка
    belongs(X, Tail).

%===============2. Опpеделить, являются ли два заданных элемента соседними в списке. =======================

%декларативная интепретация (описываем программе что хотим получить, без описания того, как это нужно получать(что 
%искать или что вычислять)
sosednie(X, Y, [X, Y | _]).  % X и Y — первые два элемента списка
sosednie(X, Y, [_ | T]) :- sosednie(X, Y, T).  % Рекурсивный случай

%процедурная интерпретация (набор пошаговой инструкции, где описан алгоритм поиска соседних элементов)
sosednie(X, Y, List) :-
    proverka_sosednih(List, X, Y).

proverka_sosednih([X, Y | _], X, Y).  % Если первые два элемента совпали, успех
proverka_sosednih([_ | T], X, Y) :-   % Иначе переходим к хвосту списка
    proverka_sosednih(T, X, Y).

% sosednie(a, b, [c, a, b, d]). true / sosednie(b, a, [c, a, b, d]). false

%===============3. Максимальный и минимальный элемент списка =======================
list_max([X], X). % Максимум в списке из одного элемента — сам элемент

% list_max([1, 5, 3, 9, 2], Max).
list_max([Head|Tail], Max) :- % Сравниваем голову со значением максимума в хвосте
    list_max(Tail, TailMax), % Находим максимум в хвосте
    Max is max(Head, TailMax). % Выбираем большее из головы и хвоста

list_min([X], X). % Минимум в списке из одного элемента — сам элемент

% list_min([3, 5, 1, 9, 2], Min).
list_min([Head|Tail], Min) :- % Сравниваем голову со значением минимума в хвосте
    list_min(Tail, TailMin), % Находим минимум в хвосте
    Min is min(Head, TailMin). % Выбираем меньшее из головы и хвоста
