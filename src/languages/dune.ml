let lib_on =
  try Sys.getenv "GETTEXT_ENABLED" = "1"
  with Not_found -> false

let () =
  if lib_on then
    print_endline {|
(library
 (name internationalization)
 (wrapped false)
; (enabled_if (= %{env:GETTEXT_ENABLED=0} "1")) ; requires dune 3.2
; (enabled_if (= %{profile} "GETTEXT_ENABLED")) ; requires dune 2.5
 (libraries gettext.base gettext-camomile)
 (modules lang_bin lang_lib)

(include_subdirs no)
)
|}
  else
  print_endline "";


