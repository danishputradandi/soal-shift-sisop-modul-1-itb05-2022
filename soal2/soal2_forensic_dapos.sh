#!bin/bash
mkdir -p forensic_log_website_daffainfo_log 

awk -F: 'END {printf"Rata-rata serangan adalah sebanyak %f request per jam.",(NR-1)/12}' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/ratarata.txt

awk -F: '{ip_address[$1]++} END {for (ip in ip_address) printf "%s : %d\n", ip, ip_address[ip];}' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt

awk -F: '{if (ip[$1] ++ >= maksimal) maksimal = ip [$1]} END {for (i in ip) if(maksimal == ip [i]) printf "\nIP yang paling banyak mengakses server adalah %s sebanyak %d request \n\n", i, ip[i]}' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt

awk -F: 'BEGIN { print "Ada berapa request yang menggunakan user-agent \"curl\"?"} /curl/ { ++n } END { print "User-agent \"curl\" ada sebanyak ", n, "\n\n"}' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt

awk -F: '$3 == "02" {print $1}' log_website_daffainfo.log >> forensic_log_website_daffainfo_log/result.txt
