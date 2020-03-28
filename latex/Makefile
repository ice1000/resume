all: clean en zh elab
en: resume.tex
	latexmk -xelatex -pdf resume.tex
zh: resume-cn.tex
	latexmk -xelatex -pdf resume-cn.tex
elab: resume-elab.tex
	latexmk -xelatex -pdf resume-elab.tex

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf *.cut

clean-tex:
	$(RM) resume.tex resume-cn.tex resume-elab.tex
