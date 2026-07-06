//=============================================================================
// ITS Informatics Department Thesis (Typst)
//
// This is your main entry point. Edit the content below and
// customize src/config.yaml for your thesis metadata.
//
// Department of Informatics
// Faculty of Intelligent Electrical and Informatics Technology
// Institut Teknologi Sepuluh Nopember (ITS)
// Surabaya, Indonesia
//=============================================================================

#import "template.typ": thesis

#show: thesis.with(cfg: yaml("config.yaml"))

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
  TESIS MAHASISWA DEPARTEMEN TEKNIK INFORMATIKA INSTITUT TEKNOLOGI \
  SEPULUH NOPEMBER (DALAM BAHASA INDONESIA)
])

#v(1em)
Nama Mahasiswa / NRP ... \
Pembimbing 1: ... \
Pembimbing 2: ...

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
  POSTGRADUATE STUDENT THESIS OF INFORMATICS DEPARTMENT \
  OF SEPULUH NOPEMBER INSTITUTE OF TECHNOLOGY (IN ENGLISH)
])

#v(1em)
Student Name / NRP ... \
Supervisor 1: ... \
Supervisor 2: ...

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

//=============================================================================
// MAIN CHAPTERS  (resume arabic page numbering)
//=============================================================================

#counter("page").update(1)
#set page(numbering: "1")

// ---------------------------------------------------------------------------
// CHAPTER 1 — PENDAHULUAN
// ---------------------------------------------------------------------------

= PENDAHULUAN

Pada bab ini dijelaskan mengenai beberapa hal dasar dalam penelitian dan
penulisan laporan tesis.

== Latar Belakang

Pada bagian ini, penulis menjelaskan latar belakang penelitian yang dilakukan.

== Rumusan Masalah

Berdasarkan latar belakang di atas, maka rumusan masalah yang akan dibahas
di dalam penelitian ini adalah sebagai berikut:

+ Pertanyaan ke-1 ?
+ Pertanyaan ke-2 ?
+ Pertanyaan ke-3 ?

== Tujuan Penelitian

Tujuan dari penelitian ini adalah ...

== Batasan Penelitian

Untuk memfokuskan permasalahan di dalam penelitian ini, terdapat beberapa
batasan masalah yang digunakan:

+ Batasan Penelitian ke-1.
+ Batasan Penelitian ke-2.

== Manfaat Penelitian

Manfaat yang diharapkan dari penelitian ini adalah ...

== Kontribusi Penelitian

+ Kontribusi Penelitian ke-1.
+ Kontribusi Penelitian ke-2.

// ---------------------------------------------------------------------------
// CHAPTER 2 — TINJAUAN PUSTAKA
// ---------------------------------------------------------------------------

= TINJAUAN PUSTAKA

Pada bab ini dijelaskan mengenai teori-teori yang mendasari penelitian ini.

== Teori Dasar

Penjelasan mengenai teori dasar yang digunakan dalam penelitian.

== Penelitian Terkait

#figure(
  image("resources/chapter-2-power-digital-finance.png", width: 80%),
  caption: [Gambar yang menunjukkan ilustrasi terkait penelitian],
)

// ---------------------------------------------------------------------------
// CHAPTER 3 — METODOLOGI PENELITIAN
// ---------------------------------------------------------------------------

= METODOLOGI PENELITIAN

Pada bab ini dijelaskan mengenai metodologi penelitian yang digunakan.

== Tahapan Penelitian

1. Tahap pertama ...
2. Tahap kedua ...
3. Tahap ketiga ...

== Alat dan Bahan

=== Perangkat Keras

+ Prosesor: ...
+ Memori: ...

=== Perangkat Lunak

+ Sistem Operasi: ...
+ Framework: ...

== Metode yang Diusulkan

#figure(
  table(
    columns: (auto, auto, auto),
    [No.], [Parameter], [Nilai],
    [1], [Parameter A], [Nilai A],
    [2], [Parameter B], [Nilai B],
    [3], [Parameter C], [Nilai C],
  ),
  caption: [Tabel contoh parameter penelitian],
)

// ---------------------------------------------------------------------------
// CHAPTER 4 — HASIL DAN PEMBAHASAN
// ---------------------------------------------------------------------------

= HASIL DAN PEMBAHASAN

Pada bab ini dijelaskan mengenai hasil yang diperoleh dari penelitian.

== Hasil Penelitian

=== Hasil Pengujian Skenario 1

Penjelasan hasil pengujian skenario pertama.

=== Hasil Pengujian Skenario 2

Penjelasan hasil pengujian skenario kedua.

```python
def contoh_fungsi(x):
    return x * 2
```

// ---------------------------------------------------------------------------
// CHAPTER 5 — PENUTUP
// ---------------------------------------------------------------------------

= PENUTUP

Pada bab ini dijelaskan mengenai kesimpulan dari penelitian.

== Kesimpulan

+ Kesimpulan pertama ...
+ Kesimpulan kedua ...
+ Kesimpulan ketiga ...

== Saran

+ Saran pertama ...
+ Saran kedua ...

#pagebreak()

//=============================================================================
// BIBLIOGRAPHY
//=============================================================================

#set heading(numbering: none)
#bibliography(
  "bibliography.bib",
  title: [#align(center, text(size: 14pt, weight: "bold")[#upper("DAFTAR PUSTAKA")])],
  style: "apa",
  full: true,
)

#pagebreak()

//=============================================================================
// APPENDICES
//=============================================================================

#set heading(numbering: "A.")

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
