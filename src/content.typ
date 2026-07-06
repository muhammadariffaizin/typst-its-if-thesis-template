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
