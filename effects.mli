type ('v, 'e) t

val return_unit: (unit, _) t
val return: 'v -> ('v, 'e) t
val effect: 'v -> 'e -> ('v, 'e) t
val only: ('e -> unit) -> ('v, 'e) t -> ('v, 'e) t (* FIXME too hacky? *)
val run: ('v, 'e) t -> 'v

module Infix : sig
  val ( >>= ) : ('a, 'e) t -> ('a -> ('b, 'e) t) -> ('b, 'e) t
  val ( =<< ) : ('a -> ('b, 'e) t) -> ('a, 'e) t -> ('b, 'e) t
  val ( >|= ) : ('a, 'e) t -> ('a -> 'b) -> ('b, 'e) t
  val ( =|< ) : ('a -> 'b) -> ('a, 'e) t -> ('b, 'e) t
  val ( <?> ) : ('v, 'e) t -> ('v, 'e) t -> ('v, 'e) t
  val ( <&> ) : (unit, 'e) t -> (unit, 'e) t -> (unit, 'e) t
end

val map_p: ('a -> ('b, 'e) t) -> 'a list -> ('b list, 'e) t
val map_s: ('a -> ('b, 'e) t) -> 'a list -> ('b list, 'e) t
val iter_p: ('a -> (unit, 'e) t) -> 'a list -> (unit, 'e) t
val iter_s: ('a -> (unit, 'e) t) -> 'a list -> (unit, 'e) t
