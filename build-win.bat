@echo off
del *.pdf

set files=resume-zh,resume,resume-elab
echo Building...

for %%f in (%files%) do (
  (
    echo #import "main.typ": *;
    echo #show: chicv
  ) > %%f.typ
)

echo #runReader(Chinese) >> resume-zh.typ
echo #runReader(Simplified) >> resume.typ
echo #runReader(EnglishFull) >> resume-elab.typ

for %%f in (%files%) do typst compile %%f.typ
