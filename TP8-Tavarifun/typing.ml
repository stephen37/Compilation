open Ast
open Error

exception FoundIt of ident


(* Informations données par l'environnement de typage. *)
type type_annot =
  | TA_var of typ
  | TA_fun of typ * (typ list)
  | TA_struct of (ident * typ * bool) list


(* Type de l'environnement de typage. *)
module Env = Map.Make(String)
type  tenv = type_annot Env.t

(* Environnement vide. *)
let empty_env = Env.empty
(* Environnement de base, à compléter pour tenir compte d'éventuelles fonctions
   ou variables primitives, par exemple [print_int] et [print_newline] si
   vous en avez fait des fonctions ordinaires (extension "uniformisation" du
   TP précédent). *)
let base_env = empty_env

(* Ajout à un nœud de l'information de type. *)
let upd_type ne ty = ne.typ <- ty

(* Fonction à appeler pour rapporter des erreurs de types. *)
let type_error l t1 t2 = error (Type_error(t1, t2)) l

let not_implemented() = failwith "Not implemented"

let rec check_types l ty1 ty2 =
  match ty1, ty2 with
    | Tunit, Tunit | Tbool, Tbool | Tint, Tint -> ()
    | Tref ty1, Tref ty2 -> check_types l ty1 ty2
    | Toption t1, Toption t2 -> check_types l t1 t2
    | Tnone, Toption _ -> ()
    | Toption _, Tnone -> ()
    | Tnone, Tnone -> ()
    | Tident t1, Tident t2 when String.compare t1 t2 == 0 -> ()
    | _, _ -> type_error l ty1 ty2

let rec type_expr t_env f_env ne =
  match ne.expr with
    | Econst Cunit     ->
      (* Met à jour le type du nœud. *)
      upd_type ne Tunit
    | Econst (Cint i)  -> upd_type ne Tint
    | Econst (Cbool b) -> upd_type ne Tbool
    | Econst (Cnone) -> upd_type ne Tnone

    | Eident id -> begin
      try
    	match Env.find id t_env with
    	  | TA_var ty -> upd_type ne ty
    	  | TA_fun _  -> error (Function_identifier id) ne.pos
          | TA_struct _ -> failwith "Not a struct"
          with Not_found  -> error (Unknown_identifier id)  ne.pos
    end

    | Eletopt (id, e1, e2) ->
        type_expr t_env f_env  e1;
        let t1 = 
            match e1.typ with
              | Toption t -> t
              | Tnone -> failwith("No value")
              | _ -> error (Not_an_option e1.typ) e1.pos
        in
        type_expr (Env.add id (TA_var t1) t_env) f_env e2;
        upd_type ne e2.typ

    | Eunop (op, e) ->
      type_expr t_env f_env  e;
      let ty = begin
      	match op with
      	| Unot   -> check_types e.pos Tbool e.typ; Tbool
      	| Uminus -> check_types e.pos Tint e.typ;  Tint
        | Uref   -> Tref e.typ
        | Usome  -> Toption e.typ
      	| _      -> not_implemented()
      end in
      upd_type ne ty

    | Ebinop (op, e1, e2) ->
      type_expr t_env f_env e1;
      type_expr t_env f_env e2;
      let ty =
      begin
	     match op with
    	  | Beq | Bneq ->
    	    check_types e2.pos e1.typ e2.typ;
    	    Tbool
    	  | Blt | Ble | Bgt | Bge ->
    	    check_types e1.pos Tint   e1.typ;
    	    check_types e2.pos Tint   e2.typ;
    	    Tbool
    	  | Badd | Bsub | Bmul | Bdiv ->
    	    check_types e1.pos Tint   e1.typ;
    	    check_types e2.pos Tint   e2.typ;
    	    Tint
    	  | Band | Bor ->
    	    check_types e1.pos Tbool  e1.typ;
    	    check_types e2.pos Tbool  e2.typ;
    	    Tbool
      end in
      upd_type ne ty

    | Eif (e1, e2, e3) ->
      type_expr t_env f_env e1;
      type_expr t_env f_env e2;
      type_expr t_env f_env e3;
      let ty =
    	check_types e1.pos Tbool  e1.typ;
    	check_types e2.pos e2.typ e3.typ;
    	e2.typ
      in
      upd_type ne ty

    | Eletin (id, e1, e2) ->
      type_expr t_env f_env e1;
      type_expr (Env.add id (TA_var e1.typ) t_env) f_env e2;
      upd_type ne e2.typ

    | Esetref (e1, e2) ->
    begin
      type_expr t_env f_env e1;
      type_expr t_env f_env e2;
      match e1.typ with
        | Tref ty -> check_types e1.pos ty e2.typ; upd_type ne Tunit
        | ty -> type_error e1.pos (Tref ty) ty
    end

    | Egetref (e) ->
        type_expr t_env f_env e;
        begin
          match e.typ with
          | Tref ty -> upd_type ne ty
          | ty -> type_error e.pos (Tref ty) ty
        end

    | Eapp (id, args) ->
     begin
        let ty = try Env.find id t_env
    	with Not_found -> error (Unknown_identifier id) ne.pos
          in
          match ty with
        	| TA_fun (ty, ty_args) ->
        	  List.iter2 (fun a ty_a ->
        	    type_expr t_env f_env a;
        	    check_types a.pos ty_a a.typ
        	  ) args ty_args;
        	  upd_type ne ty
    	    | _ -> error (Not_a_function id) ne.pos
     end

    | Estruct params ->
        let ftlist = List.map(fun (f, exp) -> type_expr t_env f_env exp ; (f, exp.typ)) params
        in
        begin
            try List.iter(fun (tlist, key) ->
                try let find = 
                    List.for_all2(fun (tid, tf, _) (fid, ff) ->
                        try
                            check_types ne.pos tf ff ;
                            true
                        with Error _ -> false && String.compare tid fid == 0) tlist ftlist
                        in
                            if find then raise (FoundIt key) else ()
                            with Invalid_argument _ -> ()
                ) f_env ;
                error Type_not_found ne.pos
            with FoundIt k -> upd_type ne (Tident k)
        end

    | Eget (e, id) ->
    type_expr t_env f_env e ;
    begin
        match e.typ with
            | Tident t ->
            begin
                try let params = Env.find t t_env in
                begin
                    match params with
                        | TA_struct f ->
                            let _, texp, _ = List.find (fun (fid, _, _) -> String.compare fid id == 0) f in
                            upd_type ne texp
                        | _ -> error (Not_a_struct_type e.typ) e.pos
                end
                with Not_found -> error (Unknown_identifier id) ne.pos
            end
            | _ -> error (Not_a_struct_type e.typ) e.pos
    end

    | Eset (e, id, s) ->
    type_expr t_env f_env e ;
    begin
        match e.typ with
        | Tident t ->
            begin
                try let params = Env.find t t_env in
                    begin
                        match params with
                        | TA_struct f ->
                            let fid, texp, mut = List.find (fun (fid, _, _) -> String.compare fid id == 0) f in
                            begin
                                match mut with
                                | true ->
                                    type_expr t_env f_env s ;
                                    check_types s.pos texp s.typ ;
                                    upd_type ne Tunit
                                | false ->
                                    error (Not_mutable fid) e.pos
                            end
                        | _ -> error (Not_a_struct_type e.typ) e.pos
                    end
                with Not_found -> error (Unknown_identifier id) ne.pos
            end
        | _ -> error (Not_a_struct_type e.typ) e.pos
    end

    | Eprint_int e ->
      type_expr t_env f_env e;
      check_types e.pos Tint e.typ;
      upd_type ne Tunit

    | Eprint_newline e ->
      (* Calcule le type de l'expression [e], et met à jour le
	 nœud représentant [e]. *)
      type_expr t_env f_env e;
      (* Vérifie que le type trouvé pour [e] est bien le type
	 attendu [Tunit]. *)
      check_types e.pos Tunit e.typ;
      (* Met à jour le type de l'expression complète. *)
      upd_type ne Tunit

    | _ -> not_implemented()


let type_prog p =
  (* On utilise une fonction auxiliaire, qui type une instruction et
     renvoie l'environnement de typage éventuellement mis à jour. *)
  let rec type_instr_list t_env f_env instr_list =
    match instr_list with
    | [] -> t_env

    | Icompute e :: il ->
    	type_expr t_env f_env e;
    	check_types e.pos Tunit e.typ;
    	type_instr_list t_env f_env il

    | Ilet (id, ty, e) :: il ->
    	type_expr t_env f_env e;
    	check_types e.pos ty e.typ;
    	type_instr_list (Env.add id (TA_var e.typ) t_env) f_env il

    | Ifun (rec_flag, id, args, ty, e) :: il ->
        	let fun_env = List.fold_left
        	  (fun fenv (a, ty_a) -> Env.add a (TA_var ty_a) fenv)
        	  t_env args
        	in
        	let fun_env =
        	  if rec_flag
        	       then Env.add id (TA_fun (ty, List.map snd args)) fun_env
        	  else fun_env
        	in
        	type_expr fun_env f_env e;
        	check_types e.pos ty e.typ;
        	type_instr_list
        	  (Env.add id (TA_fun (ty, List.map snd args)) t_env)
        	  f_env il

    | Istruct (id, params) :: il ->
        let nParams = List.map(fun (id, mut) ->
            match mut with
            | Fimmutable t -> (id, t, false)
            | Fmutable t -> (id, t, true)
                               
                               ) params
        in
        let isValid = List.for_all(fun (tlist, _) ->
            try List.exists2
                (fun (tid, tt, _) (fid, ft, _) -> String.compare tid fid != 0 || (tt != ft)) tlist nParams
            with Invalid_argument _ -> true
                                  )f_env
        in
        if isValid then
            let nf_env = (nParams, id) :: f_env in
            let newEnv = Env.add id (TA_struct nParams) t_env in
            type_instr_list newEnv nf_env il
        else
            failwith "This type already exists"

      | _ -> not_implemented()

  in
  type_instr_list base_env [] p
(* Remarque : cette fonction renvoie l'environnement de typage final.
   Ça peut servir dans l'extension "optimisation : valeurs inutiles". *)
