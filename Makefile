decks = site/introduction.html \
        site/shell-genomics.html \
        site/introduction-to-conda-for-data-scientists.html \
        site/bioinformatics-supplementary.html

slides: $(decks)

clean:
	rm --force site/*.html

site/%.html: src/%.md
	pandoc \
	  --to revealjs \
	  --standalone \
	  --self-contained \
	  --css slides.css \
	  --from markdown+link_attributes+tex_math_dollars+simple_tables \
	  --resource-path src/ \
	  --output $@ \
	  --variable revealjs-url:reveal.js \
	  --table-of-contents \
	  --toc-depth 1 \
	  --variable toc-title:Outline \
	  --slide-level 2 \
	  --strip-comments \
	  --mathml \
	  $<
