PDFLATEX = xelatex
BIBTEX = bibtex
OTT = ott
OTT_FLAGS_WRAP := -tex_show_meta false -picky_multiple_parses false
OTT_FLAGS := -tex_wrap false -tex_show_meta false -picky_multiple_parses false

OTT_SPEC_NAME := syntax
OTT_SPEC := ${OTT_SPEC_NAME}.ott
OTT_SPEC_INC := ${OTT_SPEC_NAME}-ott.tex
OTT_GEN_INC_POSTFIX := ottput

POST_NAME := Universal_Properties
post_date := "`date "+%Y-%m-%d"`"
lua_filters := --lua-filter=../../../lua-filters/latex-disp-img.lua \
	       --lua-filter=../../../lua-filters/definition.lua

OTT_FILES = ${POST_NAME}.tex	    

CORE_FILE = ${OTT_FILES}

draft_dir := ../../../draft
post_dir := published
site_dir := ../../..
rss_feed := feed.xml

all: ${POST_NAME}.pdf	

post: ${draft_dir}/${POST_NAME}.html

FILES := ${CORE_FILES} \
	 ${POST_NAME}.tex \

OTT_TARGETS := $(subst .tex,-${OTT_GEN_INC_POSTFIX}.tex,$(OTT_FILES))
OTT_FILTER := $(subst .tex,.tex ,$(addprefix -tex_filter ,$(join $(OTT_FILES), $(OTT_TARGETS))))

$(OTT_SPEC_INC) : $(OTT_SPEC)
	$(OTT) -i $(OTT_SPEC) -o $(OTT_SPEC_INC) $(OTT_FLAGS)

${POST_NAME}.pdf : ${POST_NAME}.md ${OTT_SPEC_INC} Makefile
#       First process the markdown with Ott:
	ott -i ${OTT_SPEC} ${OTT_FLAGS} -tex_filter ${POST_NAME}.md ${POST_NAME}-${OTT_GEN_INC_POSTFIX}.md
	pandoc --lua-filter=../../../lua-filters/latex-disp-img.lua --lua-filter=../../../lua-filters/definition.lua -s --citeproc -f markdown -t pdf --template=layout/${POST_NAME} ${POST_NAME}-${OTT_GEN_INC_POSTFIX}.md -o ${POST_NAME}.pdf

# Produce the blog post:
${draft_dir}/${POST_NAME}.html : Makefile ${POST_NAME}.md ${OTT_SPEC_INC}
#       First process the markdown with Ott:
	ott -i ${OTT_SPEC} ${OTT_FLAGS} -tex_filter ${POST_NAME}.md ${POST_NAME}-${OTT_GEN_INC_POSTFIX}.md
#       Now convert the Ott-filtered markdown to html:
	pandoc ${lua_filters} -s --citeproc --toc -d ../../../defaults/post --metadata date=${post_date} -o ${draft_dir}/${POST_NAME}.html ${POST_NAME}-${OTT_GEN_INC_POSTFIX}.md
#       Add the post to the RSS feed.
	panfeed --add=${POST_NAME}.md --post-path=${post_dir} --feed-dest=${draft_dir}/${rss_feed} ${site_dir}/${rss_feed}

watch :
	find . | entr -p -c 'make'

watch-post :
	find . | entr -p -c './watchpost.sh'

open-pdf : ${POST_NAME}.pdf
	open -a Skim ${POST_NAME}.pdf

clean :
	rm -f *.aux *.dvi *.ps *.log *-ott.tex *-output.tex *-output.md *.bbl *.blg \
	      *.rel ${POST_NAME}.pdf *~ *.vtc *.out *.spl *-inc.tex  *-ott.tex *-ottput.tex *-ottput.md \
	      *.lof *.toc *.tdo ${POST_NAME}.tex ${draft_dir}/${POST_NAME}.html ${POST_NAME}.html
version:
	which pandoc
	pandoc --version
