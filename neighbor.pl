%%%
% Is Right to the right of Left in List?
% right_neighbor(1,2,[1,2,3]). % true
% right_neighbor(2,1,[1,2,3]). % false
% right_neighbor(1,X,[1,2,3]). % X = 2
% right_neighbor(3,X,[1,2,3]). % false
%%%
right_neighbor(Left,Right,List) :- append(_,[Left,Right|_],List).

% Is Left to the left of Right in List?
% left_neighbor(2,X,[1,2,3]). % X = 1
left_neighbor(Right,Left,List) :- right_neighbor(Left,Right,List).

% Are X and Y neighbors?
% neighbor(2,X,[1,2,3,4]). % X = 1; X = 3
% neighbor(1,X,[1,2,3,4]). % X = 2
% neighbor(X,Y,[1,2]). % X = 1 Y = 2; X = 2 Y = 1
neighbor(X,Y,List) :- right_neighbor(X,Y,List); left_neighbor(X,Y,List).
