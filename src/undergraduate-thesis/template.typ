#import "@preview/icu-datetime:0.2.2" as icu

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
  top: 3.0cm,
  bottom: 2.5cm,
  inside: 3.0cm,
  outside: 2.0cm,
)
#let tz = (offset: "+07", iana: "Asia/Jakarta")

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

  place(left + top, dx: 3cm, dy: 14cm)[
    #set text(size: 14pt)
    #text(weight: "bold")[#upper(author)] \
    #upper(nrp)
  ]

  place(left + top, dx: 3cm, dy: 16cm)[
    #set text(size: 14pt)
    Dosen Pembimbing \
    #text(weight: "bold")[#supervisors.at(0).name] \
    NIP #supervisors.at(0).nip \
    #if supervisors.at(1) != none [
      \
      Dosen Ko-Pembimbing \
      #text(weight: "bold")[#supervisors.at(1).name] \
      NIP #supervisors.at(1).nip
    ]
  ]

  place(left + top, dx: 3cm, dy: 22.5cm)[
    #set text(size: 14pt, weight: "bold")
    Program Studi #program.degree #program.concentration \
    #set text(size: 12pt, weight: "regular")
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
    #upper(essay.id)
  ]

  place(left + top, dx: 3cm, dy: 9cm)[
    #set text(size: 22pt, weight: "bold")
    #block(width: 15cm)[
      #set text(hyphenate: false)
      #upper(title.id)
    ]
  ]

  place(left + top, dx: 3cm, dy: 15cm)[
    #set text(size: 14pt)
    #text(weight: "bold")[#upper(author)] \
    #upper(nrp)
  ]
  
  place(left + top, dx: 3cm, dy: 17cm)[
    #set text(size: 14pt)
    Dosen Pembimbing \
    #text(weight: "bold")[#supervisors.at(0).name] \
    NIP #supervisors.at(0).nip \
    #if supervisors.at(1) != none [
      \
      Dosen Ko-Pembimbing \
      #text(weight: "bold")[#supervisors.at(1).name] \
      NIP #supervisors.at(1).nip
    ]
  ]

  place(left + top, dx: 3cm, dy: 23.5cm)[
    #set text(size: 14pt, weight: "bold")
    Program Studi #program.degree #program.concentration \
    #set text(size: 12pt, weight: "regular")
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
    #set text(size: 14pt)
    #text(weight: "bold")[#upper(author)] \
    #upper(nrp)
  ]
  
  place(left + top, dx: 3cm, dy: 18cm)[
    #set text(size: 12pt)
    Advisor \
    #text(weight: "bold")[#supervisors.at(0).name] \
    NIP #supervisors.at(0).nip \
    #if supervisors.at(1) != none [
      \
      Co-Advisor \
      #text(weight: "bold")[#supervisors.at(1).name] \
      NIP #supervisors.at(1).nip
    ]
  ]

  place(left + top, dx: 3cm, dy: 23.5cm)[
    #set text(size: 14pt, weight: "bold")
    Undergraduate Study Program of #program.concentration \
    #set text(size: 12pt, weight: "regular")
    #program.department \
    #program.faculty \
    #program.university \
    #program.city \
    #str(program.year)
  ]
}

//=============================================================================
// PROPOSAL APPROVAL - ID
//=============================================================================

#let render-proposal-approval(title, author, nrp, dates, examiners, supervisors) = {
  set text(font: body-font, fill: black, weight: "regular", size: 11pt)

  heading(upper("Lembar Pengesahan"), numbering: none)
  align(center, text(size: 14pt, weight: "bold")[
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
// THESIS APPROVAL - ID
//=============================================================================

#let render-thesis-approval(title, program, author, nrp, sign, dates, supervisors, examiners, chief) = {
  set page(margin: standard-margin)

  heading(upper("Lembar Pengesahan"), numbering: none) 
  align(center)[
    #set text(size: 14pt)
    #set par(leading: 1em)

    #v(1em)
    #text(upper(title.id), weight: "bold", hyphenate: false) \
    \
    #text(upper("TUGAS AKHIR"), weight: "bold") \
    Diajukan untuk memenuhi salah satu syarat \
    memperoleh gelar #program.title pada \
    Program Studi #program.degree #program.concentration \
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
    [1.], [#supervisors.at(0).name], [Pembimbing],
    [2.], [#supervisors.at(1).name], [Ko-pembimbing],
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
// THESIS APPROVAL - EN
//=============================================================================

#let render-thesis-approval-en(title, program, author, nrp, sign, dates, supervisors, examiners, chief) = {
  set page(margin: standard-margin)

  heading(upper("Approval Sheet"), numbering: none)
  align(center)[
    #set text(size: 14pt)
    #set par(leading: 1em)

    #v(1em)
    #text(upper(title.en), weight: "bold", hyphenate: false) \
    \
    #text(upper("FINAL PROJECT"), weight: "bold") \
    Submitted to fulfill one of the requirements \
    for obtaining a #program.title degree at \
    Undergraduate Study Program of #program.concentration \
    #program.department \
    #program.faculty \
    #program.university
    #v(1em)
    By: #text(upper(author), weight: "bold") \
    NRP: #nrp

    #v(1em)
    Approved by Final Project Examiner Team:
    #v(1em)
  ]

  set par(leading: 0.6em)
  grid(
    columns: (auto, 2fr, 1fr),
    gutter: 3em,
    align: left,
    [1.], [#supervisors.at(0).name], [Advisor],
    [2.], [#supervisors.at(1).name], [Co-Advisor],
    [3.], [#examiners.at(0).name], [Examiner 1],
    [4.], [#examiners.at(1).name], [Examiner 2],
    [5.], [#examiners.at(2).name], [Examiner 3],
  )

  v(1.5em)

  align(center)[
    #set text(weight: "bold")
    #upper(program.city) \
    #dates.writingPeriod
  ]
}

//=============================================================================
// ORIGINALITY STATEMENT - ID
//=============================================================================

#let render-originality(author, nrp, sign, supervisors, program, title, dates) = {
  set page(margin: (
    top: 3.0cm,
    bottom: 2.5cm,
    left: 3.0cm,
    right: 2.0cm,
  ))
  set text(size: 11pt)

  heading(upper("Pernyataan Orisinalitas"), numbering: none)

  v(1.5em)
  [Yang bertanda tangan di bawah ini,]

  v(0.5em)
  [
    Nama Mahasiswa / NRP #tab-to(4.6cm, [Nama Mahasiswa / NRP]): #author / #nrp \
    Program Studi #tab-to(4.6cm, [Program Studi]): #program.degree #program.concentration \
    Dosen Pembimbing / NIP #tab-to(4.6cm, [Dosen Pembimbing / NIP]): #supervisors.at(0).name / #supervisors.at(0).nip \
    Dosen Ko-pembimbing / NIP #tab-to(4.6cm, [Dosen Ko-pembimbing / NIP]): #supervisors.at(1).name / #supervisors.at(1).nip \
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
      Mahasiswa \
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
    [Dosen Pembimbing],
    [Dosen Ko-pembimbing],
    [#image(supervisors.at(0).sign, width: 3cm)], [#image(supervisors.at(1).sign, width: 3cm)],
    [#supervisors.at(0).name \ NIP: #supervisors.at(0).nip],
    [#supervisors.at(1).name \ NIP: #supervisors.at(1).nip],
  )
}

//=============================================================================
// ORIGINALITY STATEMENT - EN
//=============================================================================

#let render-originality-en(author, nrp, sign, supervisors, program, title, dates) = {
  set page(margin: (
    top: 3.0cm,
    bottom: 2.5cm,
    left: 3.0cm,
    right: 2.0cm,
  ))
  set text(size: 11pt)

  heading(upper("Statement of Originality"), numbering: none)

  v(1.5em)
  [The undersigned,]

  v(0.5em)
  [
    Student Name / Student ID #tab-to(4.6cm, [Student Name / Student ID]): #author / #nrp \
    Study Program #tab-to(4.6cm, [Study Program]): #program.degree #program.concentration \
    Advisor / NIP #tab-to(4.6cm, [Advisor / NIP]): #supervisors.at(0).name / #supervisors.at(0).nip \
    Co-advisor / NIP #tab-to(4.6cm, [Co-advisor / NIP]): #supervisors.at(1).name / #supervisors.at(1).nip \
  ]

  v(0.5em)
  [
    hereby declares that the Final Project entitled
    "#title.id" is my own work, is original, and was written in accordance with the rules of scientific writing.
  ]

  v(0.5em)
  [
    If any discrepancies with this statement are found in the future, I am willing to accept sanctions in accordance with the provisions of #program.university (ITS).
  ]

  v(2em)

  align(center)[
    #block()[
      #set text(size: 12pt)
      #set align(center)
      #set par(leading: 0.6em)
      #program.city, #dates.writing \
      Student \
      #image(sign, width: 3cm)
      #author \
      NRP: #nrp
    ]
  ]

  v(1em)

  align(center)[Acknowledged,]

  grid(
    columns: (1fr, 1fr),
    gutter: 1cm,
    align: center,
    [Advisor],
    [Co-advisor],
    [#image(supervisors.at(0).sign, width: 3cm)], [#image(supervisors.at(1).sign, width: 3cm)],
    [#supervisors.at(0).name \ NIP: #supervisors.at(0).nip],
    [#supervisors.at(1).name \ NIP: #supervisors.at(1).nip],
  )
}

//=============================================================================
// AI CODE OF CONDUCT STATEMENT - ID
//=============================================================================

#let render-ai-code-of-conduct(author, nrp, program, title) = {
set page(margin: (
  top: 3.0cm,
  bottom: 2.5cm,
  left: 3.0cm,
  right: 2.0cm,
  ))
set text(size: 11pt)

align(center, text(size: 14pt)[
  #set par(leading: 0.6em)
  #heading("PERNYATAAN KODE ETIK PENGGUNAAN AI GENERATIF", numbering: none)
  #text(size: 8pt, style: "italic")[Code of Conduct Statement: Generative AI or AI-Assisted Usage]
])

v(1em)

[Saya yang bertanda tangan di bawah ini: \ ]
text(size: 8pt, style: "italic")[I, the undersigned:]

v(1em)

table(
  columns: (5cm, 1fr),
  stroke: none,
  align: top,
  [
    #set par(leading: 0.6em)
    Nama Mahasiswa / NRP \ 
    #text(size: 8pt, style: "italic")[Full Name / Student ID]
  ],
  [: #author / #nrp],
  [
    #set par(leading: 0.6em)
    Program Studi \ 
    #text(size: 8pt, style: "italic")[Study Program]
  ],
  [: #program.degree #program.concentration],
  [
    #set par(leading: 0.6em)
    Judul Tugas Akhir \ 
    #text(size: 8pt, style: "italic")[Final Project Title]
  ],
  [: #title.id]
)

text(size: 12pt)[
  #set par(leading: 0.6em)
  Dengan menyatakan bahwa pada Tugas Akhir dengan judul di atas tersebut: \
  #text(size: 8pt, style: "italic")[Hereby declare that in the Final Project with the above title:]
]

v(1em)

set text(size: 11pt)

set table(
  fill: (x, y) =>
    if y == 0 {
      gray.lighten(40%)
    },
)
block(
  table(
    columns: (1cm, 1fr, 1cm),
    align: (center, left, center),
    table.header(
      [*No.*], [
        #set align(center)
        #set par(leading: 0.6em)
        *Pernyataan* \ 
        #text(size: 8pt, style: "italic")[Statement]
      ], [*(✅)*],
    ),
    [1.], [Saya menggunakan AI generatif sebagai alat bantu untuk memperbaiki tata bahasa. AI generatif tidak digunakan untuk membuat isi Tugas Akhir. \ #text(size: 8pt, style: "italic")[I only used generative AI as a tool to improve the readability or language of the text in my Final Project. It was not used to generate a complete text of my work.]], [🔲],
    [2.], [Saya telah memeriksa dan/atau memperbaiki seluruh bagian dari Tugas Akhir saya yang dibantu oleh AI generatif agar sesuai dengan baku mutu penulisan karya ilmiah. \ #text(size: 8pt, style: "italic")[I have reviewed and refined all aspects of my work that generative AI assists with, ensuring it adheres to the standards of academic writing.]], [🔲],
    [3.], [Saya tidak menggunakan AI generatif untuk pembuatan data primer, grafik dan/atau tabel pada Tugas Akhir saya. \ #text(size: 8pt, style: "italic")[I did not use generative AI to generate primary data, figures, and/or tables in my work.]], [🔲],
    [4.], [Saya telah memberikan atribusi/pengakuan terhadap alat AI yang digunakan, pada suatu bagian pada lampiran. \ #text(size: 8pt, style: "italic")[I have acknowledged the use of generative AI in any part of the work in the specific appendix page.]], [🔲],
    [5.], [Saya memastikan tidak ada plagiarisme, termasuk hal yang berasal dari penggunaan AI generatif. \ #text(size: 8pt, style: "italic")[I have ensured that there is no plagiarism issue in the work, including any parts generated by AI.]], [🔲]
  )
)

v(1em)

align(right)[
  #block()[
    #set text(size: 12pt)
    #set align(center)
    #set par(leading: 0.6em)
    #program.city, #icu.fmt(datetime.today(), locale: "id", zone: tz, date-fields: "YMD") \
    Mahasiswa \
    \
    \
    \
    #author \
    NRP. #nrp
  ]
]
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
  set figure(kind: image, supplement: [Gambar], numbering: "1")

  // Force correct Indonesian supplement for table figures
  show figure.where(kind: table): set figure(supplement: [Tabel], numbering: "1")

  // ---- Override outline entry for figures ----
  // Show "Gambar 2.1" / "Tabel 3.1" in DAFTAR GAMBAR / DAFTAR TABEL
  show outline.entry: it => {
    let el = it.element
    if el != none and el.func() == figure {
      context {
        let loc = el.location()
        let h = counter(heading.where(level: 1)).at(loc).at(0)
        let f = el.counter.at(loc).at(0)
        let supp = if el.kind == table { [Tabel] } else { [Gambar] }
        link(loc, it.indented([#supp #h.#f], it.inner()))
      }
    } else if el != none and el.func() == heading and el.level == 1 {
      // For BAB chapters only: show "BAB 1. PENDAHULUAN"
      // Only numbered headings get the BAB prefix; front-matter and appendices use default.
      context {
        let is-numbered = el.numbering != none and el.numbering != ""
        let h = counter(heading.where(level: 1)).at(el.location()).at(0)
        let prefix = if is-numbered { [BAB #h.] } else { it.prefix() }
        link(el.location(), it.indented(prefix, it.inner()))
      }
    } else if el != none {
      link(el.location(), it.indented(it.prefix(), it.inner()))
    } else if it.target != none {
      link(it.target, it.indented([], it.inner()))
    } else {
      it.indented([], it.inner())
    }
  }

  // ---- In-text reference override for figures ----
  // Show @figure1 / @table1 as "Gambar 2.1" / "Tabel 3.1" with per-chapter numbering
  show ref: it => {
    let el = it.element
    if el == none or el.func() != figure { return it }
    context {
      let loc = el.location()
      let h = counter(heading.where(level: 1)).at(loc).at(0)
      let f = el.counter.at(loc).at(0)
      let supp = if el.kind == table { [Tabel] } else { [Gambar] }
      link(loc, [#supp #h.#f])
    }
  }

  // The rendering show rules for figures (below) already use "Tabel" / "Gambar"
  // ---- 2. Heading show-rules ----
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    set align(center)
    set text(size: 14pt, weight: "bold")
    // Reset figure counters to 0 at the start of each BAB chapter so that
    // figure numbering restarts per chapter. Only for numbered chapter
    // headings, not for front-matter headings like DAFTAR ISI / DAFTAR TABEL.
    if it.numbering != none {
      counter(figure.where(kind: image)).update(0)
      counter(figure.where(kind: table)).update(0)
    }
    block[
      #if it.numbering != none [
        BAB #counter(heading.where(level: 1)).display("1")
        \
      ]
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
    Tabel #counter(heading.where(level: 1)).display("1").#it.counter.display(it.numbering). #it.caption.body
    #it.body
  ]

  //? Image
  show figure.where(kind: image): it => context [
    #set text(size: 10pt)
    #it.body
    Gambar #counter(heading.where(level: 1)).display("1").#it.counter.display(it.numbering). #it.caption.body
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
  // start numbering from here
  counter(page).update(1)
  set page(margin: standard-margin, background: none, numbering: "i")
  set text(fill: black, font: body-font)
  set page(
    footer: context [
      #let p = counter(page).get().first()
      #align(
        if calc.rem(p, 2) == 1 { right } else { left },
        text(size: 11pt, font: body-font)[#counter(page).display()]
      )
    ]
  )

  if (proposal) {
    // ---- 7. PROPOSAL APPROVAL ----
    render-proposal-approval(title, author, nrp, dates, examiners, supervisors)
    // Add LEMBAR PENGESAHAN PROPOSAL to TOC as heading with no number
    pagebreak()
  } else {
    // ---- 8. THESIS APPROVAL ----
    render-thesis-approval(title, program, author, nrp, sign, dates, supervisors, examiners, chief)
    // Add LEMBAR PENGESAHAN to TOC as heading with no number
    pagebreak()
    render-thesis-approval-en(title, program-en, author, nrp, sign, dates, supervisors, examiners, chief)
    pagebreak()

    // ---- 9. ORIGINALITY STATEMENT ----
    render-originality(author, nrp, sign, supervisors, program, title, dates)
    pagebreak()
    render-originality-en(author, nrp, sign, supervisors, program-en, title, dates)
    pagebreak()

    // ---- 10. AI CODE OF CONDUCT ----
    render-ai-code-of-conduct(author, nrp, program, title)
    pagebreak()
  }


  // ---- 11. Reset to standard settings ----
  set page(margin: standard-margin, background: none)
  set text(font: body-font, size: 12pt, fill: black, weight: "regular")
  set par(first-line-indent: (amount: 1.5em, all: true))

  // ---- 12. Roman numbering for preliminary pages ----
  // ---- 13. User content (dedication, foreword, abstracts,    ----
  //         TOC, chapters, bibliography, appendices, biography).
  doc
}
