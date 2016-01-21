let f x =
  let g x =
    if x = 0 then x else x + 2
  in
  let h y =
    if y = 0 then x else y - 2
  in
  g (h x) + g x
;;

(* 
--------------------------------------------------------------------------------------------
EXERCICE 1 
--------------------------------------------------------------------------------------------
*)

(* List.length *)
let rec longueur l =
  match l with
    | [] -> 0
    | _::r -> 1 + longueur r
;;


(* List.fold left *)
let rec applique f l =
  match l with
    | [] -> []
    | x::r -> (f x) :: (applique f r)
;;

(* List.rev *)
let rec renverse l acc =
  match l with
    |[] -> acc
    | x::r -> renverse r (x::acc) 
;;


(* List.assoc *)
let rec trouve l k =
    match l with
      | [] -> raise Not_found
      | (k0, v)::r ->
	if k0 = k then v
	else
	  trouve r k
;;
	  



(* --------------------------------------------------------------------------------------------
Exercice 2 : 
-------------------------------------------------------------------------------------------- *)


let rec inserer e l =
  match l with
    | [] -> [e]
    | x::r ->
      if x >= e then
	x::e::r
      else
	x::(inserer e r)
;;

let rec insererRelation e l sym =
  match l with
    | [] -> [e]
    | x::r ->
      if sym x e then
	x::(insererRelation e r sym) 
      else
	x::e::r	
;;

(* correction *)

let rec inserer_2 f e l =
  match l with
    | [] -> [e]
    | v::ll ->
      if f v e then (v :: inserer_2 f e ll)
;;

let sup x y = if x >= y then true else false;;
let inf x y = if x < y then true else false;;
let liste = [1;2;3;4;5;6;7];;


(*
let trierInserer sym l =
  let rec trierAux sym l acc =
    match l with
      | [] -> acc
      | x::r -> trierAux sym r (insererRelation x acc sym)
  in
  trierAux sym l []
;;

*)

(* Correction trier *)


(*
let rec trier f l =
  match l with
    | [] -> []
    | e :: ll ->
      let sll = trier f ll in
      inserer_2 f e sll
;;

let _ = trier (fun x y -> x > y) [9;1;8;7;7;1];;


*)



