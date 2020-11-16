source := ./
output := ../posts
sources := $(wildcard $(source)/*.md)
objects := $(patsubst %.md,%.html,$(subst $(source),$(output),$(sources)))

all : $(objects)

$(output)/%.html : %.md post.yaml ../layouts/post.html
	pandoc -s -d post -o $@ $<
