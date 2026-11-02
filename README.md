# Tubes-BASDA-Sistem-Manajemen-Hotel

# SISTEM MANAJEMEN HOTEL

Repository ini merupakan dokumentasi dan implementasi tugas kelompok mata kuliah **Praktikum Basis Data**. Proyek ini membahas perancangan dan penerapan database untuk Sistem Manajemen Hotel menggunakan SQL.

Database dirancang untuk mengelola data tamu, kamar, tipe kamar, pegawai, reservasi, detail reservasi, dan pembayaran secara terstruktur.

## 👥 Identitas Kelompok

**Disusun Oleh Kelompok 1:**

1. Syafira Syifa Arianita (G1A025006)
2. Athaya Ashalina Marpaung (G1A025008)
3. Ahmad Najib Ramadhan (G1A025022)
4. Keysa Angel Anandita (G1A025024)
5. Arief Efendi (G1A025042)

## 📌 Deskripsi Proyek

Sistem Manajemen Hotel merupakan rancangan database yang digunakan untuk membantu pengelolaan operasional hotel, khususnya dalam pencatatan data tamu, informasi kamar, proses reservasi, serta transaksi pembayaran.

Database ini dibuat untuk menerapkan berbagai konsep dan perintah SQL yang telah dipelajari dalam praktikum basis data.

## 🗄️ Struktur Database

Nama database:

`db_manajemen_hotel`

Database ini terdiri dari 7 tabel utama:

| No. | Nama Tabel | Keterangan |
|---|---|---|
| 1 | tamu | Menyimpan data tamu hotel |
| 2 | tipe_kamar | Menyimpan informasi tipe dan harga kamar |
| 3 | kamar | Menyimpan data dan status kamar |
| 4 | pegawai | Menyimpan data pegawai hotel |
| 5 | reservasi | Menyimpan data pemesanan kamar |
| 6 | detail_reservasi | Menyimpan rincian kamar dalam reservasi |
| 7 | pembayaran | Menyimpan transaksi pembayaran reservasi |

## ⚙️ Fitur dan Materi SQL

Beberapa materi SQL yang diterapkan dalam proyek ini meliputi:

- **DDL (Data Definition Language):** Pembuatan database dan tabel menggunakan `CREATE DATABASE` dan `CREATE TABLE`.
- **DML (Data Manipulation Language):** Penambahan data menggunakan `INSERT INTO`.
- **JOIN:** Menggabungkan beberapa tabel untuk menampilkan informasi reservasi dan pembayaran.
- **Alias dan Operator SQL:** Menggunakan `AS`, `AND`, `OR`, `LIKE`, dan `BETWEEN`.
- **Aggregate Function:** Menggunakan `COUNT()`, `SUM()`, dan `AVG()`.
- **Grouping dan Sorting:** Menggunakan `GROUP BY` dan `ORDER BY`.
- **VIEW:** Membuat tampilan data reservasi melalui `CREATE VIEW`.
- **Stored Procedure:** Membuat prosedur untuk proses reservasi dan laporan pendapatan.
- **Nested Query:** Menggunakan subquery untuk melakukan pencarian data berdasarkan kondisi tertentu.
- **TRIGGER:** Membuat validasi ketersediaan kamar dan pembaruan status reservasi berdasarkan pembayaran.
- **DCL (Data Control Language):** Mengatur hak akses pengguna database menggunakan `CREATE USER`, `GRANT`, dan `REVOKE`.

## 🚀 Cara Menjalankan Database

1. Pastikan MySQL atau MariaDB sudah terpasang pada komputer.
2. Buka aplikasi pengelola database, seperti MySQL Workbench, phpMyAdmin, atau HeidiSQL.
3. Buka file `TUBES_PBASDA.sql`.
4. Jalankan seluruh perintah SQL untuk membuat database beserta tabel dan data awal.
5. Pastikan database `db_manajemen_hotel` berhasil dibuat.
6. Jalankan query yang tersedia untuk melihat hasil implementasi setiap materi SQL.

## 📂 File Repository

| Nama File | Keterangan |
|---|---|
| `TUBES_PBASDA.sql` | File utama yang berisi seluruh perintah SQL untuk pembuatan database, tabel, data awal, query, view, stored procedure, trigger, dan pengaturan hak akses. |
| `README.md` | Dokumentasi proyek dan panduan penggunaan repository. |

## 🎯 Tujuan Proyek

Proyek ini bertujuan untuk memahami penerapan konsep basis data relasional serta meningkatkan kemampuan dalam menggunakan perintah SQL untuk membangun dan mengelola sebuah database, khususnya pada studi kasus Sistem Manajemen Hotel.

## 📝 Penutup

Melalui proyek ini, diharapkan seluruh anggota kelompok dapat memahami proses perancangan database, hubungan antarentitas, pengolahan data, serta penerapan berbagai fitur SQL dalam mendukung pengelolaan sistem informasi.

---

**Kelompok 1 – Praktikum Basis Data**
