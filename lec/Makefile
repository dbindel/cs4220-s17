LEC=\
	2016-01-27-notes.pdf \
	2016-01-29-notes.pdf \
	2016-02-01-notes.pdf \
	2016-02-03-notes.pdf \
	2016-02-05-notes.pdf \
	2016-02-08-notes.pdf \
	2016-02-10-notes.pdf \
	2016-02-12-notes.pdf \
	2016-02-17-notes.pdf \
	2016-02-22-notes.pdf \
	2016-02-24-notes.pdf

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
