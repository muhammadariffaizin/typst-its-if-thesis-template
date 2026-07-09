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
│   ├── thesis.typ        # Main document file (entry point + configuration)
│   ├── bibliography.bib  # Bibliography database (BibTeX format)
│   ├── template.typ      # Layout and styling template
│   ├── content.typ       # Thesis chapters content
│   └── resources/        # Image resources
│       ├── its-logo.png
│       ├── its-thesis-cover-without-logo.svg
│       ├── its-thesis-cover-without-logo-2.svg
│       ├── its-thesis-validation.png
│       ├── fake-sign.svg
│       └── chapter-2-power-digital-finance.png
├── build/                # Build output
│   └── thesis.pdf
├── Makefile              # Build automation
└── LICENSE
```

## Customization

To customize your thesis information, edit the configuration variables at the top of [`src/thesis.typ`](src/thesis.typ). All metadata is defined as plain Typst variables — no separate `yaml` file needed.

### Basic Information

```typst
// --- Author Information ---
#let author = "Nama Mahasiswa"
#let nrp = "60xxxxxxxx"
#let sign = "resources/fake-sign.svg"          // Signature image for documents

// --- Thesis Titles ---
#let title = (
  id: "Tesis Mahasiswa Departemen ... (dalam Bahasa Indonesia)",
  en: "Master Student Thesis of the Department ... (in English)",
)
```

### Supervisors, Examiners & Head of Department

Each person entry includes a `sign` field pointing to their signature image (SVG/PNG):

```typst
// --- Supervisor Information ---
#let supervisors = (
  (name: "Dosen Pembimbing ke-1", nip: "20xxxxxxxx", sign: "resources/fake-sign.svg"),
  (name: "Dosen Pembimbing ke-2", nip: "20xxxxxxxx", sign: "resources/fake-sign.svg"),
)

// --- Examiner Information ---
#let examiners = (
  (name: "Dosen Penguji ke-1", nip: "20xxxxxxxx", sign: "resources/fake-sign.svg"),
  (name: "Dosen Penguji ke-2", nip: "20xxxxxxxx", sign: "resources/fake-sign.svg"),
  (name: "Dosen Penguji ke-3", nip: "20xxxxxxxx", sign: "resources/fake-sign.svg"),
)

// --- Head of Department ---
#let chief = (name: "Nama Kepala Departemen", nip: "20xxxxxxxx", sign: "resources/fake-sign.svg")
```

### Dates & Academic Program

```typst
// --- Dates ---
#let dates = (
  writing: "27 Juni 2024",
  exam: (day: "Rabu", date: "10 Juli 2024", place: "Ruang 217B"),
  graduationPeriod: "September 2024",
)

// --- Academic Program ---
#let program = (
  type: "Program Magister",
  title: "Magister Komputer (M.Kom.)",
  concentration: "Teknik Informatika",
  courseClass: "Teknologi Jaringan dan Keamanan Siber Cerdas",
  courseClassShort: "NETICS",
  degree: "S2",
  department: "Departemen Teknik Informatika",
  faculty: "Fakultas Teknologi Elektro dan Informatika Cerdas",
  university: "Institut Teknologi Sepuluh Nopember",
  city: "Surabaya",
  year: 2026,
)
```

### Essay Code & Resource Paths

```typst
// --- Essay Code ---
#let essay = "Tesis Sidang Akhir - EF235401"

// --- Resource Paths (relative to src/) ---
#let paths = (
  logo: "resources/its-logo.png",
  coverBackground: "resources/its-thesis-cover-without-logo.svg",
  coverBackgroundSecondary: "resources/its-thesis-cover-without-logo-2.svg",
  validationBackground: "resources/its-thesis-validation.png",
  bibliography: "bibliography.bib",
)
```

### Template Flags

The template is applied at the bottom of [`src/thesis.typ`](src/thesis.typ):

```typst
#show: thesis.with(
  author: author,
  nrp: nrp,
  sign: sign,
  supervisors: supervisors,
  examiners: examiners,
  chief: chief,
  dates: dates,
  program: program,
  essay: essay,
  title: title,
  paths: paths,
  proposal: true,   // true  → proposal approval layout
                     // false → final thesis approval + originality statement
)
```

- **`proposal: true`** — renders the *Proposal Tesis* approval page (for seminar).
- **`proposal: false`** — renders the final *Lembar Pengesahan Tesis* page followed by the *Pernyataan Orisinalitas* statement.

### Helper: Horizontal Tab Alignment

The template provides a `tab-to` helper for aligning text labels across multiple lines (used in abstracts and approval pages):

```typst
#let tab-to(target-width, body) = context {
  let current-width = measure(body).width
  if current-width < target-width {
    h(target-width - current-width)
  } else {
    h(0pt)
  }
}
```

Use it to create aligned label–value pairs:

```typst
Nama#tab-to(3.5cm, [Nama]): #author \
NRP#tab-to(3.5cm, [NRP]): #nrp
```

## License

This Typst template project is developed using the license : **GNU GPL v3.0**, a free, copyleft license for software and other kinds of works.
