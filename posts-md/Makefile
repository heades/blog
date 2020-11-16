source := ./
output := ../posts
sources := $(wildcard $(source)/*.md)
objects := $(patsubst %.md,%.html,$(subst $(source),$(output),$(sources)))

all : $(objects)

$(output)/%.html : %.md post.yaml
	pandoc -s -d post -o $@ $<
