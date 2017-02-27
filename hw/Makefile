PDFS= \
	proj1.pdf \
	hw3.pdf \
	hw2.pdf \
	hw1.pdf

P1CODE= \
	proj1code/ginterp_load.m \
	proj1code/ginterp_addval.m \
	proj1code/ginterp_edit.m \
	proj1code/ginterp_factor.m \
	proj1code/ginterp_eval0.m \
	proj1code/ginterp_eval.m \
	proj1code/ginterp_deriv.m \
	proj1code/ginterp_bsys.m \
	proj1code/ginterp_check.m \
	proj1code/tester.m \
	proj1code/README.md \
	proj1code/roadNet-CA.txt

.PHONY: all clean distclean copy
all: $(PDFS) proj1.tgz proj1.zip

proj1.tgz: $(P1CODE)
	tar -czf $@ $(P1CODE)

proj1.zip: $(P1CODE)
	zip -r $@ $(P1CODE)

clean:
	rm -f hw*.aux hw*.log hw*.out
	rm -f proj*.aux proj*.log proj*.out

distclean: clean
	rm -f hw*.pdf proj*.pdf

copy: $(PDFS) proj1.tgz proj1.zip
	mkdir -p ../web/hw
	cp $(PDFS) ../web/hw
	cp proj1.tgz ../web/hw
	cp proj1.zip ../web/hw

%.pdf: %.tex common.tex
	pdflatex $<
	pdflatex $<
