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

#let tab-to(target-width, body) = context {
  let current-width = measure(body).width
  if current-width < target-width {
    h(target-width - current-width)
  } else {
    h(0pt)
  }
}

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
  set text(font: heading-font, fallback: true)

  place(left + top, dx: 3cm, dy: 1.5cm)[
    #image(paths.logo, width: 3.5cm)
  ]

  place(left + top, dx: 3cm, dy: 8cm)[
    #set text(size: 16pt, weight: "bold")
    #upper(essay)
  ]

  place(left + top, dx: 3cm, dy: 10cm)[
    #set text(size: 22pt, weight: "bold")
    #block(width: 15cm)[
      #set text(hyphenate: false)
      #title.id
    ]
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
  set page(numbering: none, margin: 0cm)
  set page(
    background: image(
      paths.coverBackgroundSecondary,
      width: 100%,
      height: 100%,
    ),
  )
  set text(font: heading-font, fallback: true)

  place(left + top, dx: 3cm, dy: 3.5cm)[
    #image(paths.logo, width: 3.5cm)
  ]

  place(left + top, dx: 3cm, dy: 10cm)[
    #set text(size: 16pt, weight: "bold")
    #upper(essay)
  ]

  place(left + top, dx: 3cm, dy: 12cm)[
    #set text(size: 22pt, weight: "bold")
    #block(width: 15cm)[
      #set text(hyphenate: false)
      #title.id
    ]
  ]

  place(left + top, dx: 3cm, dy: 17cm)[
    #set text(size: 14pt, weight: "bold")
    #upper(author) \
    #upper(nrp)
  ]
  
  place(left + top, dx: 3cm, dy: 20cm)[
    #set text(size: 12pt)
    DOSEN PEMBIMBING \
    #supervisors.at(0).name \
    #supervisors.at(1).name
  ]

  place(left + top, dx: 3cm, dy: 22.5cm)[
    #set text(size: 11pt)
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
  set text(font: body-font, fill: black, weight: "regular", size: 11pt)

  align(center, text(size: 14pt, weight: "bold")[
    #upper("LEMBAR PENGESAHAN") \
    #upper("PROPOSAL TESIS")
  ])

  align(left, text(size: 12pt)[
    #v(1em)
    #table(
      columns: (2cm, 1fr),
      stroke: none,
      [Judul], [: #title.id],
      [Oleh], [: #author],
      [NRP], [: #nrp]
    )


    #v(1.5em)
    #align(center)[Telah diseminarkan pada,]

    Hari#tab-to(2cm, [Hari]): #dates.exam.day \
    Tanggal#tab-to(2cm, [Tanggal]): #dates.exam.date \
    Tempat#tab-to(2cm, [Tempat]): #dates.exam.place

    #v(1.5em)
    #align(center)[Mengetahui / menyetujui,]
  ])

  v(1em)
  set text(size: 12pt)

  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    align: left,
    [Dosen Penguji], [Dosen Pembimbing],
    [#image(examiners.at(0).sign, width: 3cm)],
    [#image(supervisors.at(0).sign, width: 3cm)],
    [#examiners.at(0).name],
    [#supervisors.at(0).name],
    [NIP: #examiners.at(0).nip],
    [NIP: #supervisors.at(0).nip],
    [#image(examiners.at(1).sign, width: 3cm)],
    [#image(supervisors.at(1).sign, width: 3cm)],
    [#examiners.at(1).name],
    [#supervisors.at(1).name],
    [NIP: #examiners.at(1).nip],
    [NIP: #supervisors.at(1).nip],
    [#image(examiners.at(2).sign, width: 3cm)],
    [],
    [#examiners.at(2).name],
    [],
    [NIP: #examiners.at(2).nip],
    [],
  )
}

//=============================================================================
// THESIS APPROVAL
//=============================================================================

#let render-thesis-approval(paths, program, author, nrp, sign, dates, supervisors, examiners, chief) = {
  set page(margin: standard-margin)
  set page(
    background: image(
      paths.validationBackground,
      width: 100%,
      height: 100%,
    ),
  )

  align(center)[
    #set text(size: 14pt, weight: "bold")
    #set par(leading: 0.6em)
    #upper("Lembar Pengesahan Tesis")

    #v(1em)
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

  set text(weight: "bold")
  set par(leading: 0.6em)
  grid(
    columns: (auto, 2fr, 1fr),
    gutter: 8pt,
    align: left,
    [1.], [#supervisors.at(0).name \ NIP: #supervisors.at(0).nip \ (Pembimbing 1)], [#image(supervisors.at(0).sign, width: 3cm)],
    [2.], [#supervisors.at(1).name \ NIP: #supervisors.at(1).nip \ (Pembimbing 2)], [#image(supervisors.at(1).sign, width: 3cm)],
    [3.], [#examiners.at(0).name \ NIP: #examiners.at(0).nip \ (Penguji 1)], [#image(examiners.at(0).sign, width: 3cm)],
    [4.], [#examiners.at(1).name \ NIP: #examiners.at(1).nip \ (Penguji 2)], [#image(examiners.at(1).sign, width: 3cm)],
    [5.], [#examiners.at(2).name \ NIP: #examiners.at(2).nip \ (Penguji 3)], [#image(examiners.at(2).sign, width: 3cm)],
  )

  v(1.5em)

  align(left)[
    Kepala #program.department \
    #v(0.3em)
    #box(
      [#set align(center)
      #image(chief.sign, width: 3cm)]
    ) \
    #v(0.3em)
    #underline(chief.name) \
    NIP: #chief.nip
  ]
}

//=============================================================================
// ORIGINALITY STATEMENT
//=============================================================================

#let render-originality(author, nrp, sign, supervisors, program, title, dates) = {
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
    Nama Mahasiswa (NRP) #tab-to(4.5cm, [Nama Mahasiswa (NRP)]): #author (#nrp) \
    Dosen Pembimbing 1 (NIP) #tab-to(4.5cm, [Dosen Pembimbing 1 (NIP)]): #supervisors.at(0).name (#supervisors.at(0).nip) \
    Dosen Pembimbing 2 (NIP) #tab-to(4.5cm, [Dosen Pembimbing 2 (NIP)]): #supervisors.at(1).name (#supervisors.at(1).nip) \
    Program Studi #tab-to(4.5cm, [Program Studi]): #program.degree #program.concentration \
    Departemen #tab-to(4.5cm, [Departemen]): #program.department \
    Fakultas #tab-to(4.5cm, [Fakultas]): #program.faculty
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
    #block()[
      #set text(size: 12pt)
      #set align(left)
      #set par(leading: 0.6em)
      #program.city, #dates.writing \
      #image(sign, width: 3cm)
      #author \
      NRP: #nrp
    ]
  ]

  v(1em)

  align(center)[Mengetahui,]

  grid(
    columns: (1fr, 1fr),
    gutter: 1cm,
    align: center,
    [#supervisors.at(0).name \ NIP: #supervisors.at(0).nip],
    [#supervisors.at(1).name \ NIP: #supervisors.at(1).nip],
    [#image(supervisors.at(0).sign, width: 3cm)], [#image(supervisors.at(1).sign, width: 3cm)],
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
  sign: none,
  supervisors: none,
  examiners: none,
  chief: none,
  dates: none,
  program: none,
  essay: none,
  title: none,
  paths: none,
  proposal: true,
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
    pagebreak(weak: true)
    set align(center)
    set text(size: 14pt, weight: "bold")
    block[
      #text[BAB #counter(heading).display("1")]
      \
      #text[#upper(it.body)]
    ]
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
  //? Table
  show figure.where(kind: table): it => context [
    #set text(size: 10pt)
    Tabel #counter(heading.where(level: 1)).display()#it.counter.display(it.numbering). #it.caption.body
    #it.body
  ]

  //? Image
  show figure.where(kind: image): it => context [
    #set text(size: 10pt)
    #it.body
    Gambar #counter(heading.where(level: 1)).display()#it.counter.display(it.numbering). #it.caption.body
  ]

  // ---- 4. COVER PAGE 1 (with background) ----
  render-cover-1(author, nrp, essay, title, paths, supervisors, program)
  pagebreak()

  // ---- 6. COVER PAGE 2 (no background) ----
  render-cover-2(author, nrp, essay, title, paths, supervisors, program)
  pagebreak()

  // ---- 5. BLANK PAGE ----
  set page(margin: standard-margin, background: none, numbering: none)
  set text(fill: black, font: body-font)


  if (proposal) {
    // ---- 7. PROPOSAL APPROVAL ----
    render-proposal-approval(title, author, nrp, dates, examiners, supervisors)
    pagebreak()
  } else {
    // ---- 8. THESIS APPROVAL ----
    render-thesis-approval(paths, program, author, nrp, sign, dates, supervisors, examiners, chief)
    pagebreak()

    // ---- 9. ORIGINALITY STATEMENT ----
    render-originality(author, nrp, sign, supervisors, program, title, dates)
    pagebreak()
  }


  // ---- 10. Reset to standard settings ----
  set page(margin: standard-margin, background: none)
  set text(font: body-font, size: 12pt, fill: black, weight: "regular")
  set par(first-line-indent: (amount: 1.5em, all: true))

  // ---- 11. Roman numbering for preliminary pages ----
  set page(numbering: "i")

  // ---- 12. User content (dedication, foreword, abstracts,    ----
  //         TOC, chapters, bibliography, appendices, biography).
  doc
}
