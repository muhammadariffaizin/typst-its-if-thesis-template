## General Information

**Typst Template for Master Degree Student's Thesis**

*Department of Informatics*,

*Faculty of Intelligent Electrical and Informatics Technology*,

*Institut Teknologi Sepuluh Nopember (ITS)*,

*Surabaya, Indonesia.*


## Code Name

**ITS-IF-THESIS-TYPST 1.0.0**

## Short Description

Typst is a modern, markup-based typesetting system for the sciences that serves as a compelling alternative to LaTeX. It combines powerful scripting capabilities with clean, readable syntax. This template provides the same ITS thesis formatting as the original LaTeX version, but uses Typst's more intuitive syntax.

In *Department of Informatics, Faculty of Intelligent Electrical and Informatics Technology, Institut Teknologi Sepuluh Nopember (ITS), Surabaya, Indonesia*, every student will be assigned to write a final paper, also the *master's degree* student who should write a **thesis** alongside with the research and publish the paper to the credible journals or conferences.

This template is intended to make them easier to write a thesis paperwork by using Typst and still following the ITS postgraduate thesis official guidance.

Currently this template is especially developed and written for Department of Informatics master degree student, but it could be widely enhanced, improved, and re-written for other department or faculty.

This is a conversion of the original LaTeX template by Ravi Vendra Rishika to Typst format.

Inspired by https://github.com/ravivendra/latex-its-if-thesis-template



## Author

1. **Muhammad 'Arif Faizin** <<ariffaizin@its.ac.id>>

If there is any question or advice to make this template improved, please feel free to contact me via the email address aforementioned.


## Technology Stack

This Typst template project is developed using **Typst**.

### Prerequisites

- [Typst](https://typst.app) installed on your system
- Alternatively, use the [Typst web app](https://typst.app)

### How to Compile

```bash
# Via make (recommended)
make install

# Or manually
typst compile src/thesis.typ build/thesis.pdf

# Watch mode (live preview)
typst watch src/thesis.typ build/thesis.pdf
```


## File Structure

```
├── src/
│   ├── thesis.typ        # Main document file (entry point)
│   ├── config.yaml       # Thesis metadata (YAML)
│   ├── bibliography.bib  # Bibliography database (BibTeX format)
│   ├── template.typ      # Layout and styling template
│   └── resources/        # Image resources
│       ├── its-logo.png
│       ├── its-thesis-cover-with-logo.png
│       ├── its-thesis-cover-without-logo.png
│       ├── its-thesis-validation.png
│       └── chapter-2-power-digital-finance.png
├── build/                # Build output
│   └── thesis.pdf
├── Makefile              # Build automation
└── LICENSE
```

## Customization

To customize your thesis information, edit `src/config.yaml`:

```yaml
author: "Nama Mahasiswa"
nrp: "60xxxxxxxx"
title:
  id: "TESIS MAHASISWA ..."
  en: "POSTGRADUATE STUDENT THESIS ..."
# ... etc.
```

## License

This Typst template project is developed using the license : **GNU GPL v3.0**, a free, copyleft license for software and other kinds of works.
