//=============================================================================
// ITS Informatics Department Thesis (Typst)
//
// This is your main entry point. Edit the content below and
// customize the configuration variables at the top of this file
// for your thesis metadata.
//
// Department of Informatics
// Faculty of Intelligent Electrical and Informatics Technology
// Institut Teknologi Sepuluh Nopember (ITS)
// Surabaya, Indonesia
//=============================================================================

//=============================================================================
// THESIS CONFIGURATION
// Edit the variables below to customize your thesis metadata.
// All variables are available directly (without prefix) throughout
// this file and are also passed to the template as named arguments.
//=============================================================================

// --- Author Information ---
#let author = "Nama Mahasiswa"
#let nrp = "60xxxxxxxx"

// --- Supervisor Information ---
#let supervisors = (
  (name: "Dosen Pembimbing ke-1 (Lengkap)", shortName: "Dosen Pembimbing ke-1 (Singkat)", nip: "20xxxxxxxx"),
  (name: "Dosen Pembimbing ke-2 (Lengkap)", shortName: "Dosen Pembimbing ke-2 (Singkat)", nip: "20xxxxxxxx"),
)

// --- Examiner Information ---
#let examiners = (
  (name: "Dosen Penguji ke-1 (Lengkap)", shortName: "Dosen Penguji ke-1 (Singkat)", nip: "20xxxxxxxx"),
  (name: "Dosen Penguji ke-2 (Lengkap)", shortName: "Dosen Penguji ke-2 (Singkat)", nip: "20xxxxxxxx"),
  (name: "Dosen Penguji ke-3 (Lengkap)", shortName: "Dosen Penguji ke-3 (Singkat)", nip: "20xxxxxxxx"),
)

// --- Head of Department ---
#let chief = (name: "Kepala Departemen Informatika", nip: "20xxxxxxxx")

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

// --- Essay Code ---
#let essay = "IF185301 TESIS"

// --- Thesis Titles ---
#let title = (
  id: "TESIS MAHASISWA DEPARTEMEN TEKNIK INFORMATIKA INSTITUT TEKNOLOGI SEPULUH NOPEMBER (DALAM BAHASA INDONESIA)",
  en: "POSTGRADUATE STUDENT THESIS OF INFORMATICS DEPARTMENT OF SEPULUH NOPEMBER INSTITUTE OF TECHNOLOGY (IN ENGLISH)",
)

// --- Resource Paths (relative to src/) ---
#let paths = (
  logo: "resources/its-logo.png",
  coverBackground: "resources/its-thesis-cover-without-logo.png",
  validationBackground: "resources/its-thesis-validation.png",
  bibliography: "bibliography.bib",
)

//=============================================================================
// TEMPLATE SETUP
// Each config variable is passed directly as a named argument to the
// template — no `cfg` wrapper needed. Use them directly in your content.
//=============================================================================

#import "template.typ": thesis

#show: thesis.with(
  author: author,
  nrp: nrp,
  supervisors: supervisors,
  examiners: examiners,
  chief: chief,
  dates: dates,
  program: program,
  essay: essay,
  title: title,
  paths: paths,
)

//=============================================================================
// 1. DEDICATION
//=============================================================================

#v(6cm)
#align(left)[
  Karya ini kupersembahkan kepada: \
  istriku tercinta, anak-anakku tersayang, dan kedua orang tuaku \
  yang selalu mendukungku dan mendoakanku.
]

#pagebreak()

//=============================================================================
// 2. FOREWORD  (Kata Pengantar)
//=============================================================================

// Typst 0.13+ removed par(indent: ...)
// Use explicit first-line indentation if needed: #indent[content]

#align(center, text(size: 13pt, weight: "bold")[#upper("KATA PENGANTAR")])

#v(1.5em)

Puji dan syukur ke hadirat Allah SWT atas segala limpahan nikmat dan
rahmat-Nya sehingga penulis dapat menyelesaikan penelitian tesis dengan
judul yang telah ditentukan.

Tujuan dari penulisan tesis ini adalah untuk melengkapi salah satu syarat
dalam mencapai derajat Magister Komputer (M.Kom.) di Departemen Teknik
Informatika, Fakultas Teknologi Elektro dan Informatika Cerdas (FT-EIC),
Institut Teknologi Sepuluh Nopember (ITS), Surabaya, Indonesia.

Dalam penyusunan tesis ini tidak terlepas dari pihak-pihak yang memberikan
dukungan baik secara materiil maupun non-materiil.

+ .....
+ .....
+ .....
+ .....

Semoga Allah SWT selalu melindungi dan memberikan rahmat-Nya.

Penulis sangat menyadari bahwa penulisan ini tidaklah luput dari kesalahan
dan kekurangan.

Akhir kata, penulis mengharapkan semoga hasil dari penulisan dan penelitian
ini dapat memberikan informasi yang bermanfaat bagi para pembaca.

#v(2em)
#align(right)[
  Surabaya, tanggal bulan tahun \
  \
  \
  \
  Penulis
]

#pagebreak()

//=============================================================================
// 3. INDONESIAN ABSTRACT  (Abstrak)
//=============================================================================

// Typst 0.13+ doesn't support par(indent: ...)
// For abstracts, we can leave paragraphs without indent or use #par.leading

#align(center, text(size: 12pt, weight: "bold")[
  #title.id
])

#v(1em)
#author / #nrp \
Pembimbing 1: #supervisors.at(0).name \
Pembimbing 2: #supervisors.at(1).name

#v(2em)
#align(center, text(size: 13pt, weight: "bold")[#upper("ABSTRAK")])

#v(1em)
Tulis abstrak bahasa Indonesia di sini.

#v(1em)
#text(weight: "bold")[Kata Kunci:] Pertama, Kedua, Ketiga, Keempat, Kelima.

#pagebreak()

//=============================================================================
// 4. ENGLISH ABSTRACT
//=============================================================================

#align(center, text(size: 12pt, weight: "bold")[
  #title.en
])

#v(1em)
#author / #nrp \
Supervisor 1: #supervisors.at(0).name \
Supervisor 2: #supervisors.at(1).name

#v(2em)
#align(center, text(size: 13pt, weight: "bold")[#upper("ABSTRACT")])

#v(1em)
Write your English abstract here.

#v(1em)
#text(weight: "bold")[Keywords:] First, Second, Third, Fourth, Fifth.

#pagebreak()

//=============================================================================
// 5. TABLE OF CONTENTS
//=============================================================================

#outline(
  title: [#align(center, text(size: 14pt, weight: "bold")[#upper("DAFTAR ISI")])],
  indent: auto,
  depth: 3,
)

#pagebreak()

//=============================================================================
// 6. LIST OF TABLES
//=============================================================================

#outline(
  title: [#align(center, text(size: 14pt, weight: "bold")[#upper("DAFTAR TABEL")])],
  target: figure.where(kind: table),
)

#pagebreak()

//=============================================================================
// 7. LIST OF FIGURES
//=============================================================================

#outline(
  title: [#align(center, text(size: 14pt, weight: "bold")[#upper("DAFTAR GAMBAR")])],
  target: figure.where(kind: image),
)

#pagebreak()

#include "content.typ"

//=============================================================================
// BIBLIOGRAPHY
//=============================================================================

#set heading(numbering: none)

= DAFTAR PUSTAKA
#bibliography(
  "bibliography.bib",
  title: none,
  style: "apa",
  full: true,
)

#pagebreak()

//=============================================================================
// APPENDICES
//=============================================================================

= Lampiran A. Instrumen Pengujian

Isi lampiran A di sini ...

#pagebreak()

= Lampiran B. Rincian Kasus Uji

#table(
  columns: (auto, auto, auto),
  [No.], [Kasus], [Hasil],
  [1], [Kasus A], [Lulus],
  [2], [Kasus B], [Lulus],
  [3], [Kasus C], [Gagal],
)

#pagebreak()

= Lampiran C. Penjelasan Hasil

Isi lampiran C di sini ...

#pagebreak()

//=============================================================================
// BIOGRAPHY
//=============================================================================

#set heading(numbering: none)
#align(center, text(size: 13pt, weight: "bold")[#upper("BIOGRAFI PENULIS")])

#v(1.5em)

Tulis biografi penulis di sini.
