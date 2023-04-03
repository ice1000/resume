all: clean en zh elab
en: resume.tex
	latexmk -xelatex resume.tex
zh: resume-cn.tex
	latexmk -xelatex resume-cn.tex
elab: resume-elab.tex
	latexmk -xelatex resume-elab.tex

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf *.cut *.fdb_latexmk *.xdv *.xml

clean-tex:
	$(RM) resume.tex resume-cn.tex resume-elab.tex
