LEC=\
	2017-04-28.pdf \
	2017-04-26.pdf \
	2017-04-24.pdf \
	2017-04-21.pdf \
	2017-04-19.pdf \
	2017-04-17.pdf \
	2017-04-14.pdf \
	2017-04-12.pdf \
	2017-04-10.pdf \
	2017-03-31.pdf \
	2017-03-29.pdf \
	2017-03-24.pdf \
	2017-03-22.pdf \
	2017-03-20.pdf \
	2017-03-17.pdf \
	2017-03-13.pdf \
	2017-03-10.pdf \
	2017-03-08.pdf \
	2017-03-06.pdf \
	2017-02-27.pdf \
	2017-02-24.pdf \
	2017-02-22.pdf \
	2017-02-15.pdf \
	2017-02-13.pdf \
	2017-02-10.pdf \
	2017-02-08.pdf \
	2017-02-03.pdf \
	2017-02-01.pdf \
	2017-01-30.pdf \
	2017-01-27.pdf \
	2017-01-25.pdf

.PHONY: all copy
all: $(LEC)

2017-02-01.pdf: 2017-02-01.tex common.tex

2017-01-30.pdf: 2017-01-30.tex common.tex

2017-01-27.pdf: 2017-01-27.tex common.tex \
	basics/matrix-manip.tex

2017-01-25.pdf: 2017-01-25.tex common.tex refs.bib \
	basics/intro.tex basics/logistics.tex \
	basics/matrix-notation.tex \
	basics/matrix-interp.tex \
	basics/matrix-dense.tex \
	code/matmul_3loop.m \
	code/matmul_col.m \
	code/matmul_inner.m \
	code/matmul_outer.m \
	code/matmul_row.m \
	code/matvec1.m \
	code/matvec2_col.m \
	code/matvec2_row.m \
	code/matvec_time.m \
	code/mydot.m \
	figs/matvec_time.tex \
	data/matvec_time.dat

clean:
	rm -f *.aux *.log *.out

distclean: clean
	rm -f *.pdf

copy:
	mkdir -p ../web/lec
	cp $(LEC) ../web/lec

%.pdf: %.tex
	util/build.sh $<
