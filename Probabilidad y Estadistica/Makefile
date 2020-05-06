LATEX_FLAGS = -output-directory=build

all: ej1.pdf

%.pdf:
	latexmk -pdf -jobname=build/ej1 ej1.tex

clean:
	rm -f build/*

