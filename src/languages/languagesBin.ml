module TranslateProg = Gettext.Program (struct
  let textdomain = "unison"
  let codeset = Some "UTF-8"
  let dir = None
  let dependencies = Gettext.init
end)
(GettextCamomile.Map)
