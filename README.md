# Resume (LaTeX)

Simple local resume builder with formatting helper.

## What this repo does

- Builds a PDF resume from `main.tex` and section files.
- `Makefile` has targets:
  - `make` → compile PDF to `build/main.pdf` and copy dated file into `output/`.
  - `make dated` → prints latest dated PDF in `output/`.
  - `make clean` → remove `build/`.
  - `make cleanall` → remove `build/` and `output/`.
  - `make format` → run `latexindent` on `.tex` files for formatting.

## Required environment

On Linux:

```bash
sudo pacman -Syu texlive-core texlive-fontsrecommended texlive-fonts-extra texlive-bin perl-yaml-tiny git
```

`make format` uses `latexindent`. If you get `Can't locate YAML/Tiny.pm`, install:

```bash
sudo pacman -S perl-yaml-tiny perl-file-homedir
```

## Build

```bash
make
# output: build/main.pdf, output/main_YYYY-MM-DD.pdf
```

## Format

```bash
make format
```

If you get `Can't locate YAML/Tiny.pm`, install `YAML::Tiny` (package `libyaml-tiny-perl` or `perl-yaml-tiny`).
