module TranslateLib = Gettext.Library (struct
  let textdomain = "unison-gtk"
  let codeset = Some "UTF-8"
  let dir = None
  let dependencies = Gettext.init
end)
include Gettext
