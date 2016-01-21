type head_elem = Title of string
		 | Style of string
type body_elem =
    A of string * body_elem list (* lien hypertexte (adresse, contenu) *)
  | B of body_elem list (* mise en gras *)
  | P of body_elem list (* paragraphe *)
  | Ul of body_elem list list (* liste non énumérée *)
  | Text of string (* du texte simple *)


type document = { head : head_elem list;
		  body : body_elem list }

let doc = {head = [Title "Ma page";
		   Style "a { text-decoration : underline; }" ] ;
	   body = [P [Text "Un paragraphe de texte (dont un texte";
		      B [Text "en gras"]];
		   Ul [
		     [Text "Premier point"];
		     [Text "Le";
		      A("http://www.google.com", [Text "Deuxieme Point"]);
		     Text "est un lien"]
		   ]
		  ];
	  }
;;


let has_title l = List.exists
  (fun x -> match x with
    | Title _ -> true
    | _ -> false
  )
  l
;;


let rec valid_head l =
    match l with
      | []   -> false
      | Title _ ::r -> not (valid_head r)
      | Style _ ::r -> valid_head r
;;

let test = valid_head doc.head
	  
let rec has_link e =
  match e with
    | A _ -> true
    | Text _ -> false
    | B contents | P contents ->
      List.exists has_link contents
    | Ul l ->
      List.exists (fun ll -> List.exists has_link ll) l 

let rec valid_link e =
  match e with
    | Text _ -> true
    | A (_, content) -> not (List.exists has_link content) (* On veut qu'un seul lien *)
    | B contents | P contents ->
      List.for_all valid_link contents
    | Ul l ->
      List.for_all (fun ll -> List.for_all valid_link ll) l

let rec boldify_first e =
  match e with
    | Text _ -> e
    | A (href, contents) -> A(href, List.map boldify_first contents)
    | P c -> P( List.map boldify_first c)
    | B c -> B (List.map boldify_first c)
    | Ul [] -> Ul []
    | Ul (e :: rest) ->
      Ul ([B (List.map boldify_first e)] ::  (*On rentre à l'intérieur de e *)
	     List.map (fun l -> List.map boldify_first l
      ) rest)

	
