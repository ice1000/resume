# ice1000's resume

[![GitHub top language](https://img.shields.io/github/languages/top/ice1000/resume.svg)](https://github.com/ice1000/resume)
[![GitHub forks](https://img.shields.io/github/forks/ice1000/resume.svg?style=social&label=Fork)](https://github.com/ice1000/resume)

This is my resume, based on [billryan's template](https://github.com/billryan/resume), with references to [matchy's template](https://github.com/matchy233/chi-cv-template).
There's a [Haskell script](Resume.hs) to generate the TeX source files, using a [reader monad](TeX.hs) `Resume` to spread the generation options.

# Build

To build this resume, install texlive-full and a Haskell toolchain (GHC with Cabal) first.
Then:

```bash
# Generate the TeX files
runghc Main.hs en >> latex/resume.tex
runghc Main.hs cn >> latex/resume-cn.tex
runghc Main.hs elab >> latex/resume-elab.tex

# Build the TeX files
cd latex
make
cp *.pdf ..
cd ..
```

# Download/下载

+ [English one-page version (pdf)](./resume.pdf)
+ [English complete version (pdf)](./resume-elab.pdf)
+ [中文版 (pdf)](./resume-cn.pdf)

中文简历不提供单页版本。
