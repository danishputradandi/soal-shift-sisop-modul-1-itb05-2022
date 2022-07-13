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

