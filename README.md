# gramr

[![Travis-CI Build Status](https://travis-ci.org/benmarwick/gramr.svg?branch=master)](https://travis-ci.org/benmarwick/gramr)
[![Coverage Status](https://img.shields.io/codecov/c/github/benmarwick/gramr/master.svg)](https://codecov.io/github/benmarwick/gramr?branch=master)
[![Last-changedate](https://img.shields.io/badge/last%20change-2017--05--19-brightgreen.svg)](https://github.com/benmarwick/gramr/commits/master) [![minimal R version](https://img.shields.io/badge/R%3E%3D-3.4.0-brightgreen.svg)](https://cran.r-project.org/) [![Licence](https://img.shields.io/github/license/mashape/apistatus.svg)](http://choosealicense.com/licenses/mit/) 

**The goal of gramr is to help R programmers who can't write good and and wanna learn to do other stuff good too by checking a RMarkdown document for grammatical errors.**

This package wraps the command line tool, [`write-good`](https://github.com/btford/write-good) to provide grammar checking functions for Rmd or md documents. It can be used as an [RStudio Addin](https://rstudio.github.io/rstudioaddins/), or from the console or command line by supplying an Rmd or md filename.

![](https://media.giphy.com/media/OCMGLUo7d5jJ6/giphy.gif)

## Installation

You can install `gramr` from github with:

```R
# install.packages("devtools")
devtools::install_github("ropenscilabs/gramr")
```

## Examples

`write_good_ip()`: run the write-good linter on text in a currently active Rmd file in RStudio

![](untitled-picture.jpg)

`write_good_file("my_file.Rmd")`: run the write-good linter on text in an Rmd file (RStudio not required)

## Contributing

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

## Acknowledgements

Thanks to [Brian Ford](https://github.com/btford) for the development of [write-good](https://github.com/btford/write-good)!
