//=============================================================================
// ITS Informatics Department Thesis Template (Typst)
// Template module — contains all structural layout and styling.
//
// Usage:
//   #import "template.typ": thesis
//   #show: thesis.with(author: author, nrp: nrp, ...)
//   ... your content here ...
//
// All config variables are passed directly as named arguments
// (no `cfg` wrapper). Use them directly without any prefix.
//
// All formatting (page geometry, fonts, heading styles, cover pages,
// approval pages, numbering) is handled by this template. You only
// need to provide the content in thesis.typ.
//
// Department of Informatics
// Faculty of Intelligent Electrical and Informatics Technology
// Institut Teknologi Sepuluh Nopember (ITS)
// Surabaya, Indonesia
//=============================================================================

//=============================================================================
// CONSTANTS
//=============================================================================

#let heading-font = ("Trebuchet MS", "Arial", "Helvetica")
#let body-font = "Times New Roman"

#let standard-margin = (
  top: 3.5cm,
  bottom: 3.0cm,
  inside: 4.0cm,
  outside: 3.0cm,
)

//=============================================================================
// HELPER — centred, bold, uppercase section title
//=============================================================================

#let section-title(body) = align(center, text(size: 13pt, weight: "bold")[
  #upper(body)
])

//=============================================================================
// COVER PAGE 1  (blue background)
//=============================================================================

#let render-cover-1(author, nrp, essay, title, paths, supervisors, program) = {
  set page(numbering: none, margin: 0cm)
  set page(
    background: image(
      paths.coverBackground,
      width: 100%,
      height: 100%,
    ),
  )
  set text(fill: white, font: heading-font, fallback: true)

  place(left + top, dx: 3cm, dy: 1.5cm)[
    #image(paths.logo, width: 3.5cm)
  ]

  place(left + top, dx: 3cm, dy: 8cm)[
    #set text(size: 16pt, weight: "bold")
    #upper(essay)
  ]

  place(left + top, dx: 3cm, dy: 10cm)[
    #set text(size: 22pt, weight: "bold")
    #upper(title.id)
  ]

  place(left + top, dx: 3cm, dy: 15cm)[
    #set text(size: 14pt, weight: "bold")
    #upper(author) \
    #upper(nrp)
  ]

  place(left + top, dx: 3cm, dy: 18cm)[
    #set text(size: 12pt, weight: "bold")
    DOSEN PEMBIMBING \
    #supervisors.at(0).name \
    #supervisors.at(1).name
  ]

  place(left + top, dx: 3cm, dy: 21cm)[
    #set text(size: 11pt, weight: "bold")
    #upper(program.type) \
    BIDANG KEAHLIAN #upper(program.courseClass) (#program.courseClassShort) \
    PROGRAM STUDI #upper(program.degree) #upper(program.concentration) \
    #upper(program.department) \
    #upper(program.faculty) \
    #upper(program.university) \
    #upper(program.city) \
    #str(program.year)
  ]
}

//=============================================================================
// COVER PAGE 2  (no background)
//=============================================================================

#let render-cover-2(author, nrp, essay, title, paths, supervisors, program) = {
  set page(margin: (top: 1.5cm, bottom: 3cm, left: 3cm, right: 3cm))
  set text(font: heading-font, fallback: true, weight: "bold")

  image(paths.logo, width: 3.5cm)

  v(3cm)
  set text(size: 16pt)
  upper(essay)

  v(0.9cm)
  set text(size: 22pt)
  upper(title.id)

  v(0.9cm)
  set text(size: 14pt)
  [#upper(author) \ #upper(nrp)]

  v(0.9cm)
  set text(size: 12pt)
  [DOSEN PEMBIMBING \ #supervisors.at(0).name \ #supervisors.at(1).name]

  v(0.9cm)
  set text(size: 11pt)
  [
    #upper(program.type) \
    BIDANG KEAHLIAN #upper(program.courseClass) (#program.courseClassShort) \
    PROGRAM STUDI #upper(program.degree) #upper(program.concentration) \
    #upper(program.department) \
    #upper(program.faculty) \
    #upper(program.university) \
    #upper(program.city) \
    #str(program.year)
  ]
}

//=============================================================================
// PROPOSAL APPROVAL
//=============================================================================

#let render-proposal-approval(title, author, nrp, dates, examiners, supervisors) = {
  set page(
    margin: (
      top: 3.5cm,
      bottom: 3.0cm,
      inside: 2.75cm,
      outside: 2.50cm,
    ),
    background: none,
  )
  set text(font: body-font, fill: black, weight: "regular", size: 11pt)

  align(center, text(size: 14pt, weight: "bold")[
    #upper("LEMBAR PENGESAHAN") \
    #upper("PROPOSAL TESIS")
  ])

  v(1em)

  [Judul: #title.id]
  [Mahasiswa: #author]
  [NRP: #nrp]

  v(1.5em)
  [Telah diseminarkan pada,]

  [Hari: #dates.exam.day]
  [Tanggal: #dates.exam.date]
  [Tempat: #dates.exam.place]

  v(1.5em)
  [Mengetahui/Menyetujui,]

  v(1em)
  set text(size: 10pt)

  let penguji-label = text(weight: "bold")[Dosen Penguji:]
  let pembimbing-label = text(weight: "bold")[Dosen Pembimbing:]

  grid(
    columns: (1fr, 1fr),
    gutter: 1cm,
    align: left,
    penguji-label,
    pembimbing-label,
    [1. #examiners.at(0).name],
    [1. #supervisors.at(0).name],
    [NIP: #examiners.at(0).nip],
    [NIP: #supervisors.at(0).nip],
    [2. #examiners.at(1).name],
    [2. #supervisors.at(1).name],
    [NIP: #examiners.at(1).nip],
    [NIP: #supervisors.at(1).nip],
    [3. #examiners.at(2).name],
    [],
    [NIP: #examiners.at(2).nip],
    [],
  )
}

//=============================================================================
// THESIS APPROVAL
//=============================================================================

#let render-thesis-approval(paths, program, author, nrp, dates, supervisors, examiners, chief) = {
  set page(margin: standard-margin)
  set page(
    background: image(
      paths.validationBackground,
      width: 100%,
      height: 100%,
    ),
  )

  align(center)[
    #v(0.5em)
    #set text(size: 14pt, weight: "bold")
    #upper("Lembar Pengesahan Tesis")

    #v(2em)
    #set text(weight: "bold")
    Tesis disusun untuk memenuhi salah satu syarat memperoleh gelar \
    #program.title \
    di \
    #program.university

    #v(1em)
    Oleh: \
    #author \
    NRP: #nrp

    #v(1em)
    Tanggal Ujian: #dates.exam.date \
    Periode Wisuda: #dates.graduationPeriod

    #v(1em)
    Disetujui oleh:
  ]

  let bpemb = text(weight: "bold")[Pembimbing:]
  let bpeng = text(weight: "bold")[Penguji:]

  grid(
    columns: (auto, 1fr),
    gutter: 5pt,
    align: left,
    bpemb, [],
    [1.], [#supervisors.at(0).name \ NIP: #supervisors.at(0).nip],
    [2.], [#supervisors.at(1).name \ NIP: #supervisors.at(1).nip],
    [], [],
    bpeng, [],
    [1.], [#examiners.at(0).name \ NIP: #examiners.at(0).nip],
    [2.], [#examiners.at(1).name \ NIP: #examiners.at(1).nip],
    [3.], [#examiners.at(2).name \ NIP: #examiners.at(2).nip],
  )

  v(2.5em)

  align(center)[
    Kepala #program.department \
    #program.faculty \
    \
    \
    \
    #underline(chief.name) \
    NIP: #chief.nip
  ]
}

//=============================================================================
// ORIGINALITY STATEMENT
//=============================================================================

#let render-originality(author, nrp, supervisors, program, title, dates) = {
  set page(margin: (
    top: 3.5cm,
    bottom: 3.0cm,
    left: 4.0cm,
    right: 2.5cm,
  ))
  set text(size: 11pt)

  align(center, text(size: 13pt, weight: "bold")[
    #upper("PERNYATAAN ORISINALITAS TESIS")
  ])

  v(1.5em)
  [Yang bertanda tangan di bawah ini,]

  v(0.5em)
  [
    Nama               : #author (#nrp) \
    Dosen Pembimbing 1 : #supervisors.at(0).name (#supervisors.at(0).nip) \
    Dosen Pembimbing 2 : #supervisors.at(1).name (#supervisors.at(1).nip) \
    Program Studi      : #program.degree #program.concentration \
    Departemen         : #program.department \
    Fakultas           : #program.faculty
  ]

  v(0.5em)
  [
    Dengan ini menyatakan bahwa Tesis yang berjudul
    "#title.id" adalah hasil karya sendiri, bersifat orisinil,
    dan ditulis dengan mengikuti kaidah penulisan ilmiah.
  ]

  v(0.5em)
  [
    Apabila di kemudian hari ditemukan ketidaksesuaian dengan
    pernyataan ini, maka saya bersedia menerima sanksi sesuai
    dengan ketentuan yang berlaku di #program.university (ITS).
  ]

  v(2em)

  align(right)[
    #program.city, #dates.writing \
    Mahasiswa \
    \
    \
    #author \
    NRP: #nrp
  ]

  v(1em)

  [Mengetahui,]

  grid(
    columns: (1fr, 1fr),
    gutter: 3cm,
    align: center,
    [#supervisors.at(0).shortName \ NIP: #supervisors.at(0).nip],
    [#supervisors.at(1).shortName \ NIP: #supervisors.at(1).nip],
    [Dosen Pembimbing 1],
    [Dosen Pembimbing 2],
  )
}

//=============================================================================
// MAIN TEMPLATE FUNCTION
// Applied via:  #show: thesis.with(author: author, nrp: nrp, ...)
//
// This function:
//   1. Applies document-wide styling (page, text, par, headings).
//   2. Renders all front-matter pages (covers, approvals, statement).
//   3. Sets roman numbering before user content.
//   4. Calls `doc` — the user's thesis content.
//=============================================================================

#let thesis(
  author: none,
  nrp: none,
  supervisors: none,
  examiners: none,
  chief: none,
  dates: none,
  program: none,
  essay: none,
  title: none,
  paths: none,
  doc,
) = {
  // ---- 1. Document-wide defaults ----
  set page(paper: "a4", margin: standard-margin)
  set text(font: body-font, size: 12pt)
  set par(justify: true, leading: 0.85em, spacing: 0.85em)
  set heading(numbering: "1.")
  set list(indent: 2em, spacing: 0.3em)

  // ---- 2. Heading show-rules ----
  show heading.where(level: 1): it => {
    v(2em)
    set align(center)
    set text(size: 14pt, weight: "bold")
    it
    v(1.5em)
  }

  show heading.where(level: 2): it => {
    set text(size: 12pt, weight: "bold")
    it
    v(0.5em)
  }

  show heading.where(level: 3): it => {
    set text(size: 12pt, weight: "bold", style: "italic")
    it
    v(0.25em)
  }

  // ---- 3. Figure-caption style ----
  show figure.caption: set text(size: 10pt)

  // ---- 4. COVER PAGE 1 (with background) ----
  render-cover-1(author, nrp, essay, title, paths, supervisors, program)
  pagebreak()

  // ---- 5. BLANK PAGE ----
  set page(margin: standard-margin, background: none, numbering: none)
  set text(fill: black, font: body-font)
  pagebreak()

  // ---- 6. COVER PAGE 2 (no background) ----
  render-cover-2(author, nrp, essay, title, paths, supervisors, program)
  pagebreak()

  // ---- 7. PROPOSAL APPROVAL ----
  render-proposal-approval(title, author, nrp, dates, examiners, supervisors)
  pagebreak()

  // ---- 8. THESIS APPROVAL ----
  render-thesis-approval(paths, program, author, nrp, dates, supervisors, examiners, chief)
  pagebreak()

  // Remove validation background after thesis-approval page
  set page(background: none)

  // ---- 9. ORIGINALITY STATEMENT ----
  render-originality(author, nrp, supervisors, program, title, dates)
  pagebreak()

  // ---- 10. Reset to standard settings ----
  set page(margin: standard-margin, background: none)
  set text(font: body-font, size: 12pt, fill: black, weight: "regular")

  // ---- 11. Roman numbering for preliminary pages ----
  set page(numbering: "i")

  // ---- 12. User content (dedication, foreword, abstracts,    ----
  //         TOC, chapters, bibliography, appendices, biography).
  doc
}
