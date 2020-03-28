# ice1000's resume

[![GitHub top language](https://img.shields.io/github/languages/top/ice1000/resume.svg)](https://github.com/ice1000/resume)
[![GitHub forks](https://img.shields.io/github/forks/ice1000/resume.svg?style=social&label=Fork)](https://github.com/ice1000/resume)

This is my resume, based on [this template](https://github.com/billryan/resume).
There's a [Haskell script](Resume.hs) to generate the TeX source files.

# Build

To build this resume, install texlive-full and GHC toolchain first.<br/>
Then:

```bash
# Generate the TeX files
runghc Resume.hs en >> latex/resume.tex
runghc Resume.hs cn >> latex/resume-cn.tex
runghc Resume.hs elab >> latex/resume-elab.tex

# Build the TeX files
cd latex
make
cp *.pdf ..
cd ..
```

# Download/下载

+ [English simplified version (pdf)](./resume.pdf)
+ [English full version (pdf)](./resume-elab.pdf)
+ [中文版 (pdf)](./resume-cn.pdf)
