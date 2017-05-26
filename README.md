# gramr

**The goal of gramr is to help R programmers write well by checking a RMarkdown document for grammatical errors.**

`gramr` provides functions via RStudio addins that leverage a *naive linter for English prose*, [`write-good`](https://github.com/btford/write-good) which the native RStudio spell check feature lacks.

![](https://media.giphy.com/media/OCMGLUo7d5jJ6/giphy.gif)

## Installation

You can install `gramr` from github with:

```R
# install.packages("devtools")
devtools::install_github("ropenscilabs/gramr")
```

### Current Dependencies

This package currently is dependent on **node.js** available at: https://nodejs.org/en/ which also downloads [npm](https://www.npmjs.com/). Then the command line tool can be downloaded: `npm install write-good`

## Example

`write_good_ip`: Run the write-good linter on multiple lines in an unsaved `Untitled` document

![](untitled-picture.jpg)

## Contributing

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

## Acknowledgements

Thanks to [Brian Ford](https://github.com/btford) for the development of [write-good](https://github.com/btford/write-good)!
