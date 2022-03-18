# build using pdflatex and biber

default: build

.DEFAULT_GOAL := default
.PHONY: default build

build_pdf:
	pdflatex main.tex

build_bib:
	biber main

build_glossary:
	makeglossaries main

clean:
	rm *.bbl *.aux *.blg *.bcf *.blg *.log *.xml *.fls *.gz *.fdb_latexmk *.out *.toc

# Determine this makefile's path.
# Be sure to place this BEFORE `include` directives, if any.
THIS_FILE := $(lastword $(MAKEFILE_LIST))

build:
	@$(MAKE) -f $(THIS_FILE) build_pdf
	@$(MAKE) -f $(THIS_FILE) build_bib
	@$(MAKE) -f $(THIS_FILE) build_pdf
	@$(MAKE) -f $(THIS_FILE) build_glossary
	@$(MAKE) -f $(THIS_FILE) build_pdf