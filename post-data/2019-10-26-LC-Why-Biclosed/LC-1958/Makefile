PDFLATEX = pdflatex
BIBTEX = bibtex
OTT = ott
OTT_FLAGS_WRAP := -tex_show_meta false -picky_multiple_parses false
OTT_FLAGS := -tex_wrap false -tex_show_meta false -picky_multiple_parses false
SKIM := skim_revert.sh
SKIMRevinPath := $(shell command -v $(SKIM) 2> /dev/null)

OTTFileName := LC
TexFileName := $(OTTFileName)
OTTFile := $(OTTFileName).ott
OTTGen := $(OTTFileName)-inc.tex
OTTOutputFile := $(TexFileName)-output.tex
PDF := $(TexFileName).pdf

all: pdf

pdf : $(PDF)

$(OTTOutputFile) : $(OTTFile)
	@$(OTT) $(OTT_FLAGS) -i $(OTTFile) -o $(OTTGen) -tex_filter $(OTTFileName).tex $(OTTOutputFile)

# Now this takes the full LaTex translation and compiles it using
# pdflatex.
$(PDF) :  $(OTTOutputFile) Makefile $(OTTFileName).tex
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)

clean :
	rm -f *.aux *.dvi *.ps *.log *-ott.tex *-output.tex *.bbl *.blg *.rel *.pdf *~ *.vtc *.out *.spl *-inc.tex 
