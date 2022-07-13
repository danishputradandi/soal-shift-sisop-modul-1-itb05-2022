# soal-shift-sisop-modul-1-ITB05-2022

Pengerjaan soal shift sistem operasi modul 1 oleh ITB05

# Anggota

| Nama                           | NRP          | 
| -------------------------------| -------------| 
| Nadine Haninta                 | `5027201014` | 
| Danish Putra Dandi             | `5027201048` | 
| Mutiara Nuraisyah Dinda R.     | `5027201054` |

# Konten
* [Sumber Soal Praktikum Sistem Operasi Modul 1 Tahun 2022](#sumber-soal-praktikum-sistem-operasi-modul-1-tahun-2022)
* [Soal 1](#soal-1)
    * [Soal 1.a](#soal-1a)
    * [Soal 1.b](#soal-1b)
    * [Soal 1.c](#soal-1c)
    * [Soal 1.d](#soal-1d)
	* [Kendala](#kendala)
* [Soal 2](#soal-2)
    * [Soal 2.a](#soal-2a)
    * [Soal 2.b](#soal-2b)
    * [Soal 2.c](#soal-2c)
    * [Soal 2.d](#soal-2d)
    * [Soal 2.e](#soal-2e)
* [Soal 3](#soal-3)
    * [Soal 3.a](#soal-3a)
    * [Soal 3.b](#soal-3b)
    * [Soal 3.c](#soal-3c)
    * [Soal 3.d](#soal-3d)


## Sumber Soal Praktikum Sistem Operasi Modul 1 Tahun 2022

[Sumber Soal](https://docs.google.com/document/d/13lHX4hO09jf07y_JFv0BpwunFL-om9eiNFDlIooSW3o/edit)
Dibuka menggunakan E-mail ITS

## Soal 1

1. Pada suatu hari, Han dan teman-temannya diberikan tugas untuk mencari foto. Namun, karena laptop teman-temannya rusak ternyata tidak bisa dipakai karena rusak, Han dengan senang hati memperbolehkan teman-temannya untuk meminjam laptopnya. Untuk mempermudah pekerjaan mereka, Han membuat sebuah program.

a. Han membuat sistem register pada script register.sh dan setiap user yang berhasil didaftarkan disimpan di dalam file `./users/user.txt.` Han juga membuat sistem login yang dibuat di script main.sh <br>
    
b. Demi menjaga keamanan, input password pada login dan register harus tertutup/hidden dan password yang didaftarkan       memiliki kriteria sebagai berikut
    <br>
    * i.     Minimal 8 karakter <br>
    * ii.    Memiliki minimal 1 huruf kapital dan 1 huruf kecil <br>
    * iii.   Alphanumeric <br>
    * iv.    Tidak boleh sama dengan username <br>

c. Setiap percobaan login dan register akan tercatat pada log.txt dengan format : `MM/DD/YY hh:mm:ss` <b>MESSAGE</b>. Message pada log akan berbeda tergantung aksi yang dilakukan user.

     i.   Ketika mencoba register dengan username yang sudah terdaftar, maka message pada log adalah REGISTER: ERROR User already exists
     ii.  Ketika percobaan register berhasil, maka message pada log adalah REGISTER: INFO User USERNAME registered successfully
     iii. Ketika user mencoba login namun passwordnya salah, maka message pada log adalah LOGIN: ERROR Failed login attempt on user USERNAME
     iv.  Ketika user berhasil login, maka message pada log adalah LOGIN: INFO User USERNAME logged in
     
d. Setelah login, user dapat mengetikkan 2 command dengan dokumentasi sebagai berikut : <br>

     i. dl N ( N = Jumlah gambar yang akan didownload)
Untuk mendownload gambar dari https://loremflickr.com/320/240 dengan jumlah sesuai dengan yang diinputkan oleh user. Hasil download akan dimasukkan ke dalam folder dengan format nama YYYY-MM-DD_USERNAME. Gambar-gambar yang didownload juga memiliki format nama PIC_XX, dengan nomor yang berurutan `(contoh : PIC_01, PIC_02, dst. )`.  Setelah berhasil didownload semua, folder akan otomatis di zip dengan format nama yang sama dengan folder dan dipassword sesuai dengan password user tersebut. Apabila sudah terdapat file zip dengan nama yang sama, maka file zip yang sudah ada di unzip terlebih dahulu, barulah mulai ditambahkan gambar yang baru, kemudian folder di zip kembali dengan password sesuai dengan user.

     ii. att
Menghitung jumlah percobaan login baik yang berhasil maupun tidak dari user yang sedang login saat ini.
<hr>

## TIPS
*Menggunakan algoritma `egrep`

## Penyelesaian
### register.sh
```sh
#!/bin/bash
function register (){
	message=$(date)
	echo "username:" 
	read reg_name
	
	if egrep "$reg_name"  users/user.txt > users/regislog.txt;
	then
		echo -e "\n --> $reg_name User Already Exist"
		echo "|$message,$reg_name| #REGISTER: ERROR User already exists" >> users/log.txt
		exit 1 
	fi
	
	echo "$message REGISTER:INFO User |$reg_name| registered successfully" >> users/log.txt
	echo -e "\n\nSYARAT SANDI"
	echo  "1. Minimal mengandung 8 karakter"
	echo  "2. Memiliki minimal 1 huruf kapital dan 1 huruf kecil"
	echo  "3. Mengandung Alphanumeric"
	echo  "4. Tidak boleh sama dengan username"
	echo "Kata sandi"

flag1=0
flag2=0
flag3=0
flag4=0
isBerhasil=0

   
read  -s -p "Type ur Password : " reg_pass 

	if [ ${#reg_pass} -gt 7 ]; then 
    		flag1=1;
		else  
		echo "kurang dari 8 karakter" 
	fi 

	if [[ "$reg_pass" =~ [a-z] ]]; then
    		flag2=1; else echo "tidak ada huruf kecil"  
	fi

	if [[ "$reg_pass" =~ [A-Z] ]]; then 
	    flag3=1;  else echo "tidak ada huruf besar"
	fi

	if ! [[ "$reg_pass" =~ [^a-zA-Z0-9\ ] ]]; then 
  		flag4=1;  else echo "tidak mengandung alphanumeric"
	fi 

	if [[ $flag1 -eq 1 && $flag2 -eq 1 && $flag3 -eq 1 && $flag4 -eq 1 ]];then 

		isBerhasil=1
		echo "sudah berhasil";
		else isBerhasil=0 ;
		echo "ada syarat yang  tidak terpenuhi, Silakan regis ulang"

	fi
#sudo awk '
#function checkuname(){
#     }'
	if [[ $isBerhasil -eq 1 ]];then 
	
		echo "next step";
		
		while [ "$reg_name" = "$reg_pass" ]
		do
			echo "Username tidak boleh sama dengan kata sandi, mohon ulangi masukkan kata sandi yang baru."
			echo "Kata Sandi:"
			read -s reg_pass
		done
		sudo echo "$reg_name,$reg_pass" >> users/user.txt
	
			echo "Pendaftaran berhasil, silahkan melakukan login pada sistem"
			#login		
	fi
}
	echo "Selamat datang di soal pertama sesi lab sistem operasi ITB"
	echo "Silahkan memilih menu untuk melanjutkan"
	echo "1. Register"
	echo -n "jawab: "
read jawaban_menu

case $jawaban_menu in
	"1")
	echo "Silahkan memasukkan data Anda"
	register
	;;
	*)
	echo "Tidak ada pilihan di menu, sistem berhenti secara otomatis"
	::
esac
```
<hr>

###  main.sh
```sh
#!/bin/bash
function login (){
message=$(date)
	read -p "Username: " log_name
	
	#fungsi login
		#dibaca logname koma
	if  egrep  "$log_name,"  users/user.txt > users/loguser.txt;
	then
		
		 echo "---username terdaftar"
		 echo "Password: " 
		 read -s log_password
		 
		 if egrep  ",$log_password"  users/user.txt > users/logpass.txt;
		 then	
		 	echo -e "---password terdaftar\n\nANDA BERHASIL LOGIN"
		 	
		 	
		 	if egrep "$log_name"  users/user.txt > users/loguser.txt;
			then
				echo "|$message,$log_name| #LOGIN: INFO User $log_name logged in" >> users/log.txt
				
				afterlogin
			fi
		
		 else
		 	echo "---Password salah, Silahkan melakukan login ulang"
		 	
		 	if egrep "$log_pass"  users/user.txt > users/logpass.txt;
			then
				echo "|$message,$log_pass| #LOGIN: ERROR Failed login attempt on user $log_name" >> users/log.txt
				exit 2 
			fi
		 fi
		 
	else 
		echo "---username tidak terdaftar, silahkan melakukan pendaftaran"
	fi
}

function afterlogin(){
	echo -e "Silahkan ketik command dibawah untuk melakukan dokumentasi \n"
	echo "Masukkan command --> dl atau att <--"
	echo "Command : "
	read perintah 
	
	if [[ $perintah == att ]]
	then
		att
		
	elif [[ $perintah == dl ]]
	then
		dl
	else
		echo "Tidak ada perintah , Silahkan mengisi ulang"
	fi

}

function att(){
	awk '/#LOGIN/{n++} END {print "Total login adalah : ", n}' users/log.txt
}

	echo "Selamat datang di lab sistem operasi ITB05"
	echo "Silahkan menggunakan akun yang sudah terdaftar"
	echo "1. Login Account"
	echo -n "jawab: "
read jawaban_menu
	
	if [ ${#jawaban_menu} -eq 1 ]; 
	then
		echo "Silahkan masuk menggunakan akun yang telah tersimpan"
		login
	else echo "Tidak ada pilihan di menu, sistem berhenti secara otomatis"
	fi
```
# Penjelasan Code
<hr>

## Soal 1a
Membuat file `main.sh` dan `register.sh` dengan menggunakan syntax `nano`

- Langkah pertama
 Membuat file 
```
#!/bin/bash
nano main.sh
nano register.sh
```
- Langkah kedua <br>
Membuat file `user.txt` yang terletak pada folder `Users` menggunakan syntax `mkdir` pada terminal

 Membuat folder
```
mkdir -p users
```
 Membuat file user.txt
```
nano user.txt
```

Menyimpan hasil register di file `user.txt` pada folder `users`
```sh
sudo echo "$reg_name,$reg_pass" >> users/user.txt
```

<hr>

## Soal 1b

Membuat input password agar tidak terlihat ketika diterminal menggunakan syntax `-s` dan juga membuat 4 syarat
seperti pada soal menggunakan fungsi `if else`<br>

<b> Syarat 1, 2, 3 </b>
```sh
#!/bin/bash
read  -s -p "Type ur Password : " reg_pass 
 

	if [ ${#reg_pass} -gt 7 ]; then 
    		flag1=1;
		else  
		echo "kurang dari 8 karakter" 
	fi 

	if [[ "$reg_pass" =~ [a-z] ]]; then
    		flag2=1; else echo "tidak ada huruf kecil"  
	fi

	if [[ "$reg_pass" =~ [A-Z] ]]; then 
	    flag3=1;  else echo "tidak ada huruf besar"
	fi

	if ! [[ "$reg_pass" =~ [^a-zA-Z0-9\ ] ]]; then 
  		flag4=1;  else echo "tidak mengandung alphanumeric"
	fi 

	if [[ $flag1 -eq 1 && $flag2 -eq 1 && $flag3 -eq 1 && $flag4 -eq 1 ]];then 

		isBerhasil=1
		echo "sudah berhasil";
		else isBerhasil=0 ;
		echo "ada syarat yang  tidak terpenuhi, Silakan regis ulang"

	fi

```
Seperti pada code, kami menggunakan syntax `-s` yang memiliki arti <i> silent </i> agar input register login pada terminal tidak
bisa dilihat alias <i>Invisible</i>. <br>

Untuk 3 syarat pertama, kami menggunakan `$reg_pass` yang berguna untuk mengambil nilai dari <b> Input Password </b> kemudian akan
dilakukan seleksi menggunakan fungsi if else dengan penjelasan sebagai berikut : <br>

1. Deteksi apakah input password mengandung minimal 8 karakter
```sh
#!/bin/bash
	if [ ${#reg_pass} -gt 7 ]; then 
    		flag1=1;
		else  
		echo "kurang dari 8 karakter" 
	fi 
```
2. Password harus memiliki minimal 1 huruf kapital & 1 huruf kecil
```sh
#!/bin/bash
	if [[ "$reg_pass" =~ [a-z] ]]; then
    		flag2=1; else echo "tidak ada huruf kecil"  
	fi

	if [[ "$reg_pass" =~ [A-Z] ]]; then 
	    flag3=1;  else echo "tidak ada huruf besar"
	fi
```
3. Password harus mengandung Alphanumeric
```sh
#!/bin/bash
	if ! [[ "$reg_pass" =~ [^a-zA-Z0-9\ ] ]]; then 
  		flag4=1;  else echo "tidak mengandung alphanumeric"
	fi 
```
- Kemudian kami akan mengecheck semua syarat password menggunakan
```sh
#!/bin/bash
	if [[ $flag1 -eq 1 && $flag2 -eq 1 && $flag3 -eq 1 && $flag4 -eq 1 ]];then 

		isBerhasil=1
		echo "sudah berhasil";
		else isBerhasil=0 ;
		echo "ada syarat yang  tidak terpenuhi, Silakan regis ulang"

	fi
```

4. Password tidak boleh sama dengan username
- Kali ini, kami menggunakan sebuah fungsi `do while` yang terletak di dalam `if else`

```sh
#!/bin/bash
	if [[ $isBerhasil -eq 1 ]];then 

	
		echo "next step";
		
		while [ "$reg_name" = "$reg_pass" ]
		do
			echo "Username tidak boleh sama dengan kata sandi, mohon ulangi masukkan kata sandi yang baru."
			echo "Kata Sandi:"
			read -s reg_pass
		done
		sudo echo "$reg_name,$reg_pass" >> users/user.txt
	
			echo "Pendaftaran berhasil, silahkan melakukan login pada sistem"
			#login
		
		
	fi
```

<hr>

## Soal 1c
Pertama, kami membuat sebuah syntax yang berfungsi untuk mencatat sebuah waktu yang bergantung kapan user tersebut melakukannya dengan syntax ```message=$(date)```
<hr>

Mencatat setiap percobaan dengan format `MM/DD/YY hh:mm:ss` <b>MESSAGE</b> pada file log.txt <br>
1. Memunculkan sebuah log `REGISTER:ERROR User already exist` apabila user memasukkan username yang telah terdaftar
- Disini kami menggunakan algoritma `egrep`. Egrep adalah ekstensi dari perintah grep, perintah pengguna untuk mencari serangkaian karakter dalam garis dan beberapa pola di dalam file teks. Setelah itu, program akan mengecek kedalam file `user.txt` disesuaikan dengan input `$reg_name`. Apabila username telah terdaftar, maka program akan memunculkan sebuah log
```sh
if egrep "$reg_name"  users/user.txt > users/regislog.txt;
	then
		echo -e "\n --> $reg_name User Already Exist"
		echo "|$message,$reg_name| #REGISTER: ERROR User already exists" >> users/log.txt
		exit 1 
	fi
```
2. Memunculkan sebuah log `REGISTER: INFO User USERNAME  registered successfully` apabila user berhasil melakukan register <br>
Pada soal, kita diminta untuk memunculkan sebuah register yang berhasil berdasarkan  <b>USERNAME</b>. Oleh karena itu, apabila username yang didaftarkan tidak tersedia, maka user akan berhasil melakukan registrasi.

```sh
echo "$message REGISTER:INFO User |$reg_name| registered successfully" >> users/log.txt
```
3. Memunculkan sebuah log `LOGIN: ERROR Failed login attempt on user USERNAME` apabila user melakukan login dengan password yang salah<br>

Pada bagian ini, kami menggunakan sebuah syntax `$log_pass` dan nantinya log password ini akan melakukan check pada file user.txt, apakah ada atau tidaknya. Jika tidak ada, maka sistem akan memberitahu kepada user bahwa password salah. Kemudian sistem akan mengirimkan sebuah message ke `log.txt`
```sh
else
		 	echo "---Password salah, Silahkan melakukan login ulang"
		 	
		 	if egrep "$log_pass"  users/user.txt > users/logpass.txt;
			then
				echo "|$message,$log_pass| #LOGIN: ERROR Failed login attempt on user $log_name" >> users/log.txt
				exit 2 
			fi
```
4. Memunculkan sebuah log `LOGIN: INFO User USERNAME` apabila user berhasil melakukan login <br>

Pada bagian ini, kami menggunakan syntax `egrep`. Pada bagian `$log_name` ditambahkan sebuah `,` agar tidak terjadi error karena egrep memiliki kelemahan tersendiri dengan arti `yang terkandung`. Oleh karena itu, pada awal pengecekan password ditandai dengan `,$log_password` ditambahkan sebuah koma didepan agar `user.txt` dapat membedakan mana yang user & mana yang password sehingga ketika user melakukan login dengan user & password yang telah didaftarkan pada bagian register maka login akan berhasil.

```sh
if  egrep  "$log_name,"  users/user.txt > users/loguser.txt;
	then
		
		 echo "---username terdaftar"
		 echo "Password: " 
		 read -s log_password
		 
		 if egrep  ",$log_password"  users/user.txt > users/logpass.txt;
		 then	
		 	echo -e "---password terdaftar\n\nANDA BERHASIL LOGIN"
		 	
		 	
		 	if egrep "$log_name"  users/user.txt > users/loguser.txt;
			then
				echo "|$message,$log_name| #LOGIN: INFO User $log_name logged in" >> users/log.txt
				
				afterlogin
			fi
```


<hr>

## Soal 1d
Setelah berhasil melakukan login, user diminta untuk memilih 2 command `dl N dan att` yang tersedia sebagai dokumentasi <br>
```sh
function afterlogin(){
	echo -e "Silahkan ketik command dibawah untuk melakukan dokumentasi \n"
	echo "Masukkan command --> dl atau att <--"
	echo "Command : "
	read perintah 
	
	if [[ $perintah == att ]]
	then
		att
		
	elif [[ $perintah == dl ]]
	then
		dl
	else
		echo "Tidak ada perintah , Silahkan mengisi ulang"
	fi

}
```

1. att
Pada bagian ini, kami menggunakan sebuah fungsi awk yang berguna untuk menghitung total `LOGIN` berdasarkan sebuah file `log.txt` <br>
Fungsi awk akan mencari format yang sesuai pada file `log.txt` ditandai dengan `#LOGIN` jika sudah ditemukan, sistem akan menjumlahkan total login ditandai dengan `n++` sehingga total dari log dengan kata `LOGIN` dapat dijumlahkan.

```sh
function att(){
	awk '/#LOGIN/{n++} END {print "Total login adalah : ", n}' users/log.txt
}
```

2. dl
## Kendala
 - Analogi Soal <br>
-Kita diminta untuk menginput jumlah gambar dengan format yang telah ditentukan (contoh : PIC_01, PIC_02, dst. ). kemudian folder akan melakukan zip

-Mendownload gambar dari link :  https://loremflickr.com/320/240 

 -1d. Percobaan mendownload gambar menggunakan format yang ditentukan tidak sesuai ekspektasi pada outputnya, File zip juga tidak berfungsi

## Dokumentasi Soal 1
1. Register
- Register Already exist<br>
![User already exists](/Screenshots/Register%20already%20exist.PNG)

- Register Successfully<br>
![User registered](/Screenshots/Register%20berhasil.PNG)

2. Login
- Login Error<br>
![Login Error](/Screenshots/Logingagal.PNG)

- Login Berhasil<br>
![Login Success](/Screenshots/Loginberhasil.PNG)

3. LOG
- Total LOG<br>
![Log total](/Screenshots/totallog.PNG)

- Log register Already exist<br>
![Log User Already Exist](/Screenshots/LogRegisalreadyexist.PNG)

- Log register Successfully<br>
![Log Register Successfully](/Screenshots/LogRegisberhasil.PNG)

- Log Failed Login<br>
![Log Failed Login](/Screenshots/LogLogingagal.PNG)

- Log Logged in<br>
![Log Logged In](/Screenshots/Logloginberhasil.PNG)

4. Hasil fungsi att<br>
![Fungsi att](/Screenshots/hasilatt.PNG)
-----------------
## Soal 2
Pada tanggal 22 Januari 2022, website https://daffa.info di hack oleh seseorang yang tidak bertanggung jawab. Sehingga hari sabtu yang seharusnya hari libur menjadi berantakan. Dapos langsung membuka log website dan menemukan banyak request yang berbahaya. Bantulah Dapos untuk membaca log website https://daffa.info Buatlah sebuah script awk bernama "soal2_forensic_dapos.sh" untuk melaksanakan tugas-tugas berikut: <br> <br>
a.	Buat folder terlebih dahulu bernama forensic_log_website_daffainfo_log.<br>
b.	Dikarenakan serangan yang diluncurkan ke website https://daffa.info sangat banyak, Dapos ingin tahu berapa rata-rata request per jam yang dikirimkan penyerang ke website. Kemudian masukkan jumlah rata-ratanya ke dalam sebuah file bernama ratarata.txt ke dalam folder yang sudah dibuat sebelumnya. <br>
c.	Sepertinya penyerang ini menggunakan banyak IP saat melakukan serangan ke website https://daffa.info, Dapos ingin menampilkan IP yang paling banyak melakukan request ke server dan tampilkan berapa banyak request yang dikirimkan dengan IP tersebut. Masukkan outputnya kedalam file baru bernama result.txt kedalam folder yang sudah dibuat sebelumnya. <br>
d.	Beberapa request ada yang menggunakan user-agent ada yang tidak. Dari banyaknya request, berapa banyak requests yang menggunakan user-agent curl?
Kemudian masukkan berapa banyak requestnya kedalam file bernama result.txt yang telah dibuat sebelumnya. <br>
e.	Pada jam 2 pagi pada tanggal 22 terdapat serangan pada website, Dapos ingin mencari tahu daftar IP yang mengakses website pada jam tersebut. Kemudian masukkan daftar IP tersebut kedalam file bernama result.txt yang telah dibuat sebelumnya. <br>

Agar Dapos tidak bingung saat membaca hasilnya, formatnya akan dibuat seperti ini:

●	<b> File ratarata.txt </b> <br>
Rata-rata serangan adalah sebanyak rata_rata requests per jam <br>

●	<b> File result.txt </b> <br>
IP yang paling banyak mengakses server adalah: ip_address sebanyak jumlah_request requests <br>

Ada jumlah_req_curl requests yang menggunakan curl sebagai user-agent <br>

IP Address Jam 2 pagi <br>
IP Address Jam 2 pagi <br>
dst

* Gunakan AWK <br>
** Nanti semua file-file HASIL SAJA yang akan dimasukkan ke dalam folder forensic_log_website_daffainfo_log

<br>
<hr>

## Penyelesaian
```sh
#!bin/bash
mkdir -p forensic_log_website_daffainfo_log 

awk -F: 'END {
    printf "Rata-rata serangan adalah sebanyak %f request per jam.",(NR-1)/12
    }' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/ratarata.txt

awk -F: '{
    ip_address[$1]++} 
    END {
        for (ip in ip_address) printf "%s : %d\n", ip, ip_address[ip];
        }' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt

awk -F: '{
    if (ip[$1] ++ >= maksimal) 
    maksimal = ip [$1]} 
    END {
        for (i in ip)
         if(maksimal == ip [i]) 
         printf "\nIP yang paling banyak mengakses server adalah %s sebanyak %d request \n\n", i, ip[i]
         }' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt

awk -F: 'BEGIN { 
    print "Ada berapa request yang menggunakan user-agent \"curl\"?"} 
    /curl/ { ++n } 
    END { 
        print "User-agent \"curl\" ada sebanyak ", n, "\n\n"
        }' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt

awk -F: '$3 == "02" {print $1}' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt

```
## Penjelasan Code

### Soal 2a
Membuat folder forensic_log_website_daffainfo_log. Cukup dengan menggunakan syntax `mkdir` atau make new directory.
```sh
mkdir -p forensic_log_website_daffainfo_log 
```

### Soal 2b
Rata rata jumlah request yang mengakses website daffa per jam.

```sh
awk -F: 'END {
    printf "Rata-rata serangan adalah sebanyak %f request per jam.",(NR-1)/12
    }' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/ratarata.txt
```

Sebenarnya ini sangat simple bisa menggunakan `(NR-1)` untuk mengakses tiap barisnya dan `/12` atau dibagi 12 karena totalnya jam yang tertera di file log_website_daffainfo.log adalah dari jam 00.00 - 11.00. Maka nanti akan langsung ditampilkan rata-ratanya.

### Soal 2c
Untuk mengetahui IP Address yang paling banyak mengakses disini kami menggunakan 2 fungsi awk :
<br>
- Fungsi pertama

```sh
awk -F: '{
    ip_address[$1]++} 
    END {
        for (ip in ip_address) printf "%s : %d\n", ip, ip_address[ip];
        }' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt
```

Pada fungsi pertama ini untuk menampilkan tiap IP address beserta jumlah request yang diminta. `-F:` adalah untuk fungsi option separatornya, `-F` berarti option dan diikuti oleh tanda separatornya, disini kami menggunakan titik dua `":"` sebagai sepatornya. Lalu `ip_address[$1]++` untuk membuat array dengan mengambil `$1` atau argumen pertama yang berisi IP address. 
<br>
<br>
Selanjutnya masuk ke for loop dengan `ip in ip_address` untuk menampilkan hasilnya yakni `%s` untuk menampilkan IP Address yang didapatkan dari `ip` dan  `%d` untuk jumlah requestnya yang didapat dari `ip_address[ip]`.

- Fungsi Kedua

```sh
awk -F: '{
    if (ip[$1] ++ >= maksimal) 
    maksimal = ip [$1]} 
    END {
        for (i in ip)
         if(maksimal == ip [i]) 
         printf "\nIP yang paling banyak mengakses server adalah %s sebanyak %d request \n\n", i, ip[i]
         }' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt
```

Ini adalah fungsi yang lebih ringkasnya yakni hanya untuk menampilkan IP Address terbanyak dan langsung menampilkan juga jumlah requestnya.<br>

Sama seperti diatas untuk mengakses argumen pertama atau `$1` kita menggunakan option separator `-F:`. Lalu masuk ke pengondisian `if (ip[$1] ++ >= maksimal) maksimal = ip [$1]` yakni untuk menentukan maksimalnya yakni jumlah kolom IP address atau `$1`. Lalu masuk ke pengulangan yang didalamnya terdapat pengondisian lagi `if(maksimal == ip [i])` maka akan langsung ditampilkan IP Address terbanyak yang mengakses website Daffa beserta jumlah requestnya. 

### Soal 2d
Banyak sekali request yang masuk ke website Daffa dengan *user agent* yang bermacam-macam pula. Lalu Daffa ingin mengentahui berapa banyak dengan *user agent* "curl" yang mengakses websitenya. Oke, kita akan bantu Daffa dengan menggunakan fungsi AWK dibawah ini :

```sh
awk -F: 'BEGIN { 
    print "Ada berapa request yang menggunakan user-agent \"curl\"?"} 
    /curl/ { ++n } 
    END { 
        print "User-agent \"curl\" ada sebanyak ", n, "\n\n"
        }' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt
```
Program awk memiliki rule yang memiliki kelakuan khusus. Di antaranya adalah `BEGIN` dan `END`. Rule `BEGIN` hanya dieksekusi satu kali, yaitu sebelum input dibaca. Rule `END` pun juga dieksekusi satu kali, hanya setelah semua input selesai dibaca. Untuk fungsi ini pada bagian `BEGIN` kita hanya gunakan untuk menampilkan tulisan pemanisnya saja. Lalu lanjut ke `/curl/` untuk menemukan pola tulisan didalam slash `"/"` pada tiap baris. Lalu `{ ++n }` adalah actionnya, yakni setiap ditemukan pola yang ditentukan (curl) pada tiap barisnya maka `n` akan bertambah. Dan dibagian `END` kita tinggal tampilkan kata-kata pemanis dan jumlah *user agent* "curl" yang ditemukan.

### Soal 2e
Daffa ingin tahu IP Address apa saja yang mengakses websitenya pada pukul 02 pagi. Maka dari itu kami membuat fungsi Awk berikut ini :

```sh
awk -F: '$3 == "02" {print $1}' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt
```
Untuk soal ini fungsi penyelesaiannya cukup sederhana yakni kita gunakan basic format AWK <br>
```sh
awk options 'selection _criteria {action }' input-file > output-file
```
Dengan pattern atau `selection_criteria` nya adalah `$3 == "02"` yakni jika argumen ketiga `$3` (yang mana itu menunjukkan bagian jam pada file log daffa) sama dengan `"02"` atau pukul 02 maka `{print $1}` tampilkan semua argumen `$1` yakni kolom IP Address. 

Cuplikan file log daffa : <br>
```
"88.80.186.144":"22/Jan/2022:02:51:43":"GET /main.jhtml HTTP/1.1":404:5608:"curl/7.54.0"
"88.80.186.144":"22/Jan/2022:02:51:44":"GET /base.jhtml HTTP/1.1":404:463:"curl/7.54.0"
"88.80.186.144":"22/Jan/2022:02:51:44":"GET /main.pl HTTP/1.1":404:463:"curl/7.54.0"
```
Untuk menyimpan hasil pada folder dan file ratarata.txt dan result.txt maka ditambahkan `log_website_daffainfo.log >> forensic_log_website_daffainfo_log/ratarata.txt` dan
`log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt`
ditiap akhir fungsi Awk.

## Screenshots Hasil

- Proses Bash 
![Proses Bash](/Screenshots/prosesbash.png)
- Rata - Rata (Soal 2b)
![ratarata.txt](/Screenshots/hasil%20ratarata.png)
- Result (Soal 2c, 2d dan 2e)
![Result](/Screenshots/hasil%20result1.png)
![Result](/Screenshots/hasil%20result2.png)
![Result](/Screenshots/hasil%20result3.png)
![Result](/Screenshots/hasil%20result4.png)
- File Directory
![Directory](/Screenshots/ls%20folder%20soal2.png)
![Directory](/Screenshots/ls%20folder%20forensic.png)
![Directory](/Screenshots/isi%20forensic.png)
-------------------------
## Soal 3
Ubay sangat suka dengan komputernya. Suatu saat komputernya crash secara tiba-tiba :(. Tentu saja Ubay menggunakan linux. Akhirnya Ubay pergi ke tukang servis untuk memperbaiki laptopnya. Setelah selesai servis, ternyata biaya servis sangatlah mahal sehingga ia harus menggunakan dana kenakalannya untuk membayar biaya servis tersebut. Menurut Mas Tukang Servis, laptop Ubay overload sehingga mengakibatkan crash pada laptopnya. Karena tidak ingin hal serupa terulang, Ubay meminta kalian untuk membuat suatu program monitoring resource yang tersedia pada komputer.
<br><br>
Buatlah program monitoring resource pada komputer kalian. Cukup monitoring ram dan monitoring size suatu directory. Untuk ram gunakan command `free -m`. Untuk disk gunakan command `du -sh target_path`. Catat semua metrics yang didapatkan dari hasil `free -m`. Untuk hasil `du -sh target_path` catat size dari path directory tersebut. Untuk target_path yang akan dimonitor adalah /home/{user}/.
<br><br>
Note:
* nama file untuk script per menit adalah minute_log.sh
* nama file untuk script agregasi per jam adalah aggregate_minutes_to_hourly_log.sh
* semua file log terletak di /home/{user}/log
<br>
Berikut adalah contoh isi dari file metrics yang dijalankan tiap menit:<br>
mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size<br>
15949,10067,308,588,5573,4974,2047,43,2004,/home/youruser/test/,74M<br>
<br>
Berikut adalah contoh isi dari file aggregasi yang dijalankan tiap jam:<br>
type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size<br>
minimum,15949,10067,223,588,5339,4626,2047,43,1995,/home/user/test/,50M<br>
maximum,15949,10387,308,622,5573,4974,2047,52,2004,/home/user/test/,74M<br>
average,15949,10227,265.5,605,5456,4800,2047,47.5,1999.5,/home/user/test/,62
<br>
<hr>

### Penyelesaian
#### minute_log.sh
```sh
#!/bin/bash
user="nadnadine"
#Ganti sesuai nama user
filename=$(date +'%Y%m%d%H%M%S')
mkdir -p /home/$user/log
function print-this(){
    awk 'function test1(){
        printf "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size\n"
        printf "%u,%u,%u,%u,%u,%u",$2,$3,$4,$5,$6,$7
    }
        function test2(){
        printf ",%u,%u,%u,",$2,$3,$4
    }
        /^Mem/ {test1()}
        /^Swap/ {test2()}' <(free -m) >> /home/$user/log/metrics_$filename.log
    awk 'function test3(){
        printf "%s,%u\n",$2,$1
    }
        {test3()}' <(du -sh /home/$user/) >> /home/$user/log/metrics_$filename.log
}

print-this
chmod 400 /home/$user/log/metrics_$filename.log
```
#### aggregate_minutes_to_hourly
```sh
#!/bin/bash
user="nadnadine"
#Ganti sesuai nama user
path_saya="/home/$user/"
filename=$(date +'%Y%m%d%H')
fileforfetch=$(date -d '1 hour ago' "+%Y%m%d%H")

function examine(){
    min_mem_total=$(awk -F "," '/home/ {print $1}' /home/$user/log/metrics_$fileforfetch*.log | sort -nk1 -t"," | head -1)
    min_mem_used=$(awk -F "," '/home/ {print $2}' /home/$user/log/metrics_$fileforfetch*.log | sort -nk2 -t"," | head -1)
    min_mem_free=$(awk -F "," '/home/ {print $3}' /home/$user/log/metrics_$fileforfetch*.log | sort -nk3 -t"," | head -1)
    min_mem_shared=$(awk -F "," '/home/ {print $4}' /home/$user/log/metrics_$fileforfetch*.log | sort -nk4 -t"," | head -1)
    min_mem_buff=$(awk -F "," '/home/ {print $5}' /home/$user/log/metrics_$fileforfetch*.log | sort -nk5 -t"," | head -1)
    min_mem_available=$(awk -F "," '/home/ {print $6}' /home/$user/log/metrics_$fileforfetch*.log | sort -nk6 -t"," | head -1)
    min_swap_total=$(awk -F "," '/home/ {print $7}' /home/$user/log/metrics_$fileforfetch*.log | sort -nk7 -t"," | head -1)
    min_swap_used=$(awk -F "," '/home/ {print $8}' /home/$user/log/metrics_$fileforfetch*.log | sort  -nk8 -t"," | head -1)
    min_swap_free=$(awk -F "," '/home/ {print $9}' /home/$user/log/metrics_$fileforfetch*.log | sort -nk9 -t"," | head -1)
    min_path_size=$(awk -F "," '/home/ {print $11}' /home/$user/log/metrics_$fileforfetch*.log | sort -nk11 -t"," | head -1)
    max_mem_total=$(awk -F "," '/home/ {print $1}' /home/$user/log/metrics_$fileforfetch*.log | sort -r -nk1 -t"," | head -1)
    max_mem_used=$(awk -F "," '/home/ {print $2}' /home/$user/log/metrics_$fileforfetch*.log | sort -r -nk2 -t"," | head -1)
    max_mem_free=$(awk -F "," '/home/ {print $3}' /home/$user/log/metrics_$fileforfetch*.log | sort -r -nk3 -t"," | head -1)
    max_mem_shared=$(awk -F "," '/home/ {print $4}' /home/$user/log/metrics_$fileforfetch*.log | sort -r -nk4 -t"," | head -1)
    max_mem_buff=$(awk -F "," '/home/ {print $5}' /home/$user/log/metrics_$fileforfetch*.log | sort -r -nk5 -t"," | head -1)
    max_mem_available=$(awk -F "," '/home/ {print $6}' /home/$user/log/metrics_$fileforfetch*.log | sort -r -nk6 -t"," | head -1)
    max_swap_total=$(awk -F "," '/home/ {print $7}' /home/$user/log/metrics_$fileforfetch*.log | sort -r -nk7 -t"," | head -1)
    max_swap_used=$(awk -F "," '/home/ {print $8}' /home/$user/log/metrics_$fileforfetch*.log | sort -r -nk8 -t"," | head -1)
    max_swap_free=$(awk -F "," '/home/ {print $9}' /home/$user/log/metrics_$fileforfetch*.log | sort -r -nk9 -t"," | head -1)
    max_path_size=$(awk -F "," '/home/ {print $11}' /home/$user/log/metrics_$fileforfetch*.log | sort -r -nk11 -t"," | head -1)
    avg_mem_total=$(bc<<<"scale=1;("$max_mem_total" + "$min_mem_total")/2")
    avg_mem_used=$(bc<<<"scale=1;("$max_mem_used" + "$min_mem_used")/2")
    avg_mem_free=$(bc<<<"scale=1;("$max_mem_free" + "$min_mem_free")/2")
    avg_mem_shared=$(bc<<<"scale=1;("$max_mem_shared" + "$min_mem_shared")/2")
    avg_mem_buff=$(bc<<<"scale=1;("$max_mem_buff" + "$min_mem_buff")/2")
    avg_mem_available=$(bc<<<"scale=1;("$max_mem_available" + "$min_mem_available")/2")
    avg_swap_total=$(bc<<<"scale=1;("$max_swap_total" + "$min_swap_total")/2")
    avg_swap_used=$(bc<<<"scale=1;("$max_swap_used" + "$min_swap_used")/2")
    avg_swap_free=$(bc<<<"scale=1;("$max_swap_free" + "$min_swap_free")/2")
    avg_path_size=$(bc<<<"scale=1;("$max_path_size" + "$min_path_size")/2")
    echo mem_type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size > $path_saya/log/metrics_agg_$filename.log
    echo minimum,$min_mem_total,$min_mem_used,$min_mem_free,$min_mem_shared,$min_mem_buff,$min_mem_available,$min_swap_total,$min_swap_used,$min_swap_free,$path_saya,$min_path_size >> $path_saya/log/metrics_agg_$filename.log
    echo maximum,$max_mem_total,$max_mem_used,$max_mem_free,$max_mem_shared,$max_mem_buff,$max_mem_available,$max_swap_total,$max_swap_used,$max_swap_free,$path_saya,$max_path_size >> $path_saya/log/metrics_agg_$filename.log
    echo average,$avg_mem_total,$avg_mem_used,$avg_mem_free,$avg_mem_shared,$avg_mem_buff,$avg_mem_available,$avg_swap_total,$avg_swap_used,$avg_swap_free,$path_saya,$avg_path_size >> $path_saya/log/metrics_agg_$filename.log
}

examine
chmod 400 /home/$user/log/metrics_agg_$filename.log
```
## Penjelasan Code

### Soal 3 secara umum
Di bagian catatan, tertulis bagaimana format dalam setiap *file* metrics. Diketahui pula dari awal soal, perintah yang digunakan adalah `free -m` dan `du-sh target_path`. Pada kasus ini, `target_path` adalah "/home/nadnadine". Adapun contoh dari penjalanan perintah ini pada terminal adalah sebagai berikut,
* Proses `free -m` (Hasil berubah secara dinamis)
```
┌──(nadnadine㉿kali)-[~]
└─$ free -m
               total        used        free      shared  buff/cache   available
Mem:            1951         433         995           5         522        1343
Swap:            974           0         974
```
* Proses `du -sh user/nadnadine` (Hasil berubah secara dinamis)
```
┌──(nadnadine㉿kali)-[~]
└─$ du -sh /home/nadnadine
160M    /home/nadnadine
```
Dari sini, praktikan diminta untuk mencatat hasil tersebut dalam sebuah *file* metrics. Dari sini, digunakan fungsi awk untuk mengambil nilai.
Untuk mengambil nilai `mem_total`, `mem_used`, `mem_free`, `mem_shared`,`mem_buff`, dan `mem_available`, digunakan fungsi `test1`.
```sh
 awk 'function test1(){
    printf "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size\n"
    printf "%u,%u,%u,%u,%u,%u",$2,$3,$4,$5,$6,$7
    }
    /^Mem/ {test1()}' <(free -m) >> /home/$user/log/metrics_$filename.log
```
Secara *default* jika tidak disebutkan pembatas dari argumen, awk akan mengambil spasi sebagai pembatasnya. Dalam kasus ini, setiap ditemukan kata `Mem` pada perintah `free -m`, akan diambil argumen ke-2 hingga ke-7 pada baris tersebut. Lalu hasilnya akan disimpan dalam *file* yang bernama `metrics_$filename` yang mana `$filename` akan dijelaskan di bagian [Soal 3.a](#soal-3a).<br>
Sementara untuk mengambil nilai `swap_total`, `swap_used`, dan `swap_free`, digunakan fungsi `test2`.
```sh
 awk 'function test2(){
    printf ",%u,%u,%u,",$2,$3,$4
    }
    /^Swap/ {test2()}' <(free -m) >> /home/$user/log/metrics_$filename.log
```
Dalam kasus ini, setiap ditemukan kata `Swap` pada perintah `free -m`, akan diambil argumen ke-2 hingga ke-4 pada baris tersebut. Lalu hasilnya akan disimpan dalam *file* yang bernama `metrics_$filename` yang mana `$filename` akan dijelaskan di bagian [Soal 3.a](#soal-3a).<br>
Karena *command* yang digunakan tidak hanya `free -m`, maka dibuat lagi fungsi yang digunakan untuk mengambil argumen dari perintah `du -sh target_path` yang mana `target_path`-nya sudah ditentukan yaitu /home/username/. Dan hasil dari fungsi awk tersebut akan disimpan pada *file* yang sama dengan *file* sebelumnya. dari perintah ini, diambil argumen ke-1 dan ke-2 (`path` dan `path_size`) 
```sh
awk 'function test3(){
    printf "%s,%u\n",$2,$1
    }
    {test3()}' <(du -sh /home/$user/) >> /home/$user/log/metrics_$filename.log
```
Di soal ini, juga diberi batasan mengenai penyimpanan log (baik permenit maupun perjam) berada di `/home/{user}/log`, sehingga keseluruhan hasil proses disimpan di `/home/nadnadine/log`

### Soal 3a
Masukkan semua metrics ke dalam suatu file log bernama metrics_{YmdHms}.log. {YmdHms} adalah waktu disaat file script bash kalian dijalankan. Misal dijalankan pada 2022-01-31 15:00:00, maka file log yang akan tergenerate adalah metrics_20220131150000.log.<br>
Karena Ubay menginginkan setiap kumpulan metrics diberi nama sesuai dengan waktu *file* tersebut dijalankan, maka dibuat sebuah variabel yang mendeklarasikan waktu pada saat itu dan memasukkan variabel tersebut pada nama *file* akhir di mana Ubay menyimpan kumpulan informasi tersebut.
```sh
#!/bin/bash
user="nadnadine"
filename=$(date +'%Y%m%d%H%M%S')
...

    /^Mem/ {test1()}
    /^Swap/ {test2()}' <(free -m) >> /home/$user/log/metrics_$filename.log
... 
    {test3()}' <(du -sh /home/$user/) >> /home/$user/log/metrics_$filename.log
```
Pada kasus ini, keterangan waktu disimpan dalam sebuah variabel bernama `$filename`. Variabel ini menggunakan fungsi `date` yang diikuti secara berturut-turut `%Y` untuk keterangan tahun, `%m` untuk keterangan bulan menggunakan angka, `%d` untuk keterangan tanggal, `%H` untuk keterangan jam, `%M` untuk keterangan menit, dan `%S` untuk keterangan detik yang terbatas dengan 2 digit.<br>

### Soal 3b
Script untuk mencatat metrics diatas diharapkan dapat berjalan otomatis pada setiap menit.<br>
Karena pertimbangan materi sistem operasi yang telah dijalankan, maka digunakan pengeditan crontab untuk menjalankan script `minute_log.sh` secara terus-menerus setiap menit. Untuk itu, ditambahkan sebuah baris di paling bawah crontab,
```
* * * * * /bin/bash /home/nadnadine/Documents/minute_log.sh
```
`* * * * *` berarti perintah dijalankan setiap menit<br>
`/bin/bash` berarti cara menjalankan file adalah dengan menggunakan argumen "bash"<br>
`/home/nadnadine/Documents/minute_log.sh` berarti path dari *file* yang akan dijalankan oleh crontab<br>
Sebelumnya, pastikan bahwa memasang cron pada linux dan mengaktifkan sistemnya agar *file* dapat berjalan secara otomatis.<br>

### Soal 3c
Kemudian, buat satu script untuk membuat agregasi file log ke satuan jam. Script agregasi akan memiliki info dari file-file yang tergenerate tiap menit. Dalam hasil file agregasi tersebut, terdapat nilai minimum, maximum, dan rata-rata dari tiap-tiap metrics. File agregasi akan ditrigger untuk dijalankan setiap jam secara otomatis. Berikut contoh nama file hasil agregasi metrics_agg_2022013115.log dengan format metrics_agg_{YmdH}.log <br>
Adapun contoh dari format isi dari *file* tersebut adalah
```
type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size
minimum,15949,10067,223,588,5339,4626,2047,43,1995,/home/user/test/,50M
maximum,15949,10387,308,622,5573,4974,2047,52,2004,/home/user/test/,74M
average,15949,10227,265.5,605,5456,4800,2047,47.5,1999.5,/home/user/test/,62
```
Di mana masing-masing berisi nilau minimum, maximum, dan rata-rata dari nilai minimum dan maximum dari setiap kategori.<br>
**Pada contoh**, akan digunakan agregasi dari variabel `mem_total` 
```sh
fileforfetch=$(date -d '1 hour ago' "+%Y%m%d%H")
min_mem_total=$(awk -F "," '/home/ {print $1}' /home/$user/log/metrics_$fileforfetch*.log | sort -nk1 -t"," | head -1)
max_mem_total=$(awk -F "," '/home/ {print $1}' /home/$user/log/metrics_$fileforfetch*.log | sort -r -nk1 -t"," | head -1)
avg_mem_total=$(bc<<<"scale=1;("$max_mem_total" + "$min_mem_total")/2")
```
Terkait penamaan, `-d '1 hour ago'` digunakan untuk mengurangi waktu saat itu sebanyak satu jam. Sementara untuk penamaan sisanya secara berturut berupa tahun, bulan(angka), tanggal, dan jam yang secara lengkap telah disebutkan di [Soal 3a](#soal-3a) <br>
Pertama, digunakan fungsi awk untuk mengambil argumen pertama dari *file* metrics yang dibuat setiap satu menit. Karena setiap *file* metrics terdiri dari dua baris, hanya baris yang mengandung kata "home" akan dikembalikan argumen **ke-1nya** yang merupakan nilai dari `mem_total` dari *file* metrics yang terbuat setiap satu menit. Lalu sebelum fungsi diurutkan, ditambahkan `*` setelah `$fileforfetch`. Hal ini dikarenakan, melihat fungsi yang berjalan setiap sejam sekali pada menit ke-0, maka perlu dilakukan pengurangan satu jam dari waktu ketika `aggregate_minutes_to_hourly` dijalankan dan melihat bahwa *file* yang diagregasikan lebih dari satu. Setelahnya, dilakukan penyortiran dari secara *ascending* untuk mengambil nilai paling kecil dari `mem_total` yang merupakan nilai pertama (nk1) dan dibatasi dengan "," (t","). Karena hanya dibutuhkan satu nilai, maka digunakan `head -1` untuk mengambil nilai yang paling kecil dari hasil sortir.<br>
Untuk mengambil nilai paling besar dari `mem_total`, ada perubahan sortir yang tadinya secara *ascending*, menjadi *descending* (penambahan `-r` pada fungsi sort). Hal ini agar nilai yang paling besar dari hasil agregasi dapat diambil menggunakan `head -1`<br>
Untuk mengambil rata-rata, nilai dari  `min_mem_total` dan `max_mem_total` dijumlahkan dan dibagi dua. Lalu menggunakan bc, diambil ketelitian hingga terdapat satu angka di belakang koma.<br>
Setelah mendapat nilai-nilai secara keseluruhan, hasil dari variabel tersebut akan disimpan di 
```sh
user="nadnadine"
#Ganti sesuai nama user
path_saya="/home/$user/"
filename=$(date +'%Y%m%d%H')

$path_saya/log/metrics_agg_$filename.log
```
Dengan penamaan dari *file* tersebut sesuai dengan waktu ketika *script* dijalankan. <br>
Lalu untuk otomasi dari crontab, ditambahkan sebaris lagi untuk agregasi sehingga isi dari crontab secara keseluruhan menjadi
```
* * * * * /bin/bash /home/nadnadine/Documents/minute_log.sh
0 * * * * /bin/bash /home/nadnadine/Documents/aggregate_minutes_to_hourly_log.sh
```
`0 * * * *` berarti dijalankan setiap menit ke-0. Sementara pada bagian lain, telah dijelaskan di [Soal 3b](#soal-3b)<br>

### Soal 3d
Karena file log bersifat sensitif pastikan semua file log hanya dapat dibaca oleh user pemilik file.<br>
Pada file `minute_log.sh`,
```sh
chmod 400 /home/$user/log/metrics_$filename.log
```
Sedangkan pada file `aggregate_minutes_to_hourly_log.sh`,
```
chmod 400 /home/$user/log/metrics_agg_$filename.log
```
`chmod 400` yang diikuti dengan *filepath* digunakan agar user pemilik saja yang dapat membaca isi file.<br>

## Screenshots Hasil

- Proses Otomasi pada Crontab<br>
![Proses Cron](/Screenshots/crontab.PNG)
- Sampel contoh dari log <br>
![Hasil 2 file log permenit dan satu agregasi](/Screenshots/hasil%20log.PNG)
- Sampel salah satu log permenit <br>
![Result1](/Screenshots/hasil1.PNG)
![Result2](/Screenshots/hasil2.PNG)
- Sampel salah satu hasil agregasi<br>
![Aggregate](/Screenshots/aggregate.PNG)
