#
# created by ice1000 at 2017/3/26
#

# echo "building latex sources..."

# latex resume.tex
# latex resume-ap.tex
# latex resume-cn.tex

# echo "building dvi resume(English)..."

# dvipdf resume.dvi
# dvips resume.dvi
# dvilj6 resume.dvi
# # broken
# dvisvgm resume.dvi
# dvi2fax resume.dvi

# echo "building dvi resume(For application)..."

# dvipdf resume-ap.dvi
# dvips resume-ap.dvi
# dvilj6 resume-ap.dvi
# # broken
# dvisvgm resume-ap.dvi
# dvi2fax resume-ap.dvi

# echo "building dvi resume(Chinese)..."

# dvipdf resume-cn.dvi
# # broken
# dvips resume-cn.dvi
# dvilj6 resume-cn.dvi
# # broken
# dvisvgm resume-cn.dvi

echo "removing useless files..."

rm -rf .git
rm *~
rm *.log

echo "reinitialize git repository..."

git init
git remote add origin https://github.com/ice1000/resume.git

git status

echo "committing changes..."

git add *
git add .gitignore
git stage *
git commit -a -m "refresh"

echo "status..."

git status

echo "git gc..."

git gc

echo "pushing, please wait..."

git push --force origin HEAD
git status

# echo "deleting the local files(except pdf)..."
#
# rm *.dvi
# rm *.lj
# rm *.svg
# rm *.fax
# rm *.ps

echo "all tasks done."
