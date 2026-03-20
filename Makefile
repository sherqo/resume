MAIN = main
BUILDDIR = build
OUTDIR = output
DATE := $(shell date +%Y-%m-%d)

all: $(BUILDDIR) $(OUTDIR)
	@pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(MAIN)
	@pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(MAIN)
	@cp $(BUILDDIR)/$(MAIN).pdf $(OUTDIR)/$(MAIN)_$(DATE).pdf

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

.PHONY: all clean cleanall