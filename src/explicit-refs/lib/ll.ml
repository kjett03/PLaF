(* Mutable Fields in Records 
   An example - Linked Lists
   22 March 2023
*)


type 'a node = { mutable data: 'a;
                 mutable next: 'a node option}

type 'a ll = { mutable head:'a node option;
               mutable size:int}

let ex1: int ll = { head = None;
                    size = 0}

let ex2: int ll =
  { head = Some { data=1; next=None};
    size = 1 }

let add_first : 'a ll -> 'a -> unit =
  fun ll e ->
  ll.head <- Some {data=e; next= ll.head};
  ll.size <- ll.size+1

let map : ('a -> 'b) -> 'a ll -> unit =
  fun f l ->
  let rec helper =
    fun no ->
    match no with
    | None -> ()
    | Some n ->
      n.data <- f n.data;
      helper n.next
  in helper l.head
    
let rec nth : 'a ll -> int -> 'a =
  fun ll n ->
  failwith "implement"

let rec last : 'a ll -> 'a =
  fun ll ->
  failwith "implement"


let rec append : 'a ll -> 'a ll -> unit =
  fun ll1 ll2 ->
  let rec helper no =
    match no with
    | None -> () (* never reached *)
    | Some n ->
      if n.next=None
      then n.next <- ll2.head
      else helper n.next
  in
  begin
    if ll1.size=0
    then ll1.head <- ll2.head
    else helper ll1.head;
  ll1.size <- ll1.size+ll2.size
end

let rec string_of_ll : 'a ll -> ('a -> string) -> string =
  fun ll to_string ->
  failwith "implement"

let rec remove_idx : 'a ll -> int -> unit =
  fun ll idx ->
  failwith "implement"
    
