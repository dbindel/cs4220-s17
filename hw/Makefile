PDFS= \
	hw1.pdf \
	hw2.pdf

.PHONY: all clean distclean copy
all: $(PDFS)

clean:
	rm -f hw*.aux hw*.log hw*.out
	rm -f proj*.aux proj*.log proj*.out

distclean: clean
	rm -f hw*.pdf proj*.pdf

copy: $(PDFS)
	mkdir -p ../web/hw
	cp $(PDFS) ../web/hw

%.pdf: %.tex
	pdflatex $<
	pdflatex $<
