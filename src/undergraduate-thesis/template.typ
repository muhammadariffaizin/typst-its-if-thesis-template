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
  set text(fill: white, font: heading-font, fallback: true)

  place(left + top, dx: 3cm, dy: 6cm)[
    #set text(size: 16pt, weight: "bold")
    #upper(essay.id)
  ]

  place(left + top, dx: 3cm, dy: 8cm)[
    #set text(size: 22pt, weight: "bold")
    #block(width: 15cm)[
      #set text(hyphenate: false)
      #upper(title.id)
    ]
  ]

  place(left + top, dx: 3cm, dy: 15cm)[
    #set text(size: 14pt, weight: "bold")
    #upper(author) \
    #upper(nrp)
  ]

  place(left + top, dx: 3cm, dy: 18cm)[
    #set text(size: 12pt, weight: "bold")
    Dosen Pembimbing \
    #supervisors.at(0).name \
    #supervisors.at(1).name
  ]

  place(left + top, dx: 3cm, dy: 21cm)[
    #set text(size: 11pt, weight: "bold")
    Program Studi #program.concentration\
    #program.department \
    #program.faculty \
    #program.university \
    #program.city \
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

  place(left + top, dx: 3cm, dy: 7cm)[
    #set text(size: 16pt, weight: "bold")
    #upper(essay.en)
  ]

  place(left + top, dx: 3cm, dy: 9cm)[
    #set text(size: 22pt, weight: "bold")
    #block(width: 15cm)[
      #set text(hyphenate: false)
      #upper(title.id)
    ]
  ]

  place(left + top, dx: 3cm, dy: 15cm)[
    #set text(size: 14pt, weight: "bold")
    #upper(author) \
    #upper(nrp)
  ]
  
  place(left + top, dx: 3cm, dy: 18cm)[
    #set text(size: 12pt)
    Dosen Pembimbing \
    #supervisors.at(0).name \
    #supervisors.at(1).name
  ]

  place(left + top, dx: 3cm, dy: 22.5cm)[
    #set text(size: 11pt)
    Program Studi #program.concentration \
    #program.department \
    #program.faculty \
    #program.university \
    #program.city \
    #str(program.year)
  ]
}

//=============================================================================
// COVER PAGE 3 - EN  (no background)
//=============================================================================

#let render-cover-3(author, nrp, essay, title, paths, supervisors, program) = {
  set page(numbering: none, margin: 0cm)
  set page(
    background: image(
      paths.coverBackgroundSecondary,
      width: 100%,
      height: 100%,
    ),
  )
  set text(font: heading-font, fallback: true)

  place(left + top, dx: 3cm, dy: 7cm)[
    #set text(size: 16pt, weight: "bold")
    #upper(essay.en)
  ]

  place(left + top, dx: 3cm, dy: 9cm)[
    #set text(size: 22pt, weight: "bold")
    #block(width: 15cm)[
      #set text(hyphenate: false)
      #upper(title.en)
    ]
  ]

  place(left + top, dx: 3cm, dy: 15cm)[
    #set text(size: 14pt, weight: "bold")
    #upper(author) \
    #upper(nrp)
  ]
  
  place(left + top, dx: 3cm, dy: 18cm)[
    #set text(size: 12pt)
    Advisor \
    #supervisors.at(0).name \
    #supervisors.at(1).name
  ]

  place(left + top, dx: 3cm, dy: 22.5cm)[
    #set text(size: 11pt)
    Study Program #program.concentration \
    #program.department \
    #program.faculty \
    #program.university \
    #program.city \
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
    #upper("PROPOSAL TUGAS AKHIR")
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

#let render-thesis-approval(title, program, author, nrp, sign, dates, supervisors, examiners, chief) = {
  set page(margin: standard-margin)

  align(center)[
    #set text(size: 14pt)
    #set par(leading: 1em)
    #text(upper("Lembar Pengesahan"), weight: "bold") \

    #v(1em)
    #text(upper(title.id), weight: "bold") \
    \
    #text(upper("TUGAS AKHIR"), weight: "bold") \
    Diajukan untuk memenuhi salah satu syarat \
    memperoleh gelar #program.title \
    pada Program Studi #program.degree #program.concentration \
    #program.department \
    #program.faculty \
    #program.university
    #v(1em)
    Oleh: #text(upper(author), weight: "bold") \
    NRP: #nrp

    #v(1em)
    Disetujui oleh Tim Penguji Tugas Akhir:
    #v(1em)
  ]

  set par(leading: 0.6em)
  grid(
    columns: (auto, 2fr, 1fr),
    gutter: 3em,
    align: left,
    [1.], [#supervisors.at(0).name], [Pembimbing 1],
    [2.], [#supervisors.at(1).name], [Pembimbing 2],
    [3.], [#examiners.at(0).name], [Penguji 1],
    [4.], [#examiners.at(1).name], [Penguji 2],
    [5.], [#examiners.at(2).name], [Penguji 3],
  )

  v(1.5em)

  align(center)[
    #set text(weight: "bold")
    #upper(program.city) \
    #dates.writingPeriod
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
    #upper("PERNYATAAN ORISINALITAS")
  ])

  v(1.5em)
  [Yang bertanda tangan di bawah ini,]

  v(0.5em)
  [
    Nama Mahasiswa (NRP) #tab-to(4.5cm, [Nama Mahasiswa (NRP)]): #author (#nrp) \
    Program Studi #tab-to(4.5cm, [Program Studi]): #program.concentration \
    Dosen Pembimbing 1 (NIP) #tab-to(4.5cm, [Dosen Pembimbing 1 (NIP)]): #supervisors.at(0).name (#supervisors.at(0).nip) \
    Dosen Pembimbing 2 (NIP) #tab-to(4.5cm, [Dosen Pembimbing 2 (NIP)]): #supervisors.at(1).name (#supervisors.at(1).nip) \
  ]

  v(0.5em)
  [
    Dengan ini menyatakan bahwa Tugas Akhir yang berjudul
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

  align(center)[
    #block()[
      #set text(size: 12pt)
      #set align(center)
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
    [#supervisors.at(0).name],
    [#supervisors.at(1).name],
    [#image(supervisors.at(0).sign, width: 3cm)], [#image(supervisors.at(1).sign, width: 3cm)],
    [Dosen Pembimbing 1 \ NIP: #supervisors.at(0).nip],
    [Dosen Pembimbing 2 \ NIP: #supervisors.at(1).nip],
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
  program-en: none,
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

  // ---- 6. COVER PAGE 3 - EN (no background) ----
  render-cover-3(author, nrp, essay, title, paths, supervisors, program-en)
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
    render-thesis-approval(title, program, author, nrp, sign, dates, supervisors, examiners, chief)
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
