let () = print_endline "internationalization fallback"

module Gettext =
struct
  external s_ : string -> string = "%identity"
  external f_ : ('a -> 'b, 'c, 'd) format -> ('a -> 'b, 'c, 'd) format = "%identity"

  let sn_ : string -> string -> int -> string =
    fun s p n ->
      if n = 1 then s else p

  let fn_ : ('a -> 'b, 'c, 'd) format -> ('a -> 'b, 'c, 'd) format -> int -> ('a -> 'b, 'c, 'd) format =
    fun s p n ->
      if n = 1 then s else p
end
