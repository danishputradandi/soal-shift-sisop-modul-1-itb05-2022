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
