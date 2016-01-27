LEC=\
	2016-01-27-notes.pdf

.PHONY: all copy
all: $(LEC)

clean:
	rm -f *.aux *.log *.out

distclean: clean
	rm -f *.pdf

copy:
	mkdir -p ../web/lec
	cp $(LEC) ../web/lec

%.pdf: %.tex
	pdflatex $<
	pdflatex $<
