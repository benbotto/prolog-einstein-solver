% The neighbor.pl file has various predicates for defining what a neighbor is.
% There may be some built-in prolog functions for these things, but the cases are
% trivial to implement.
:- consult('./neighbor.pl').

% The solution is such that there are 5 houses (5 lists) and each of the above
% facts is met.  Each fact is a list with [Nationality,Drink,Smoke,Color,Pet].
solution(Houses) :-
  length(Houses,5),
  % 1. The Brit lives in the red house.
  member([brit,_,_,red,_],Houses),
  % 2. The Swede keeps dogs as pets.
  member([swede,_,_,_,dogs],Houses),
  % 3. The Dane drinks tea. 
  member([dane,tea,_,_,_],Houses),
  % 4. The green house is on the immediate left of the white house.
  left_neighbor([_,_,_,white,_],[_,_,_,green,_],Houses),
  % 5. The green house's owner drinks coffee.
  member([_,coffee,_,green,_],Houses),
  % 6. The owner who smokes Pall Mall rears birds.
  member([_,_,pall_mall,_,birds],Houses),
  % 7. The owner of the yellow house smokes Dunhill.
  member([_,_,dunhill,yellow,_],Houses),
  % 8. The owner living in the center house drinks milk.
  Houses = [_,_,[_,milk,_,_,_],_,_],
  % 9. The Norwegian lives in the first house.
  %member([norwegian,_,_,_,_],Houses),
  Houses = [[norwegian,_,_,_,_],_,_,_,_],
  % 10. The owner who smokes Blends lives next to the one who keeps cats.
  neighbor([_,_,blends,_,_],[_,_,_,_,cats],Houses),
  % 11. The owner who keeps the horse lives next to the one who smokes Dunhill.
  neighbor([_,_,_,_,horse],[_,_,dunhill,_,_],Houses),
  % 12. The owner who smokes Bluemasters drinks beer.
  member([_,beer,bluemasters,_,_],Houses),
  % 13. The German smokes Prince.
  member([german,_,prince,_,_],Houses),
  % 14. The Norwegian lives next to the blue house.
  neighbor([norwegian,_,_,_,_],[_,_,_,blue,_],Houses),
  % 15. The owner who smokes Blends lives next to the one who drinks water.
  neighbor([_,_,blends,_,_],[_,water,_,_,_],Houses),
  % Who owns the fish?
  member([_,_,_,_,fish],Houses).

