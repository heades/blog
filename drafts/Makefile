DRAFTS := ../_drafts/2020-10-09-Strict-Actions.md \
	 # ../_drafts/2020-10-06-Graded-Coalgebras-as-Types.md

POSTS := ../_posts/2020-10-09-Strict-Actions.md

../_drafts/%.md : %.md
	./preproc.sh "$^"

all : $(DRAFTS)

publish : $(POSTS)
	mv "../_drafts/$^" "../_posts/$^"

clean :
	rm -f *~

