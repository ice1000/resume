#!/bin/bash
#
# Created by ice1000 at 2017/3/26
#

echo "=============================="
echo "======generating LaTeX ======="
echo "=============================="

runghc Resume.hs en >> latex/resume.tex
runghc Resume.hs cn >> latex/resume-cn.tex
runghc Resume.hs elab >> latex/resume-elab.tex

echo "=============================="
echo "=======building LaTeX ========"
echo "=============================="

make -C latex >> latex/make.log
mv latex/*.pdf .
make -C latex clean-tex

echo "=============================="
echo "====removing useless files===="
echo "=============================="

rm -rf .git
rm *~
rm latex/*.log
rm latex/*.aux
rm latex/*.out
rm latex/*.fls

echo "================================"
echo "==reinitialize git repository==="
echo "================================"

git init
git remote add origin https://ice1000:$GITHUB_TOKEN@github.com/ice1000/resume.git

echo "=============================="
echo "======committing changes======"
echo "=============================="

git add *
git add .gitignore
git commit -a -m "refresh everything" >> commit.log

echo "=============================="
echo "=====pushing, please wait====="
echo "=============================="

git push --force origin HEAD
git status

echo "=============================="
echo "========all tasks done========"
echo "=============================="

rm *.log
