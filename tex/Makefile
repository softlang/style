.PHONY: all

all: ausarbeitung.pdf

ausarbeitung.pdf: ausarbeitung.tex 
	pdflatex -src -interaction=nonstopmode ausarbeitung.tex
	-biber ausarbeitung.bcf
	-pdflatex -src -interaction=nonstopmode ausarbeitung.tex
	-pdflatex -src -interaction=nonstopmode ausarbeitung.tex

clean:
	rm -f *.pdf
	make purge

purge:
	rm -f *.aux *.bbl *.bcf *.blg *.lof *.log *.out *.toc *.run.xml
