md_dir := markdown
md_sources := $(wildcard $(md_dir)/*.md)
draft_dir := draft
post_dir := published
post_sources := $(filter-out $(draft_dir)/CT-Notes.html, $(filter-out $(draft_dir)/index.html, $(wildcard $(draft_dir)/*.html)))
post_targets := $(subst $(draft_dir),$(post_dir),$(post_sources))

all : draft

draft : $(md_sources)
	cd $(md_dir) && make

publish : $(post_targets) index.html $(post_dir)/CT-Notes.html feed.xml

$(post_dir)/%.html : $(draft_dir)/%.html
	cp $< $@

index.html : $(draft_dir)/index.html
	sed -e 's/draft/published/g' $(draft_dir)/index.html > index.html

$(post_dir)/CT-Notes.html : $(draft_dir)/CT-Notes.html
	sed -e 's/draft/published/g' $(draft_dir)/CT-Notes.html > $(post_dir)/CT-Notes.html

feed.xml : $(draft_dir)/feed.xml
	cp $(draft_dir)/feed.xml feed.xml

serve : draft
	http-server

watch :
	find $(md_dir) | entr -c 'make'

clean : 
	rm -f $(post_dir)/* index.html
