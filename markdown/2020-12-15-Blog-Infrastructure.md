---
title: "New Blog Infrastructure"
date: 2020-12-15
categories:
 - blogging
 - pandoc
 - panfeed
abstract: "This post introduces Metatheorem's new blog infrastructure using Pandoc, GNU Make, and a new tool called Panfeed."
---

I haven't been blogging much over the last few years.  This is in part
due to just being really busy and then part due to the infrastructure my
blog was based on.  The latter was a big impediment because it made
writing difficult by getting in the way of just writing.  In addition,
the infrastructure I chose didn't handle advanced mathematics well
enough for what I currently want to write about.  So I decided to
replace it with a more easily manageable and more mathematically
expressive infrastructure.  In this post I'm going to introduce this
simple system so that if there is anyone else who wants a simple blog
they can use it as well.

### The Old

Let me explain the problems I was running into with my old system.  It
was a [Jekyll](https://jekyllrb.com/) based blog which used
[Mathjax](https://www.mathjax.org/) and the [jekyll-feed
plugin](https://github.com/jekyll/jekyll-feed) and it was hosted (and
still is) as a [Github Page](https://pages.github.com/).  This system
was quite nice to work with.  I had collections enabled which allowed
me to separate posts from pages and even drafts.  I loved the command:

```
 bundle exec jekyll serve --drafts --watch
```

to locally serve my site and test it out before publishing it.
However, there a few things that made using Jekyll a bit annoying and
one thing that made it very hard to keep using it:

1. Jekyll is based on a number of technologies like
   [Ruby](https://www.ruby-lang.org/en/) (Jekyll is developed in it
   and the templates are based on it),
   [Markdown](https://jekyllrb.com/docs/configuration/markdown/), and
   [Liquid](https://github.com/Shopify/liquid).  I found for my simple
   needs these were just too much to keep up with. Updates required
   messing with the Ruby package manager called
   [RubyGems](https://rubygems.org/) which was often nightmarish.
   Then factor in Mathjax and RSS feeds and this is getting out of
   hand.  I felt like I was having to tweak these things too often for
   my liking.  So reducing the number of technologies is important for
   me.  I want simplicity and minimalism, because it is easier to
   maintain over time.

2. Jekyll doesn't play nice with Mathjax.  When you build a Jekyll
   site what happens is the static site is generated using the above
   technologies which means the markdown you write is going to go
   through several translations before the final HTML is output.
   These translations would break Mathjax code.

   Consider an example.  The Mathjax `$$\Gamma_{{\mathrm{1}}}$$` would
   end up getting translated into the code `<script
   type="math/tex">\Gamma_}</script>` instead of `<script
   type="math/tex">\Gamma_{{\mathrm{1}}}</script>`.  The problem is
   the nesting of curly braces, if you remove the nesting giving
   `$$\Gamma_{\mathrm{1}}$$` then it works fine.  Keep in mind
   that Mathjax has no problem rendering the original if it were
   translated properly by Jekyll.

   You might wonder why this is a big deal.  I mean, I could just
   remove the extra curly braces and we are good.  But, I use a tool
   called [Ott](https://github.com/heades/ott) that is used for
   generating parsers of formal languages like programming languages
   and logics.  I use it to write papers and blog posts to catch
   syntax errors in my writing.  Well for whatever reason Ott adds
   these nested parens all the time.  So this was annoying.

These problems were enough for me to rethink my blog infrastructure.

### The New

One tool I use a lot to generate various files for work and research
is [Pandoc](https://pandoc.org/), and Pandoc heavily supports Mathjax
and plays well with Ott.  So it would be very natural to engineer my
blog to use Pandoc, and that's exactly what I did.

This blog is now purely Pandoc,
[http-server](https://github.com/http-party/http-server), [GNU
Make](https://www.gnu.org/software/make/), and a new tool I created
called [Panfeed](https://github.com/heades/panfeed).  That is it!  And
I managed to keep all of the things I liked about my Jekyll based
site!

Here is the listing of the structure of this blog:

- Templates/Markdown:
  - `Makefile`
  - `defaults`
  - `layouts`  
  - `markdown`  
- Generated Site:
  - `draft`  
  - `published`
  - `images`
  - `includes`
  - `feed.xml`
  - `index.html`

The sites static-files (the files in the Generated Site section above)
are the result of applying Pandoc to the files in the
template/markdown section.  The `defaults` and `layouts` directories
are the Pandoc configuration directories and they are linked.  The
former, tells Pandoc things like what kind of markdown to generate,
where to find the markdown files, which output format to use (for this
site this should be HTML), the type of highlighter to use, to enable
Mathjax, and to enable CSS (this blog uses Bootstrap).  In addition,
it sets the HTML template in `layouts` for the HTML document we are
generating.  There are two page templates: post and page.  The former
is the template for each blog post and the latter is used for pages
like the index page of this site.  For more information on how this
works checkout [Default
Files](https://pandoc.org/MANUAL.html#default-files) and
[Templates](https://pandoc.org/MANUAL.html#templates) in the Pandoc
User Manual.

The `markdown` directory contains all of the markdown for the entire
site. This includes the `index.md` file and all posts.  For example,
the file for this post `2020-12-15-Blog-Infrastructure.md` is also in
the `markdown` directory.  So all editing/drafting takes place in
`markdown`.

Everything else is generated.  In `markdown` there is a `Makefile`
that runs Pandoc on each markdown file that has been modified.  It
then places its generated HTML in the `draft` directory.  This
includes the `index.md` file.  It also adds all modified posts to a
new `feed.xml` file (more on this later).  Thus, the entire site is
generated as a `draft` first.  This makes it possible for me to share
drafts of posts with others before publishing them and to keep them in
my Git repo with little hassle.  In fact, you can visit
[https://blog.metatheorem.org/draft](https://blog.metatheorem.org/draft)
right now and see the draft version of this site.  Then using the
`Makfile` at the root of the site by issuing `make publish` the
generated files in `draft` are moved to their respective locations.
All posts are moved to `published`, and `index.html` and `feed.xml`
are both moved to the root of the site.

To locally view the generated site either the `draft` version or the
`published` version we can use the command `make serve` at the root to
run `http-server`.  The commands `make draft`, `make published`, and
`make clean` are also available. The latter removes all published
HTML.

Pandoc is an amazing tool for converting to and from Markdown.
However, it is not a tool for blog management.  Thus, the one issue I
had was how do I manage my RSS feed (`feed.xml`).  Entire Panfeed.

### Panfeed

One of the cool plugins I used with Jekyll was jekyll-feed.  This
automatically managed my RSS feed by extracting the necessary details
from the markdown files and adding a new entry to my RSS feed.
Moving to pure Pandoc meant I no longer had this feature.  After
looking around a bunch I noticed there wasn't a solution to this
problem.  So I solved it myself.

I have developed a simple tool called
[Panfeed](https://github.com/heades/panfeed) which manages an RSS feed
using Pandoc.  The name is a combination of "Pandoc" and "Feed" the
latter being the [Haskell]() library for managing RSS+Atom feeds.

Panfeed supports creating a new RSS feed and then adding new entries
to an existing RSS feed based on Pandoc's markdown with YAML blocks.
The markdown files look like the following:

```
---
title: "The most amazingest post"
date: 2020-12-04
abstract: "About my amazingest advertures through the ether."
---

content
```

Then Using the following Panfeed command:

```
panfeed --add=2020-12-04-Amazingest-Adventures.md --post-path=posts bestestFeed.rss
```

we can add a new entry to `bestestFeed.rss` with the title and date
specified, but the entries content will be set to the abstract. The
option `--post-path` adds the releative path to where
`2020-12-04-Amazingest-Adventures.html` is located on your site.
Panfeed first grabs the URL to your website from `bestestFeed.rss` and
records the new entry as located on your site at
`http://bestest.com/posts/2020-12-04-Amazingest-Adventures.html`.

Thus, using Panfeed we can easily manage our Pandoc-base site from the
command line.  In fact, this is done completely automatically within
the `Makfile` in the `markdown` directory.

In addition, Panfeed is completely open source and easy to install.
For more details on Panfeed checkout the
[README](https://github.com/heades/panfeed/blob/main/README.md).

### Conclusion

Moving to Pandoc required a bit of work, but now that it's done my
blog is very basic and easy to manage.  Everything is literally a
markdown file.  Combing Pandoc, GNU Make, and Panfeed made it possible
to make the infrastructure as simple as possible.  And it's as
expressive as possible. In fact, check it out, the math
$\Gamma_{{\mathrm{1}}}$ looks as it should.

If you are interested in using this blog setup you can simply clone
this [repo](). Then install Pandoc, GNU Make, and Panfeed.  Then you
can get blogging.