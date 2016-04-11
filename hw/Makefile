PDFS= \
	hw1.pdf \
	hw2.pdf \
	proj1.pdf \
	hw3.pdf \
	practice-mt.pdf \
	mt.pdf \
	mt_eval.pdf \
	proj2.pdf \
	hw4.pdf \
	hw5.pdf

.PHONY: all clean distclean copy
all: $(PDFS)

clean:
	rm -f hw*.aux hw*.log hw*.out
	rm -f proj*.aux proj*.log proj*.out

distclean: clean
	rm -f hw*.pdf proj*.pdf

copy: $(PDFS)
	mkdir -p ../web/hw
	mkdir -p ../web/hw/proj1code
	mkdir -p ../web/hw/proj2code
	cp $(PDFS) ../web/hw
	cp proj1code/* ../web/hw/proj1code
	cp mt_codes.m ../web/hw
	cp proj2code/* ../web/hw/proj2code
	zip proj2code.zip proj2code/*
	cp proj2code.zip ../web/hw/proj2code

%.pdf: %.tex common.tex
	pdflatex $<
	pdflatex $<
