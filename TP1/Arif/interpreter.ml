open Ast
open Error


(* Ulysse.gerard@inria.fr *)


let not_implemented () = failwith "Not implemented"

(* Les expressions de notre langage calculent des valeurs qui sont soit
   des entiers, soit des booléens, soit la valeur unité qui ne représente
   rien.
*)
type value =
  (* À compléter *)
  | Vint of int
  | Vbool of bool
  | Vunit


(* Cette déclaration nous permet de définir des environnements associant
   des valeurs à des chaînes de caractères.

   Le type de ces environnements est noté ['a Env.t], sachant que dans
   dans notre cas le paramètre ['a] sera systématiquement [value].
   Pour manipuler ces environnements, on a notamment les fonctions
   [Env.find : string -> 'a Env.t -> 'a] et
   [Env.add  : string -> 'a -> 'a Env.t -> 'a Env.t],
   ainsi que la constante [Env.empty : 'a Env.t].
   Voir la documentation de la bibliothèque Caml [Map.Make].
*)
module Env = Map.Make(String)


(* La fonction suivante prend une valeur (de type [value]) et en extrait
   le booléen qu'elle contient.
   Elle déclenche une erreur [Interpretation_error] si elle est utilisée
   sur une valeur non adaptée (comme [Vunit]). L'argument [pos] sert en cas
   d'erreur à indiquer la partie du fichier interprété qui a provoqué l'erreur.
   
   get_bool : Ast.position -> value -> bool
*)
let get_bool pos v =
  match v with
    | Vbool b -> b
    | _       -> error Interpretation_error pos

      
let get_int pos v =
  match v with
    | Vint b -> b
    | _ -> error Interpretation_error pos


let is_bool e =
  match e with
    | Vbool e -> true
    | _ -> false

let is_int e =
  match e with
    | Vint e -> true
    | _ -> false

(* Voici le cœur de l'interpréteur, qu'il va falloir compléter. Cette fonction
   prend en argument un environnement associant des valeurs à des chaînes de
   caractères ainsi qu'une expression de la forme décrite dans [Ast.mli], et
   renvoie la valeur calculée.

   interpret_expr : value Env.t -> Ast.node_expr -> value
*)
let rec interpret_expr env e =
  match e.expr with
    (* Voici deux cas en exemple, à vous d'écrire les autres ! *)

    | Eunop (Unot, e)   ->
      let b = get_bool e.pos (interpret_expr env e) in
      Vbool (not b)

    | Eunop (Uminus, e)   ->
      let b = get_int e.pos (interpret_expr env e) in
      Vint (-b)

    | Eprint_newline e ->
      let _ = interpret_expr env e in
      print_newline ();
      Vunit

    | Eprint_int e -> 
      let i = get_int e.pos (interpret_expr env e) in
      print_int(i);
      Vunit

    | Econst c ->
      begin match c with
	| Cint x ->Vint x
	| Cbool x -> Vbool x
	| Cunit -> Vunit
      end 
    | Eseq list ->
      let rec aux list =
	match list with
	  | [] -> failwith "Sequence vide"
	  | [e] -> interpret_expr env e (*Renvoie la valeur du dernier élément *)
	  | e :: tl ->
	    let _ = interpret_expr env e in aux tl (* On se moque de la valeur tant que ce n'est pas la dernière *)

      in aux list

    | Ebinop (op,exp1,exp2) ->
      match op with
	| Badd ->
	  let e1 = get_int exp1.pos (interpret_expr env exp1)
	  and e2 = get_int exp2.pos (interpret_expr env exp2)
	  in
	  Vint (e1+e2)
	    
	| Bsub ->
	  let e1 = get_int exp1.pos (interpret_expr env exp1)
	  and e2 = get_int exp2.pos (interpret_expr env exp2)
	  in
	  Vint (e1-e2)
	    
	|Bdiv ->
	  let e1 = get_int exp1.pos (interpret_expr env exp1)
	  and e2 = get_int exp2.pos (interpret_expr env exp2)
	  in
	  Vint (e1/e2)
	    
	| Bmul ->
	  let e1 = get_int exp1.pos (interpret_expr env exp1)
	  and e2 = get_int exp2.pos (interpret_expr env exp2)
	  in
	  Vint (e1*e2)

	| Beq ->
	  let e1 = (interpret_expr env exp1)
	  and e2 = (interpret_expr env exp2)
	  in
	  
	  if ((is_bool e1) && (is_bool e2)) then
	      let e1bool = get_bool exp1.pos e1
	      and e2bool = get_bool exp2.pos e2
	      in Vbool (e1bool = e2bool)
	  else if ((is_int e1) && (is_int e2)) then
	      let e1int = get_int exp1.pos e1
	      and e2int = get_int exp2.pos e2
	      in Vbool (e1int = e2int)
	  else
	    assert false

	|Bneq ->
	  let e1 = (interpret_expr env exp1)
	  and e2 = (interpret_expr env exp2)
	  in
	  
	  if ((is_bool e1) && (is_bool e2)) then
	      let e1bool = get_bool exp1.pos e1
	      and e2bool = get_bool exp2.pos e2
	      in Vbool (e1bool <> e2bool)
	  else if ((is_int e1) && (is_int e2)) then
	      let e1int = get_int exp1.pos e1
	      and e2int = get_int exp2.pos e2
	      in Vbool (e1int <> e2int)
	  else
	    assert false
	  

	  
	 
		
      
    | _ -> not_implemented ()


(* Enfin, la fonction principale, qu'il faut aussi compléter, et qui doit
   appliquer la fonction d'interprétation des expressions à toutes les
   instructions du programme. N'oubliez pas que les instructions peuvent
   agir sur l'environnement !

   interpret_prog : Ast.prog -> unit
*)

      
(* P est une liste d'instructions *)
let interpret_prog (p : Ast.prog) : unit =
  (* À compléter ! *)

  let rec inter_prog_aux env p  =
    match p with
      | [] -> print_newline() (* On a terminé *)
      | Icompute e :: tl ->
	let _ =  interpret_expr env e (* On se moque de ce que ça renvoie *)
	  in inter_prog_aux env tl
      | _ ->  not_implemented()
  in
  inter_prog_aux (Env.empty) p 
