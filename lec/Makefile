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
	2016-02-24-notes.pdf \
	2016-02-26-notes.pdf \
	2016-02-29-notes.pdf \
	2016-03-02-notes.pdf \
	2016-03-07-notes.pdf \
	2016-03-09-notes.pdf \
	2016-03-11-notes.pdf \
	2016-03-14-notes.pdf \
	2016-03-16-notes.pdf \
	2016-03-18-notes.pdf \
	2016-03-21-notes.pdf \
	2016-04-04-notes.pdf \
	2016-04-06-notes.pdf \
	2016-04-08-notes.pdf \
	2016-04-13-notes.pdf \
	2016-04-15-notes.pdf

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
