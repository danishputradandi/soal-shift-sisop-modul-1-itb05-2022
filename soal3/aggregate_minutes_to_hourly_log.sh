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
