(* Title: Tezos Proxy Redirect *)
(* Author: Teckhua Chiang *)
(* Company: Cryptonomic Inc. *)

[%%version 1.04]

(** Storage of this smart contract. *)
type storage = {
  owner : address;
  destination : address;
  stamp : string;
}

(** Initialize the storage of this smart contract. *)
let%init storage = {
  owner = Current.sender ();
  destination = Current.sender ();
  stamp = "Author: Teckhua Chiang, Company: Cryptonomic Inc.";
} 
  
(** Entry point for the owner to set the destination address.
    @param destination An address corresponding to the desired destination.
    @param storage The storage of this smart contract. *)
let%entry setDestination
    (destination : address)
    (storage : storage) =
  if Current.sender () = storage.owner then
    let storage = storage.destination <- destination in
    ([], storage)
  else 
    failwith ("You do not own this Proxy Redirect")