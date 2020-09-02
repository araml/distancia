LATEX_FLAGS = -output-directory=build

all: soluciones.pdf apunte_tipado.pdf

%.pdf:
	mkdir -p build
	latexmk -pdf -jobname=build/soluciones soluciones.tex
	latexmk -pdf -jobname=build/apunte_tipado apunte_tipado.tex

clean:
	rm -f build

