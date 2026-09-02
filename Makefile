MAIN = main
BUILDDIR = .build
OUTDIR = output
PUBLICDIR = public
OUT ?= $(MAIN)
DATE := $(shell date +%Y-%m-%d)

all: $(BUILDDIR) $(OUTDIR) $(PUBLICDIR)
	@pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(MAIN)
	@pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(MAIN)
	@cp $(BUILDDIR)/$(MAIN).pdf $(OUTDIR)/$(OUT)_$(DATE).pdf
	@cp $(BUILDDIR)/$(MAIN).pdf $(PUBLICDIR)/resume.pdf
	@echo '<meta http-equiv="refresh" content="0; url=resume.pdf">' > $(PUBLICDIR)/index.html

dated: all
	@ls -t $(OUTDIR)/$(MAIN)_*.pdf | head -1

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(OUTDIR):
	mkdir -p $(OUTDIR)

$(PUBLICDIR):
	mkdir -p $(PUBLICDIR)

clean:
	rm -rf $(BUILDDIR)

cleanall: clean
	rm -rf $(OUTDIR) $(PUBLICDIR)

format:
	latexindent -w -s main.tex resume.cls sections/*.tex
	rm -f *.bak* indent.log sections/*.bak* sections/indent.log

.PHONY: all clean cleanall format dated