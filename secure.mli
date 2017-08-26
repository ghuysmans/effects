(* this accesses a database *)
val write: int -> (unit, [> `Write]) Effects.t
val read: unit -> (int, [> `Read | `Else]) Effects.t
