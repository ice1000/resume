%echo off
del *.pdf
cd latex
del resume.tex
del resume-cn.tex
del resume-elab.tex
cd ..
cabal run resume --verbose=0 -- en >> latex/resume.tex
cabal run resume --verbose=0 -- cn >> latex/resume-cn.tex
cabal run resume --verbose=0 -- elab >> latex/resume-elab.tex
cd latex
xelatex resume.tex
xelatex resume-cn.tex
xelatex resume-elab.tex
del resume.tex
del resume-cn.tex
del resume-elab.tex
move *.pdf ..
del *.log
del *.aux
del *.out
cd ..
cmd /c "rd /s /q .git"
git init --initial-branch=master
git remote add origin https://ice1000:%GITHUB_TOKEN%@github.com/ice1000/resume.git
git add *
git add .gitignore
git commit -a -m "refresh everything" >> commit.log
git push --force --set-upstream origin master
git status
