modules = introduction.html command-line-genomics.html

slides: $(modules)

clean:
	rm --force *.html

%.html: %.md #slides.css media/*
	pandoc \
	  --to revealjs \
	  --standalone \
	  --self-contained \
	  --css slides.css \
	  --from markdown+link_attributes+tex_math_dollars \
	  --output $*.html \
	  --variable revealjs-url:reveal.js \
	  --table-of-contents \
	  --toc-depth 1 \
	  --variable toc-title:Outline \
	  --slide-level 2 \
	  --strip-comments \
	  --mathml \
	  $<
