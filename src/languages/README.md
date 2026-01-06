# Quick How-to


1. extracted with `xgettext` strings are put to `messages.pot` template, or it is created manually
   In theory running `cd src && xgettext -o languages/messages.pot --from-code=UTF-8 --keyword=_ --keyword=gettext *.ml` should do the trick, but it doesn't ;)
2. just once, language file is created by `msginit --input=messages.pot --locale=pl_PL --output=locales/pl/LC_MESSAGES/messages.po` for each language
3. translation is compiled to mo file `msgfmt locales/pl/LC_MESSAGES/messages.po`
4. to update translation when `messages.pot` change run `msgmerge --update locales/pl/LC_MESSAGES/messages.po messages.pot` and repeat step 3


# TODO

[ ] figure out, if the project even wants translations at all - as on mailing list, project does not use issues in a typical way
[ ] if yes - discuss approach, is ocaml-gettext desired external dependency, being 0.5.0, or other apporaches are preferred
[ ] alternatively one could have a huge mapping and select message based on some variable, but i guess gettext is more standard approach
[ ] figure out what is the deal with generated `strings.ml`. While code contains normal strings, which could be extracted
    this seems to be generated.
[ ] verify if the approach could work in other architectures/platforms, which project supports. Maybe gettext is not present there
[ ] if approach is somewhat acceptable, improve `initial_extractor.py` as for now it captures over 1 MiB strings...
    (the process is way smoother with xgettext but first the translation keywords have to be present in the code...)
[ ] figure out the overhead translation creates, and is there a desire to have a switch disabling this totally, to reduce bin size, or for other reasons
