//=============================================================================
// ITS Informatics Department Thesis Template (Typst)
// Template module — contains all structural layout and styling.
//
// Usage:
//   #import "template.typ": thesis
//   #show: thesis.with(cfg: yaml("config.yaml"))
//   ... your content here ...
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

#let heading-font = ("Liberation Sans", "Arial", "Helvetica")
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

#let render-cover-1(cfg) = {
  set page(numbering: none, margin: 0cm)
  pagebreak()
  set page(
    background: image(
      cfg.paths.coverBackground,
      width: 100%,
      height: 100%,
    ),
  )
  set text(fill: white, font: heading-font, fallback: true)

  place(left + top, dx: 3cm, dy: 1.5cm)[
    #image(cfg.paths.logo, width: 3.5cm)
  ]

  place(left + top, dx: 3cm, dy: 7cm)[
    #set text(size: 16pt, weight: "bold")
    #upper(cfg.essay)
  ]

  place(left + top, dx: 3cm, dy: 9cm)[
    #set text(size: 22pt, weight: "bold")
    #upper(cfg.title.id)
  ]

  place(left + top, dx: 3cm, dy: 14cm)[
    #set text(size: 14pt, weight: "bold")
    #upper(cfg.author) \
    #upper(cfg.nrp)
  ]

  place(left + top, dx: 3cm, dy: 17cm)[
    #set text(size: 12pt, weight: "bold")
    Dosen Pembimbing: \
    #cfg.supervisors.at(0).name \
    #cfg.supervisors.at(1).name
  ]

  place(left + top, dx: 3cm, dy: 21cm)[
    #set text(size: 11pt, weight: "bold")
    #upper(cfg.program.type) \
    Bidang Keahlian #upper(cfg.program.courseClass) (#cfg.program.courseClassShort) \
    Program Studi #cfg.program.degree #cfg.program.concentration \
    #cfg.program.department \
    #cfg.program.faculty \
    #cfg.program.university \
    #cfg.program.city \
    #str(cfg.program.year)
  ]
}

//=============================================================================
// COVER PAGE 2  (no background)
//=============================================================================

#let render-cover-2(cfg) = {
  set page(margin: (top: 1.5cm, bottom: 3cm, left: 3cm, right: 3cm))
  set text(font: heading-font, fallback: true, weight: "bold")

  image(cfg.paths.logo, width: 3.5cm)

  v(3cm)
  set text(size: 16pt)
  upper(cfg.essay)

  v(0.9cm)
  set text(size: 22pt)
  upper(cfg.title.id)

  v(0.9cm)
  set text(size: 14pt)
  [#upper(cfg.author) \ #upper(cfg.nrp)]

  v(0.9cm)
  set text(size: 12pt)
  [Dosen Pembimbing: \ #cfg.supervisors.at(0).name \ #cfg.supervisors.at(1).name]

  v(0.9cm)
  set text(size: 11pt)
  [
    #upper(cfg.program.type) \
    Bidang Keahlian #upper(cfg.program.courseClass) (#cfg.program.courseClassShort) \
    Program Studi #cfg.program.degree #cfg.program.concentration \
    #cfg.program.department \
    #cfg.program.faculty \
    #cfg.program.university \
    #cfg.program.city \
    #str(cfg.program.year)
  ]
}

//=============================================================================
// PROPOSAL APPROVAL
//=============================================================================

#let render-proposal-approval(cfg) = {
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

  [Judul: #cfg.title.id]
  [Mahasiswa: #cfg.author]
  [NRP: #cfg.nrp]

  v(1.5em)
  [Telah diseminarkan pada,]

  [Hari: #cfg.dates.exam.day]
  [Tanggal: #cfg.dates.exam.date]
  [Tempat: #cfg.dates.exam.place]

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
    [1. #cfg.examiners.at(0).name],
    [1. #cfg.supervisors.at(0).name],
    [NIP: #cfg.examiners.at(0).nip],
    [NIP: #cfg.supervisors.at(0).nip],
    [2. #cfg.examiners.at(1).name],
    [2. #cfg.supervisors.at(1).name],
    [NIP: #cfg.examiners.at(1).nip],
    [NIP: #cfg.supervisors.at(1).nip],
    [3. #cfg.examiners.at(2).name],
    [],
    [NIP: #cfg.examiners.at(2).nip],
    [],
  )
}

//=============================================================================
// THESIS APPROVAL
//=============================================================================

#let render-thesis-approval(cfg) = {
  set page(margin: standard-margin)
  set page(
    background: image(
      cfg.paths.validationBackground,
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
    #cfg.program.title \
    di \
    #cfg.program.university

    #v(1em)
    Oleh: \
    #cfg.author \
    NRP: #cfg.nrp

    #v(1em)
    Tanggal Ujian: #cfg.dates.exam.date \
    Periode Wisuda: #cfg.dates.graduationPeriod

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
    [1.], [#cfg.supervisors.at(0).name \ NIP: #cfg.supervisors.at(0).nip],
    [2.], [#cfg.supervisors.at(1).name \ NIP: #cfg.supervisors.at(1).nip],
    [], [],
    bpeng, [],
    [1.], [#cfg.examiners.at(0).name \ NIP: #cfg.examiners.at(0).nip],
    [2.], [#cfg.examiners.at(1).name \ NIP: #cfg.examiners.at(1).nip],
    [3.], [#cfg.examiners.at(2).name \ NIP: #cfg.examiners.at(2).nip],
  )

  v(2.5em)

  align(center)[
    Kepala #cfg.program.department \
    #cfg.program.faculty \
    \
    \
    \
    #underline(cfg.chief.name) \
    NIP: #cfg.chief.nip
  ]
}

//=============================================================================
// ORIGINALITY STATEMENT
//=============================================================================

#let render-originality(cfg) = {
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
    Nama               : #cfg.author (#cfg.nrp) \
    Dosen Pembimbing 1 : #cfg.supervisors.at(0).name (#cfg.supervisors.at(0).nip) \
    Dosen Pembimbing 2 : #cfg.supervisors.at(1).name (#cfg.supervisors.at(1).nip) \
    Program Studi      : #cfg.program.degree #cfg.program.concentration \
    Departemen         : #cfg.program.department \
    Fakultas           : #cfg.program.faculty
  ]

  v(0.5em)
  [
    Dengan ini menyatakan bahwa Tesis yang berjudul
    "#cfg.title.id" adalah hasil karya sendiri, bersifat orisinil,
    dan ditulis dengan mengikuti kaidah penulisan ilmiah.
  ]

  v(0.5em)
  [
    Apabila di kemudian hari ditemukan ketidaksesuaian dengan
    pernyataan ini, maka saya bersedia menerima sanksi sesuai
    dengan ketentuan yang berlaku di #cfg.program.university (ITS).
  ]

  v(2em)

  align(right)[
    #cfg.program.city, #cfg.dates.writing \
    Mahasiswa \
    \
    \
    #cfg.author \
    NRP: #cfg.nrp
  ]

  v(1em)

  [Mengetahui,]

  grid(
    columns: (1fr, 1fr),
    gutter: 3cm,
    align: center,
    [#cfg.supervisors.at(0).shortName \ NIP: #cfg.supervisors.at(0).nip],
    [#cfg.supervisors.at(1).shortName \ NIP: #cfg.supervisors.at(1).nip],
    [Dosen Pembimbing 1],
    [Dosen Pembimbing 2],
  )
}

//=============================================================================
// MAIN TEMPLATE FUNCTION
// Applied via:  #show: thesis.with(cfg: yaml("config.yaml"))
//
// This function:
//   1. Applies document-wide styling (page, text, par, headings).
//   2. Renders all front-matter pages (covers, approvals, statement).
//   3. Sets roman numbering before user content.
//   4. Calls `doc` — the user's thesis content.
//=============================================================================

#let thesis(cfg: none, doc) = {
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
  render-cover-1(cfg)
  pagebreak()

  // ---- 5. BLANK PAGE ----
  set page(margin: standard-margin, background: none, numbering: none)
  set text(fill: black, font: body-font)
  pagebreak()

  // ---- 6. COVER PAGE 2 (no background) ----
  render-cover-2(cfg)
  pagebreak()

  // ---- 7. PROPOSAL APPROVAL ----
  render-proposal-approval(cfg)
  pagebreak()

  // ---- 8. THESIS APPROVAL ----
  render-thesis-approval(cfg)
  pagebreak()

  // Remove validation background after thesis-approval page
  set page(background: none)

  // ---- 9. ORIGINALITY STATEMENT ----
  render-originality(cfg)
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
