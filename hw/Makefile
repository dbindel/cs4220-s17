PDFS= \
	final.pdf \
	hw6.pdf \
	hw5.pdf \
	proj3.pdf \
	hw4.pdf \
	proj2.pdf \
	mt.pdf \
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

P2CODE= \
	proj2code/Contents.m		proj2code/p2lcurve_plot.m \
	proj2code/blurry.png		proj2code/p2resid.m \
	proj2code/make_blur.m		proj2code/p2setup.m \
	proj2code/p2applyH.m		proj2code/p2tikhonov.m \
	proj2code/p2lcurve.m		proj2code/p2tikhonovd.m \
	proj2code/K.mat

.PHONY: all clean distclean copy
all: $(PDFS) proj1.tgz proj1.zip

proj1.tgz: $(P1CODE)
	tar -czf $@ $(P1CODE)

proj1.zip: $(P1CODE)
	zip -r $@ $(P1CODE)

proj2.tgz: $(P2CODE)
	tar -czf $@ $(P2CODE)

proj2.zip: $(P2CODE)
	zip -r $@ $(P2CODE)

clean:
	rm -f hw*.aux hw*.log hw*.out
	rm -f proj*.aux proj*.log proj*.out

distclean: clean
	rm -f hw*.pdf proj*.pdf

copy: $(PDFS) proj1.tgz proj1.zip proj2.tgz proj2.zip bezier_plot.m bezier_intersect.m final_codes.m
	mkdir -p ../web/hw
	cp $(PDFS) ../web/hw
	cp proj1.tgz ../web/hw
	cp proj1.zip ../web/hw
	cp proj2.tgz ../web/hw
	cp proj2.zip ../web/hw
	cp bezier_*.m ../web/hw
	cp final_codes.m ../web/hw

%.pdf: %.tex common.tex
	pdflatex $<
	pdflatex $<
