# Tom M. Ragonneau's CVs

[![Build](https://github.com/ragonneau/resume/actions/workflows/build.yml/badge.svg)](https://github.com/ragonneau/resume/actions/workflows/build.yml)

LaTeX source files of the resumes of Tom M. Ragonneau.

## Getting Started

To generate `pdf` versions of the CVs you first need to install [latexmk](https://ctan.org/pkg/latexmk?lang=en) v4.51 or later.
Next, clone this repository, and load the bibliography:

```bash
git submodule update --init
```

The `pdf` files can be generated with:

```bash
latexmk -file-line-error -halt-on-error -interaction=nonstopmode
```

## Acknowledgements

This project is based on the [adcv](https://github.com/alessandrorossini/adcv) project of Dr. [Alessandro Rossini](https://alessandrorossini.org/).

## License

Distributed under the LPPL-1.3c License. See `LICENSE` for more information.
