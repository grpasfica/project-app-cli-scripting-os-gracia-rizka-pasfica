# 📝 Aplikasi Manajemen Keuangan Sederhana

Aplikasi ini adalah **mini project Bash Script** yang dibuat di Ubuntu/Linux.  
Fungsinya untuk **mengelola pemasukkan dan pengeluaran bulanan** dengan tampilan terminal yang rapi dan berwarna.

---

## ✨ Fitur Utama

### 1. Login Pengguna
- Username: `graciarp_`
- Password: `rahasia123`
- Pengguna memiliki 3 kesempatan login. Jika gagal 3x, program otomatis keluar.

### 2. Menu Pemasukkan
- Melihat daftar pemasukkan per bulan.
- Menambahkan atau mengubah data pemasukkan.
- Menghitung total pemasukkan semua bulan.
- Tampilan tabel menggunakan **warna kuning** untuk nilai pemasukkan.

### 3. Menu Pengeluaran
- Input jumlah item pengeluaran (saat ini hanya untuk bulan November).
- Menghitung total pengeluaran.
- Mengupdate saldo akhir bulan November.
- Tampilan angka menggunakan **warna magenta**.

### 4. Navigasi Menu
- Looping menu utama agar pengguna bisa memilih menu berkali-kali.
- Validasi input untuk angka dan pilihan menu.
- Konfirmasi keluar dari aplikasi.

---

## 🛠 Teknologi
- **Bahasa**: Bash Scripting  
- **Sistem Operasi**: Ubuntu/Linux  
- **File Script**: `app.sh`  
- **ANSI Escape Code**: digunakan untuk mempercantik output terminal (warna teks dan background).

---

## 🗂 Struktur Program

### 1. Global Variables
- `bulan` → array nama bulan  
- `pemasukkan` → array jumlah pemasukkan per bulan  
- Variabel warna: `CYAN`, `YELLOW`, `MAGENTA`, `RED`, `RESET`, dll.

### 2. Function
- `login(username, password)` → validasi login  
- `income()` → menu pemasukkan (lihat, input, total)  
- `outcome()` → menu pengeluaran (input item, total, update saldo)  

### 3. Looping dan Percabangan
- Menu utama menggunakan `while true` loop.  
- Validasi input menggunakan `if/elif/else` dan regex untuk angka.  
- Nested loop untuk konfirmasi lanjut atau keluar dari menu.

---

## 🚀 Cara Menjalankan

1. Pastikan menggunakan **Ubuntu/Linux**.  
2. Simpan file script dengan nama `app.sh`.  
3. Beri izin eksekusi pada file:
```bash
chmod +x app.sh
```
4. Jalankan script
```bash
/app.sh
```

---

## 🖥 Cara Menggunakan Aplikasi

Ikuti langkah-langkah berikut di terminal:

### 1. Login Terlebih Dahulu
- Masukkan **username** dan **password** sesuai akun terdaftar.  
- Jika salah, program memberikan **3 kesempatan maksimal** sebelum keluar.

---

### 2. Pilih Menu
Setelah login berhasil, pilih menu yang diinginkan:

1. **Pemasukkan** → lihat, input, atau hitung total pemasukkan.  
2. **Pengeluaran** → input data pengeluaran dan hitung saldo akhir.  
3. **Exit** → keluar dari aplikasi.

---

### 3. Input Data Sesuai Kebutuhan

- **Menu Pemasukkan**  
  - Lihat data pemasukkan, input data baru, atau hitung total pemasukkan.  

- **Menu Pengeluaran**  
  - Masukkan jumlah item pengeluaran dan nilai masing-masing item.

---

### 4. Keluar dari Aplikasi
- Pilih menu **Exit** di menu utama  
**atau**  
- Saat ditanya: *“Apakah ingin memilih menu kembali? (y/n)”*, pilih **n** untuk keluar.

---

## 💡 Catatan
- Pengeluaran saat ini hanya untuk bulan **November**, bisa dikembangkan untuk semua bulan.  
- Pastikan **input berupa angka** untuk menghindari error.  
- Data disimpan sementara di **array**; jika script dihentikan, data tidak tersimpan ke file.



