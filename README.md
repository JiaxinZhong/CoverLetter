# CoverLetter --- LaTeX templates for cover & rebuttal letters

Three entry files powered by a single class: **`CoverLetter.cls`**

- `CoverLetter.tex` — standalone **cover letter**
- `RebuttalLetter.tex` — standalone **rebuttal / response to reviewers**
- `RebuttalLetterFull.tex` — **combined** PDF (cover letter + rebuttal)

The goal is to make revision cycles painless: shared metadata, clean journal-friendly formatting, and reproducible builds.

---

## Features

- TBD

---



## Usage

- Preferred compiler: `XeLaTeX => biber => XeLaTeX => XeLaTeX`

### Makefile

| Target            | What it does                                                                 |
| ---               | ---                                                                           |
| `make` / `all`    | Build **all** PDFs (`CoverLetter.pdf`, `RebuttalLetter.pdf`, `RebuttalLetterFull.pdf`). |
| `make cover`      | Build `CoverLetter.pdf`.                                                     |
| `make rebuttal`   | Build `RebuttalLetter.pdf`.                                                  |
| `make full`       | Build `RebuttalLetterFull.pdf`.      

---