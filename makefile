# ==============================
# Makefile for CoverLetter repo
# ==============================

# Entry .tex files
TEXS := CoverLetter.tex RebuttalLetter.tex RebuttalLetterFull.tex
PDFS := $(TEXS:.tex=.pdf)

# ===== Engine selection =====
# Choose LaTeX engine: pdflatex (default) | xelatex | lualatex
ENGINE ?= pdflatex

ifeq ($(ENGINE),pdflatex)
  ENGINE_FLAG := -pdf
else ifeq ($(ENGINE),xelatex)
  ENGINE_FLAG := -xelatex
else ifeq ($(ENGINE),lualatex)
  ENGINE_FLAG := -lualatex
else
  $(error Unknown ENGINE '$(ENGINE)'. Use pdflatex|xelatex|lualatex)
endif

# Quiet build? 1=yes, 0=no
QUIET ?= 1
ifeq ($(QUIET),1)
  QUIET_FLAG := -quiet
else
  QUIET_FLAG :=
endif

# If you use minted/Pygments, set MINTED=1 to enable -shell-escape
MINTED ?= 0
ifeq ($(MINTED),1)
  SHELL_ESCAPE := -shell-escape
else
  SHELL_ESCAPE :=
endif

# Extra flags passed to latexmk (optional)
LATEXMK_OPTS ?=

# ========== Targets ==========
.PHONY: all cover rebuttal full watch watch-cover watch-rebuttal watch-full clean distclean help

all: $(PDFS)

cover: CoverLetter.pdf
rebuttal: RebuttalLetter.pdf
full: RebuttalLetterFull.pdf

# Pattern rule: build any .pdf from its .tex
%.pdf: %.tex
	latexmk $(ENGINE_FLAG) $(QUIET_FLAG) $(SHELL_ESCAPE) $(LATEXMK_OPTS) $<

# Live preview (no viewer spawned by latexmk; use your own PDF viewer)
watch: watch-cover watch-rebuttal watch-full

watch-cover:
	latexmk -pvc -view=none $(ENGINE_FLAG) $(QUIET_FLAG) $(SHELL_ESCAPE) $(LATEXMK_OPTS) CoverLetter.tex

watch-rebuttal:
	latexmk -pvc -view=none $(ENGINE_FLAG) $(QUIET_FLAG) $(SHELL_ESCAPE) $(LATEXMK_OPTS) RebuttalLetter.tex

watch-full:
	latexmk -pvc -view=none $(ENGINE_FLAG) $(QUIET_FLAG) $(SHELL_ESCAPE) $(LATEXMK_OPTS) RebuttalLetterFull.tex

# Clean auxiliaries (keeps PDFs)
clean:
	latexmk -C
	@rm -rf _minted* || true

# Clean everything (including PDFs)
distclean: clean
	@rm -f $(PDFS)

help:
	@echo "Usage:"
	@echo "  make [all]              # Build all PDFs ($(PDFS))"
	@echo "  make cover|rebuttal|full# Build individual PDF"
	@echo "  make watch-<target>     # Rebuild on change (cover/rebuttal/full)"
	@echo "  make clean              # Remove aux files"
	@echo "  make distclean          # Remove aux + PDFs"
	@echo ""
	@echo "Variables:"
	@echo "  ENGINE=pdflatex|xelatex|lualatex (default: pdflatex)"
	@echo "  QUIET=1|0 (default: 1)"
	@echo "  MINTED=1 to enable -shell-escape (default: 0)"
	@echo "  LATEXMK_OPTS='...' extra latexmk flags"
