all :
	cd posts-md && make
	pandoc -s --data-dir=. -d site
