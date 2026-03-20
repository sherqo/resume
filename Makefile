MAIN = main
BUILDDIR = build
OUTDIR = output

all: $(BUILDDIR) $(OUTDIR)
	@pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(MAIN)
	@pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(MAIN)
	@cp $(BUILDDIR)/$(MAIN).pdf $(OUTDIR)/

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(OUTDIR):
	mkdir -p $(OUTDIR)

clean:
	rm -rf $(BUILDDIR)

cleanall: clean
	rm -rf $(OUTDIR)

.PHONY: all clean cleanall