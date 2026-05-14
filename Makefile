main.pdf: main.dvi
	dvipdfmx -p a4 -f font.map main.dvi
	touch main.pdf

main.dvi: *.tex
	sed -i 's/、/, /g' main.tex
	sed -i 's/。/. /g' main.tex
	platex main.tex
	pbibtex main.aux
	platex main.tex
	platex main.tex

clean:
	rm -f *.aux *.log *.dvi *.bbl *.blg *.pdf *.ilg *.idx *.toc *.ind *.out
