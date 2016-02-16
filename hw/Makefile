PDFS= \
	hw1.pdf \
	hw2.pdf \
	proj1.pdf

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
	cp $(PDFS) ../web/hw
	cp proj1code/* ../web/hw/proj1code

%.pdf: %.tex
	pdflatex $<
	pdflatex $<
