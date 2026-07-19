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
#let sign = "resources/fake-sign.svg"

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
#let chief = (name: "Nama Kepala Departemen Informatika", nip: "20xxxxxxxx", sign: "resources/fake-sign.svg")

// --- Dates ---
#let dates = (
  writing: "27 Juni 2026",
  exam: (day: "Rabu", date: "10 Juli 2026", place: "Ruang 217B"),
  writingPeriod: "September 2026",
)

// --- Academic Program ---
#let program = (
  title: "Sarjana Komputer (S.Kom.)",
  degree: "S-1",
  concentration: "Teknik Informatika",
  department: "Departemen Teknik Informatika",
  faculty: "Fakultas Teknologi Elektro dan Informatika Cerdas",
  university: "Institut Teknologi Sepuluh Nopember",
  city: "Surabaya",
  year: 2026,
)

// --- Academic Program (English) ---
#let program-en = (
  title: "Bachelor of Computer Science (B.Comp.Sc.)",
  degree: "S1",
  concentration: "Informatics",
  department: "Department of Informatics",
  faculty: "Faculty of Intelligent Electrical and Informatics Technology",
  university: "Institut Teknologi Sepuluh Nopember",
  city: "Surabaya",
  year: 2026,
)

// --- Essay Code ---
#let essay = (
  id: "Tugas Akhir - EF234801",
  en: "Final Project - EF234801"
)

// --- Thesis Titles ---
// Judul tugas akhir ditulis singkat, jelas, dan menggambarkan tema pokok
#let title = (
  id: "Tugas Akhir Mahasiswa Departemen Teknik Informatika Institut Teknologi Sepuluh Nopember (dalam Bahasa Indonesia)",
  en: "Undergraduate Student Thesis of the Department of Informatics, Institut Teknologi Sepuluh Nopember (in English)",
)

// --- Resource Paths (relative to src/) ---
#let paths = (
  logo: "resources/its-logo.png",
  coverBackground: "resources/its-thesis-cover-without-logo.svg",
  coverBackgroundSecondary: "resources/its-thesis-cover-without-logo-2.svg",
  bibliography: "bibliography.bib",
)

// HELPER
#let tab-to(target-width, body) = context {
  let current-width = measure(body).width
  if current-width < target-width {
    h(target-width - current-width)
  } else {
    h(0pt)
  }
}

//=============================================================================
// TEMPLATE SETUP
// Each config variable is passed directly as a named argument to the
// template — no `cfg` wrapper needed. Use them directly in your content.
//=============================================================================

#import "template.typ": thesis

#show: thesis.with(
  author: author,
  nrp: nrp,
  sign: sign,
  supervisors: supervisors,
  examiners: examiners,
  chief: chief,
  dates: dates,
  program: program,
  program-en: program-en,
  essay: essay,
  title: title,
  paths: paths,
  proposal: false, // true or false
)

// Indonesian citation formatting replace "et al." with "dkk"
#show "et al.": "dkk"
// Replace " & " with " dan " for Indonesian convention
#show " & ": " dan "

//=============================================================================
// 1. HALAMAN PERSEMBAHAN
//=============================================================================

#heading("HALAMAN PERSEMBAHAN", numbering: none)

#v(1em)
#align(left)[
  Dengan penuh rasa syukur, dengan telah diselesaikannya Tesis ini, Penulis mempersembahkannya kepada: \
  + istriku tercinta, anak-anakku tersayang, dan kedua orang tuaku yang selalu mendukungku dan mendoakanku. 
  + #lorem(50)
  + #lorem(50)
  + #lorem(50)
  + #lorem(50)
  + #lorem(50)
  + #lorem(50)
]

#pagebreak()

//=============================================================================
// 2. ABSTRAK
//=============================================================================

#heading("ABSTRAK", numbering: none)

// Typst 0.13+ doesn't support par(indent: ...)
// For abstracts, we can leave paragraphs without indent or use #par.leading

#v(1em)
#align(center, text(size: 12pt, weight: "bold")[
  #upper(title.id)
])

#v(1em)
#par(first-line-indent: 0pt)[
  Nama Mahasiswa / NRP #tab-to(4.4cm, [Nama Mahasiswa / NRP]): #author / #nrp \
  Departemen #tab-to(4.4cm, [Departemen]): #program.department \
  Dosen Pembimbing #tab-to(4.4cm, [Dosen Pembimbing]): #supervisors.at(0).name \
  Dosen Ko-pembimbing #tab-to(4.4cm, [Dosen Ko-pembimbing]): #supervisors.at(1).name
]

#v(2em)
#block(align(left, text(size: 13pt, weight: "bold")[Abstrak]))

#v(1em)
Tulis abstrak bahasa Indonesia di sini. #lorem(220)

#v(1em)
#par(first-line-indent: 0pt)[
  #text(weight: "bold")[Kata Kunci:] Pertama, Kedua, Ketiga, Keempat, Kelima.
]

#pagebreak()

//=============================================================================
// 3. ABSTRACT
//=============================================================================

#heading("ABSTRACT", numbering: none)

#v(1em)
#align(center, text(size: 12pt, weight: "bold")[
  #upper(title.en)
])

#v(1em)
#par(first-line-indent: 0pt)[
  Student Name / NRP #tab-to(4.3cm, [Student Name / NRP]): #author / #nrp \
  Department #tab-to(4.3cm, [Department]): #program-en.department \
  Advisor #tab-to(4.3cm, [Advisor]): #supervisors.at(0).name \
  Co-Advisor #tab-to(4.3cm, [Co-Advisor]): #supervisors.at(1).name
]

#v(2em)
#block(align(left, text(size: 13pt, weight: "bold")[Abstract]))

#v(1em)
Write your English abstract here. #lorem(220)

#v(1em)
#par(first-line-indent: 0pt)[
  #text(weight: "bold")[Keywords:] First, Second, Third, Fourth, Fifth.
]

#pagebreak()

//=============================================================================
// 4. KATA PENGANTAR
//=============================================================================

#heading("KATA PENGANTAR", numbering: none)

// Typst 0.13+ removed par(indent: ...)
// Use explicit first-line indentation if needed: #indent[content]

#v(1.5em)

*Assalamu'alaikum warahmatullahi wabarakatuh.*

Puji dan syukur ke hadirat Allah SWT atas segala limpahan nikmat dan
rahmat-Nya sehingga penulis dapat menyelesaikan Tugas Akhir ini dengan judul "#title.id" sebagai salah satu syarat
untuk memperoleh gelar #program.title di #program.department, #program.university.

Penulisan Tugas Akhir ini tidak akan terlaksana dengan baik tanpa bimbingan, dukungan, dan motivasi dari berbagai pihak. Oleh karena itu, penulis ingin menyampaikan ucapan terima kasih yang sebesar-besarnya kepada:

+ *Bapak/Ibu Dosen Pembimbing 1* dan *Bapak/Ibu Dosen Pembimbing 2* atas bimbingan, saran, serta kesabaran dalam mengarahkan penulis selama proses penyusunan Tugas Akhir ini.
+ *Bapak/Ibu Penguji Sidang* yang telah memberikan masukan, kritik, dan saran konstruktif demi perbaikan karya ini.
+ Seluruh *partisipan penguji aplikasi* yang telah meluangkan waktu dan memberikan feedback berharga untuk pengembangan sistem ini.
+ Keluarga, teman-teman, dan rekan-rekan seperjuangan yang selalu memberikan dukungan moral dan semangat kepada penulis.
+ #lorem(30)

Penulis sangat menyadari bahwa penulisan Tugas Akhir ini masih jauh dari sempurna, oleh karena itu penulis mengharapkan kritik dan saran yang membangun untuk perbaikan di masa mendatang. Semoga hasil penelitian ini dapat bermanfaat bagi perkembangan ilmu pengetahuan dan teknologi.

Akhir kata, penulis mengharapkan semoga hasil dari penulisan dan penelitian
ini dapat memberikan informasi yang bermanfaat bagi para pembaca.

*Wassalamu'alaikum warahmatullahi wabarakatuh.*

#v(2em)
#align(right)[
  Surabaya, #dates.writingPeriod \
  \
  \
  \
  Penulis
]

#pagebreak()

//=============================================================================
// 5. DAFTAR ISI
//=============================================================================

#heading("DAFTAR ISI", numbering: none)

#outline(
  title: none,
  indent: auto,
  depth: 3,
)

#pagebreak()

//=============================================================================
// 6. DAFTAR TABEL
//=============================================================================

#heading("DAFTAR TABEL", numbering: none)

#outline(
  title: none,
  target: figure.where(kind: table),
)

#pagebreak()

//=============================================================================
// 7. DAFTAR GAMBAR
//=============================================================================

#heading("DAFTAR GAMBAR", numbering: none)

#outline(
  title: none,
  target: figure.where(kind: image),
)

#pagebreak()

#include "content.typ"

// Ensure back matter uses Arabic page numbering
#set page(numbering: "1")

//=============================================================================
// DAFTAR PUSTAKA
//=============================================================================

#heading("DAFTAR PUSTAKA", numbering: none)

#bibliography(
  "bibliography.bib",
  title: none,
  style: "apa",
  full: false,
)

#pagebreak()

//=============================================================================
// LAMPIRAN
//=============================================================================

#heading(upper("Lampiran A. Instrumen Pengujian"), numbering: none)

Isi lampiran A di sini #lorem(100)

#pagebreak()

#heading(upper("Lampiran B. Rincian Kasus Uji"), numbering: none)

Ini lampiran B di sini #lorem(100) @table2

#figure(
  kind: table,
  table(
    columns: (auto, auto, auto),
    align: (center, left, center),
    [No.], [Kasus], [Hasil],
    [1], [Kasus A #lorem(20)], [Lulus],
    [2], [Kasus B #lorem(20)], [Lulus],
    [3], [Kasus C #lorem(20)], [Gagal],
  ),
  caption: [Tabel contoh rincian kasus uji],
) <table2>

#pagebreak()

#heading(upper("Lampiran C. Penjelasan Hasil"), numbering: none)

Isi lampiran C disini. (This next paragraph is come from @fiatshamir1987howtoprove as an example) Before center starts issuing cards, it chooses and makes public modulus $n$ and pseudo random function $f$ which maps arbitrary strings to range $[0, n)$. Modulus $n$ is product of two secret primes $p$ and $q$, but unlike the RSA scheme, only center knows factorization of modulus and thus everyone can use same $n$. Function $f$ should be indistinguishable from truly random function by any polynomially bounded computation. Goldreich, Goldwasser, and Micali [1984] describe particular family of functions which is provably strong in this sense, but we believe that in practice one can use simpler and faster functions (e.g., multiple DES) without endangering security of scheme.

When eligible user applies for smart card, center prepares string $I$ which contains all relevant information about user (his name, address, ID number, physical description, security clearance etc.) and about the card (expiration date, limitations on validity, etc). Since this is information verified by scheme, make it detailed and to double check its correctness. Center then performs following steps:

#set list(marker: "1.")
1. Compute values $u_j = f(I, j)$ for small values of $j$.
2. Pick $k$ distinct values of $j$ for which $u_j$ is quadratic residue modulo $n$ and compute the smallest square root $s_j$ of $u_j$ (mod $n$).
3. Issue smart card which contains $I$, $k$ values $s_j$, and their indices.

#text(weight: "bold")[Remarks:]

#set list(marker: "a.")
a. To simplify notation in rest of this paper, we assume that first $k$ indices $j = 1, 2, ..., k$ are used.
b. For non-perfect functions $f$, it may be advisable to randomize $I$ by concatenating it to long random string $R$ which is chosen by center, stored in card, and revealed along with $I$.

In typical implementations, $k$ is between 1 and 18, but larger values of $k$ can further reduce time and communication complexities of scheme. $n$ should be at least 512 bits long. Factoring such moduli seems to be beyond reach with today's computers and algorithms, with adequate margins of safety against foreseeable developments.

Center can be eliminated if each user chooses his own $n$ and publishes it in public key directory. However, this RSA-like variant makes schemes considerably less convenient.

Verification devices are identical standalone devices which contain microprocessor, small memory, and I/O interface. Only information stored in them are universal modulus $n$ and function $f$. When smart card is inserted into verifier, it proves that it knows $s_1, ..., s_k$ without giving away any information about their values. Proof is based on following protocol:

#set list(marker: "1.")
1. $A$ sends $I$ to $B$.
2. $B$ generates $u_j = f(I, j)$ for $j = 1, ..., k$.
3. Repeat steps 3 to 6 for $i = 1, ..., t$:
   a. $A$ picks random $r_i \in [0, n)$ and sends $z_i = r_i^2$ (mod $n$) to $B$.
   b. $B$ sends random binary vector $(e_{i_1}, ..., e_{i_k})$ to $A$.
   c. $A$ sends to $B$: $y_i = r_i (p r o d)_{j=1}^k s_j^{e_{i_j}}$ (mod $n$).
   d. $B$ checks that $z_i = y_i^2 (p r o d)_{j=1}^k u_j^{e_{i_j}}$ (mod $n$).

#text(weight: "bold")[Remarks:]

#set list(marker: "1.")
1. Verifier $B$ accepts $A$'s proof of identity only if all $t$ checks are successful.
2. To decrease number of communicated bits, can hash $z_i$ by sending $B$ only first 128 bits of $f(z_i)$ in step 3. $B$ can check correctness of this value in step 6 by applying $f$ to right hand side of equation and comparing the first 128 bits of results.
3. Can authenticate particular message $m$ (e.g., instruction to remote control system or program sent to remote computer) without having to extract new square roots by sending $B$ first 128 bits of $f(m, z_i)$ in step 3. If $B$ knows $m$, he can easily check this value in step 6. $A$ is fully protected against modifications and forgeries of his messages by pseudo random nature of $f$, but this is not real signature scheme: without participating in interaction, judge cannot later decide if message is authentic.

#pagebreak()

//=============================================================================
// BIOGRAFI PENULIS
//=============================================================================

#heading("BIOGRAFI PENULIS", numbering: none)

#grid(
  columns: (1fr, 2fr), 
  column-gutter: 1em,
  block()[
    #image("resources/profile-picture.jpg"),
  ],
  [Tulis biografi penulis di sini. #lorem(70)]
)
#block(
  inset: (left: 0em, top: -1.5em),
  lorem(50)
)
