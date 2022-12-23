source := ./
output := ../draft

defaults := ../defaults
page-defaults := $(defaults)/page
post-defaults := $(defaults)/post

layouts := ../layouts
page-layout := $(layouts)/page
post-layout := $(layouts)/post

post_dir := published

rss_feed := feed.xml

lua_filter_dir := ../lua-filters
lua_filters := --lua-filter=$(lua_filter_dir)/grey-background-html.lua

sources := $(filter-out $(source)/index.md, $(wildcard $(source)/*.md))
objects := $(patsubst %.md,%.html,$(subst $(source),$(output),$(sources)))

all : $(objects) $(output)/index.html

publish : all
	cd .. && make publish

$(output)/%.html : %.md $(post-defaults).yaml $(post-layout).html 
	pandoc ${lua_filters} -s -f markdown -t html --toc -d $(post-defaults) -o $@ $<
	panfeed --add=$< --post-path=$(post_dir) --feed-dest=$(output)/$(rss_feed) ../$(rss_feed)

$(output)/index.html : index.md $(page-defaults).yaml $(page-layout).html 
	pandoc -s -d $(page-defaults) -o $@ $<

watch :
	cd .. && make watch

serve : all
	cd .. && make serve
