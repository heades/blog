source := ./
output := ../draft
post_dir := published
rss_feed := feed.xml
sources := $(wildcard $(source)/*.md)
objects := $(patsubst %.md,%.html,$(subst $(source),$(output),$(sources)))

all : $(objects)

$(output)/%.html : %.md post.yaml ../layouts/post.html
	pandoc -s -d post -o $@ $<
	panfeed --add=$< --post-path=$(post_dir) --feed-dest=$(output)/$(rss_feed) ../$(rss_feed)
