# Tinytex

[https://yihui.org/tinytex/](https://yihui.org/tinytex/)

the default location is `~/.TinyTeX/`, which must be on `$PATH` in order to be executable.
The scripts already works very well, but it can be useful to tweak it a bit.
For example, it creates many symlinks in the `/home/usr/bin` folder, which can be annoying.
If you don't have any symlinks there `find -type l -delete` helps

# Manual installation (quite rare, in general `tlmgr` handles all packages)

- place files in the `~/.TinyTeX/` folder (e.g. `~/.TinyTeX/texmf-dist/tex/latex/beamer` for custom themes) and update db via `texhash`

- works also with symlinks, and (in this case) it can be even more convenient.

```
cd ~/.TinyTeX/texmf-dist/tex/latex/beamer
ln -s /fancytheme/ .
texhash
```
