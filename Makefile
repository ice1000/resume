SRC = $(wildcard *.tex)

PDFS = $(SRC:.tex=.pdf)

all: clean pdf
clean-en: clean xelatex resume.tex
clean-zh: clean xelatex resume-cn.tex
en: resume.pdf
	xelatex resume.tex
zh: resume-cn.pdf
	xelatex resume-cn.tex
pdf: clean $(PDFS)
%.pdf: %.tex
	xelatex $<

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf
