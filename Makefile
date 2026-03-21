MAIN = main
BUILDDIR = .build
OUTDIR = output
OUT ?= $(MAIN)
DATE := $(shell date +%Y-%m-%d)

all: $(BUILDDIR) $(OUTDIR)
	@pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(MAIN)
	@pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(MAIN)
	@cp $(BUILDDIR)/$(MAIN).pdf $(OUTDIR)/$(OUT)_$(DATE).pdf

dated: all
	@ls -t $(OUTDIR)/$(MAIN)_*.pdf | head -1

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(OUTDIR):
	mkdir -p $(OUTDIR)

clean:
	rm -rf $(BUILDDIR)

cleanall: clean
	rm -rf $(OUTDIR)

format:
	latexindent -w -s main.tex resume.cls sections/*.tex
	rm -f *.bak* indent.log sections/*.bak* sections/indent.log

.PHONY: all clean cleanall format