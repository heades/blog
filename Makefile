POSTS := _posts/2020-10-06-Graded-Coalgebras-as-Types.md

all :
	cd posts && make
	serve

serve :
	bundle exec jekyll serve --watch
