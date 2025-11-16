#!/bin/bash

: << 'WARNA'
Berikut ini adalah beberapa pilihan warna yang sudah disimpan ke dalam variabel untuk mempercantik tampilan:
- CYAN untuk warna foreground cyan dengan kode warna 36
- RESET untuk warna default terminal dengan kode warna 0
- BG_WHITE untuk warna background putih dengan kode warna 47
WARNA

# Global variable untuk warna
CYAN="\033[36m"
RESET="\033[0m"
RED="\033[31m"
BLACK="\033[30m"
YELLOW="\033[33m"
MAGENTA="\033[35m"
GREEN="\033[32m"

# Global variable (array) untuk data pemasukkan dan pengeluaran
bulan=(januari februari maret april mei juni juli agustus september oktober november desember)
pemasukkan=(1500000 3000000 5000000 1000000 2500000 6500000 4000000 1000000 2000000 3000000 0 0)

# Function login dengan parameter username dan password
login(){
  # Local variable
  local username=$username
  local password=$password

  # Kondisi jika username dan password bernilai benar
  if [[ "$username" = "graciarp_" && "$password" = "rahasia123" ]]; then
    echo -e "\nSelamat Datang, ${CYAN}$username ${RESET}!"
    # Mengembalikan nilai benar
    return 0

  # Kondisi jika salah satu (username / password) bernilai salah
  else
    echo -e "${RED}\nUsername atau Password yang Anda masukkan salah !"
    echo -e "Silakan coba lagi.${RESET}"
    # Mengembalikan nilai salah
    return 1
  fi
}

# Function Pemasukkan
income(){
  # Looping menu pemasukkan
  while true; do
    echo -e "${YELLOW}\n  === MENU PEMASUKKAN ===${RESET}\n"
    echo "  1. Lihat Data Pemasukkan"
    echo "  2. Input Data Pemasukkan"
    echo "  3. Total Data Pemasukkan"
    echo "  4. Kembali ke Menu Utama"
    
    # inputkan pilihan menu
    echo -ne "\n  Pilih Menu(1-4): "
    read menu_pemasukkan
    
    # Kondisi jika memilih menu 1
    if [[ "$menu_pemasukkan" = 1 ]]; then
      # Menampilkan semua data yang tersimpan pada array
      echo -e "\n  DATA PEMASUKKAN TAHUN 2025"

      # Menampilkan teks dengan format tertentu (tabel sederhana)
      printf "  %-10s ${YELLOW} | ${RESET}%-17s\n" "Bulan" "Pemasukkan"

      # Looping untuk menampilkan data
      for ((i=0; i<${#bulan[@]}; i++)); do
          # Menampilkan data dengan bentuk tabel sederhana
          printf "  %-10s${RESET} ${YELLOW} | ${RESET}%-17s\n" "${bulan[i]}" "${pemasukkan[i]}"
      done

    # Kondisi jika memilih menu 2
    elif [[ "$menu_pemasukkan" = 2 ]]; then
      echo -e "\n${YELLOW}  INPUT DATA PEMASUKKAN${RESET}"

      # inputkan pilihan bulan
      echo -n "  Pemasukkan bulan ke-: "
      read angka_bulan

      # Kondisi jika pilihan bulan valid
      if [[ "$angka_bulan" -ge 1 && "$angka_bulan" -le 12 ]]; then
        # Menghitung index dari array berdasarkan pilihan bulan
        index=$((angka_bulan-1))  

        # Inputkan jumlah pemasukkan
        echo -n "  Jumlah pemasukkan   : "
        read jml_pemasukkan
        
        # Update data pada array berdasarkan index dan jumlah pemasukkan
      	pemasukkan[$index]=$jml_pemasukkan
      	echo -e "  Data pada bulan ${YELLOW}${bulan[$index]}${RESET} berhasil diubah."

      # Kondisi jika pilihan bulan tidak valid
      else 
	      echo -e "${RED}  Harap masukkan Angka 1-12 ! ${RESET}"
      fi

    # Kondisi jika memilih menu 3
    elif [[ "$menu_pemasukkan" = 3 ]]; then
      echo -e "\n${YELLOW}  TOTAL DATA PEMASUKKAN${RESET}"
      
      # inisiasi variabel total
      total=0

      # Looping untuk menghitung total pemasukkan
      for i in "${pemasukkan[@]}"; do
	      total=$((total+i))
      done

      # Menampilkan total pemasukkan
      echo -e "  Total Pemasukkan saat ini adalah ${YELLOW}Rp $total${RESET}"

    # Kondisi jika memilih menu 4
    elif [[ "$menu_pemasukkan" = 4 ]]; then
      # Keluar dari looping saat ini dan kembali ke menu utama
	    break
    fi
  done  
}

# Function Pengeluaran
outcome(){
  while true; do
    echo -e "${MAGENTA}\n  === MENU PENGELUARAN ===${RESET}\n"

    # Inputkan jumlah item pengeluaran bulan November
    echo -n "  Inputkan jumlah item pengeluaran bulan November: "
    read item

    total=0

    # Looping untuk menghitung total pengeluaran
    for ((i=0; i<item; i++)); do
        echo -ne "\n  Inputkan item ke-$((i+1))"

        echo -ne "\n  Jumlah pengeluaran: "
        read value
        pengeluaran[i]=value

        total=$((total+pengeluaran[i]))
    done

    # Menampilkan total pengeluaran bulan November
    echo -e "\n  Total pengeluaran bulan November : ${MAGENTA} Rp $total${RESET}"

    echo -e "  Saldo awal bulan November        : ${MAGENTA} Rp ${pemasukkan[10]}${RESET}"
    # Update data pada array berdasarkan index dan jumlah pengeluaran
    pemasukkan[10]=$((pemasukkan[10]-total))
    echo -e "  Saldo akhir bulan November       : ${MAGENTA} Rp ${pemasukkan[10]}"

    break;
  done
}

echo -e "${CYAN}"
echo " --------------------------------------------------------------"
echo "|                                                              |"
printf "|   ${RESET}%-58s${CYAN} |\n" "SELAMAT DATANG DI APLIKASI MANAJEMEN KEUANGAN SEDERHANA"
echo "|                                                              |"
echo -e " --------------------------------------------------------------${RESET}"

# Login
attempt=1
max_attempt=3

# Kesempatan 3x jika login gagal
while (( attempt <= 3 )); do
  echo -e "\nSilahkan Login Terlebih Dahulu!"
  # Inputkan username
  echo -n "Username: "
  read username
  # Inputkan password
  echo -n "Password: "
  read -s password
  
  # Validasi login dengan memanggil function login dengan parameter username dan password
  # Kondisi jika login bernilai benar
  if login "$username" "$password"; then
    break
  # Kondisi jika login bernilai salah
  else
    # Menambahkan 1 pada variabel attempt
    ((attempt++))
  fi


  # Jika sudah 3x gagal
  if (( attempt > max_attempt )); then
    echo -e "${RED}Anda telah gagal login 3 kali. Program keluar.${RESET}"
    # Keluar dari program
    exit 1
  fi
done

# Looping menu utama
while true; do
  echo -e "${CYAN}\n=== ${RESET}${BOLD}APLIKASI MANAJEMEN KEUANGAN SEDERHANA ${CYAN}===\n${RESET}"
  echo "1. Pemasukkan" 
  echo "2. Pengeluaran"
  echo "3. Exit"
  
  echo -ne "\nPilih Menu(1-3): "
  read menu
  
  # Validasi Input
  if [[ "$menu" = 1 ]]; then
    # Memanggil function income
    income
  elif [[ "$menu" = 2 ]]; then
    # Memanggil function outcome
    outcome
  elif [[ "$menu" = 3 ]]; then
    # Keluar dari looping
    break
  else
    # Nested IF jika inputan bukan angka atau diluar pilihan
    if ! [[ "$menu" =~ ^[0-9]$ ]]; then
      echo -e "${RED}INPUTKAN ANGKA!!!${RESET}"
      # Lanjut ke proses berikutnya
      continue
    # Jika angka yang diinputkan diluar angka 1 - 3
    elif ! [[ "$menu" =~ ^[1-3]$ ]]; then
      echo -e "${RED}ANGKA YANG DIINPUTKAN DILUAR PILIHAN!${RESET}" 
      # Lanjut ke proses berikutnya
      continue
    else
      # Proses berhenti
      break
    fi
  fi
    
  # Looping untuk lanjut atau berhenti
  while true; do
    echo -ne "\n${CYAN}Apakah ingin kembali ke menu utama? (y/n): "
    read next
    
    # Jika user tidak menginputkan salah satu diantara 'n' 'N' 'y' 'Y'
    if ! [[ "$next" =~ ^[nNyY]$ ]]; then
      echo -e "${RED}Harap inputkan 'Y' atau 'N' ! \n${RESET}"
    # Jika user menginputkan 'n' 'N'
    elif [[ "$next" = 'n' || "$next" = 'N' ]]; then
      echo -e "Baik, sampai jumpa kembali ...\n${RESET}"
      # Keluar dengan kondisi benar
      exit 0
    else
      # Proses berhenti
      break 
    fi
  done
done
