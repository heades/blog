PDFLATEX = pdflatex
BIBTEX = bibtex
OTT = ott
OTT_FLAGS_WRAP := -tex_show_meta false -picky_multiple_parses false
OTT_FLAGS := -tex_wrap false -tex_show_meta false -picky_multiple_parses false

Name := note
TexFileName := $(Name)
OTTFileName := Spec
OTTPrefix := ott
OTTFile := $(OTTFileName).ott
OTTGen := $(OTTFileName)-inc.tex
OTTOutputFile := $(TexFileName)-output.tex

PDF := $(TexFileName).pdf

all: pdf

post: ../2020-10-09-Strict-Actions.md

$(OTTOutputFile) : $(OTTFile) $(TexFileName).tex
	@$(OTT) $(OTT_FLAGS) -i $(OTTFile) -o $(OTTGen) -tex_filter $(TexFileName).tex $(OTTOutputFile) -tex_name_prefix $(OTTPrefix)

../2020-10-09-Strict-Actions.md : 2020-10-09-Strict-Actions.md $(OTTFile)
	@$(OTT) $(OTT_FLAGS) -i $(OTTFile) -o $(OTTGen) -tex_filter 2020-10-09-Strict-Actions.md ../2020-10-09-Strict-Actions.md -tex_name_prefix $(OTTPrefix)
	cd .. && make

# Now this takes the full LaTex translation and compiles it using
# pdflatex.
pdf :  $(OTTOutputFile) $(OTTFile) Makefile
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)


clean :
	rm -f *.aux *.dvi *.ps *.log *-ott.tex *-output.tex *.bbl *.blg *.rel *.pdf *~ *.vtc *.out *.spl *-inc.tex *-spec.tex 
