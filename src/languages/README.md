# Quick How-to

1. extracted with `xgettext` strings are put to `messages.pot` template, or it is created manually
   In theory running `cd src && xgettext -o languages/unison.pot --from-code=UTF-8 --keyword=_ --keyword=gettext *.ml` should do the trick, but it doesn't ;)
2. just once, language file is created by `msginit --input=messages.pot --locale=pl_PL --output=locales/pl/LC_MESSAGES/messages.po` for each language
3. translation is compiled to mo file `msgfmt locales/pl/LC_MESSAGES/messages.po`
4. to update translation when `messages.pot` change run `msgmerge --update locales/pl/LC_MESSAGES/messages.po messages.pot` and repeat step 3

How to test? After building, ensure that `/usr/share/locale/pl/LC_MESSAGES` or `/usr/local/share/locale/pl_PL/LC_MESSAGES` contains unison.mo file.
If not - you may need to copy it there manually. I guess this might be a step in build, though i wonder if one can choose not to do it, and run from build dir like currently.
There are multiple other search paths where file could be, and where it is expected to be found, one can observe this with `strace ./unison`
If the file is there, `LANGUAGE=pl ./unison` or `LANGUAGE=pl ./unison -help`  should result in running unison using translations.
Lo and behold, it has ONE string translated, this is PoC after all (look at `-version` description)
If translation is not found for given string ID - default English text, or a translation ID (typically being English text) is used, it (the key) should be a short one though...

# TODO

[ ] figure out, if the project even wants translations at all - as on mailing list, project does not use issues in a typical way
[ ] if yes - discuss approach, is ocaml-gettext desired external dependency, being 0.5.0, or other apporaches are preferred
[ ] alternatively one could have a huge mapping and select message based on some variable, but i guess gettext is more standard approach
[ ] figure out what is the deal with generated `strings.ml`. While code contains normal strings, which could be extracted
    this seems to be generated, soo translate in generator or wut.
[ ] verify if the approach could work in other architectures/platforms, which project supports. Maybe gettext is not present there
[ ] if approach is somewhat acceptable, improve `initial_extractor.py` as for now it captures over 1 MiB strings...
    (the process is way smoother with xgettext but first the translation keywords have to be present in the code...)
[ ] refactor Makefile + readme for preparing translations - naming and UX is poor. Actually either use ocaml patched extraactor or not and use base tools
[ ] figure out the overhead translation creates, and is there a desire to have a switch disabling this totally, to reduce bin size, or for other reasons
[ ] actually do the extraction and translation...

[ ] **IF make is re run without OPAM env initialized it might complain about compilers mismatch** user should be aware.
    Even worse, if it is 1st build - it will build until failing to find opam package, should gracefully fail if no opam + opam/gettext is present.


It might be totally possible, that above gettext is too C-like, and ocaml-gettext is doing stuff differently,
Makefile on its GH page suggest that is the case - and it seems to be preferred, due to ocaml support added (as a patch) to normal gettext.

Eventually also one has to install compiled `*.mo` files somewhere, system-wide?
Systrace shows it searches for files `~/.opam/default/lib/gettext/share/locale/pl/LC_MESSAGES/` or `/usr/share/locale/pl/LC_MESSAGES`, but it can surely vary between OSes and such.
