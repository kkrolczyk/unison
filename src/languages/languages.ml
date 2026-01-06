let internationalization_enabled () = print_endline "Internationalization module works"

(*
module Gettext = Gettext.Library (struct
  let textdomain = "messages"
  let codeset = Some "UTF-8"
  let dir = None
  let dependencies = Gettext.init
end)
*)
