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
				exit 1 
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

function dl(){
	read -p echo "Masukkan jumlah : " num
	
	if[[ ! -f "$file.zip" ]]
	then
		mkdir $file
		total=0
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

