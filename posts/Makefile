POSTS := ../_posts/2020-10-09-Strict-Actions.md \
	 # ../_posts/2020-10-06-Graded-Coalgebras-as-Types.md

../_posts/%.md : %.md
	./preproc.sh "$^"

all : $(POSTS)

clean :
	rm -f *~ $(POSTS)

