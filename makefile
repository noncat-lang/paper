.PHONY:clean tidy
all:
	make paper.pdf

paper.pdf: paper.bib paper.tex
	pdflatex -synctex=1 paper.tex
	bibtex paper
	pdflatex -synctex=1 paper.tex
	pdflatex -synctex=1 paper.tex

clean:
	make tidy
	rm -f paper.pdf

tidy:
	find . -name "*.aux" | xargs rm -f
	rm -f paper.bbl paper.log paper.out paper.toc paper.blg paper.synctex.gz

spell:
	@for i in $$(find . -type f -name "*.tex" | sed 's/\.tex//' ); do \
		aspell -S -t --encoding=utf-8 --lang=en-US --extra-dicts=./dict.pws -p ./dict.pws -c $$i.tex ; \
		done   
