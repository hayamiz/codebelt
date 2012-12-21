set term postscript enhanced color "NimbusRomNo9L-Regu" 15 fontfile "../utmr8a.pfb" fontfile "../usyr.pfb"
set xrange [0:24*60*60/16-20]
set yrange [0:]
set size 0.5, 0.5
set xlabel "elapsed time [sec]" # 0.0,1.5
set lmargin 6

# set xtics ("1h" 3600, "2h" 3600*2, "3h" 3600*3)

# set style line 1 lt 8 lw 5 lc 0
# set style line 2 lt 2 lw 4 lc 3
# set style line 3 lt 5 lw 4 lc 2
# set style line 4 lt 1 lw 4 lc 1

# set style line 1 lt 8 lw 5 lc 0
# set style line 2 lt 5 lw 4 lc rgb "pink"
# set style line 3 lt 1 lw 4 lc rgb "blue"
# set style line 4 lt 4 lw 4 lc rgb "green"

set style line 1 lt 8 lw 5 lc 0
set style line 2 lt 1 lw 4 lc rgb "#ff7777"
set style line 3 lt 5 lw 4 lc rgb "#0000aa"
set style line 4 lt 3 lw 4 lc rgb "#55ff55"

xoffset = 30

set key left bottom
set output "power.eps"
set yrange [0:190]
set ylabel "power consumption [W]" offset 2.0,0.0
plot "t-power-lpf.dat" using ($1-xoffset):2 index 0:0 wi lines ls 2 ti "Fixed frequency", \
     "t-power-lpf.dat" using ($1-xoffset):2 index 1:1 wi lines ls 3 ti "RT-based policy", \
     "t-power-lpf.dat" using ($1-xoffset):2 index 3:3 wi lines ls 4 ti "TP-based policy"

set key right bottom
set output "freq.eps"
set yrange[0:3.0]
set ytics ("2.66" 2.66, "2.13" 2.13, "1.60" 1.60) font "NimbusRomNo9L-Regu,14"
set ylabel "frequency [GHz]" offset 2.0,0.0
plot "t-freq.dat" using ($1-xoffset):($2/1000000) index 0:0 wi lines ls 2 ti "Fixed frequency", \
     "t-freq.dat" using ($1-xoffset):($2/1000000) index 1:1 wi lines ls 3 ti "RT-based policy", \
     "t-freq.dat" using ($1-xoffset):($2/1000000) index 3:3 wi lines ls 4 ti "TP-based policy"

set arrow 1 from 0,40000 to 5400,40000 nohead lc 0 lt 3 lw 1.5
set arrow 2 from 400,35000 to 180,39000 lc 0 lt 1 lw 2
set label 1 at 400,33500 "T_{th}"

set arrow 3 from 0,44000 to 5400,44000 nohead lc 0 lt 3 lw 1.5
set arrow 4 from 790,50000 to 400,45000 lc 0 lt 1 lw 2
set label 2 at 800,50000 "T_{th}{/StandardSymL \264}overspeed\\_ratio"

set key right bottom
set output "mqth.eps"
set yrange [0:55000]
set ytics auto font "NimbusRomNo9L-Regu,10"
set ylabel "throughput [tpmC]" offset 3.8,0.0 font "NimbusRomNo9L-Regu,13"
plot "t-mqth-lpf.dat" using ($1-xoffset):2 index 0:0 wi lines ls 2 ti "Fixed frequency", \
     "t-mqth-lpf.dat" using ($1-xoffset):2 index 1:1 wi lines ls 3 ti "RT-based policy", \
     "t-mqth-lpf.dat" using ($1-xoffset):2 index 3:3 wi lines ls 4 ti "TP-based policy"

set key right bottom
set output "arrival-mqth.eps"
set yrange [0:55000]
set ytics auto font "NimbusRomNo9L-Regu,10"
set ylabel "throughput [tpmC]" offset 3.8,0.0 font "NimbusRomNo9L-Regu,13"
plot "t-mqth-lpf.dat" using ($1-xoffset):2 index 5:5 wi lines ls 1 ti "Arrival rate {/StandardSymL l}", \
     "t-mqth-lpf.dat" using ($1-xoffset):2 index 0:0 wi lines ls 2 ti "Fixed frequency", \
     "t-mqth-lpf.dat" using ($1-xoffset):2 index 1:1 wi lines ls 3 ti "RT-based policy", \
     "t-mqth-lpf.dat" using ($1-xoffset):2 index 3:3 wi lines ls 4 ti "TP-based policy"

set key right bottom
set output "arrival-rate.eps"
set yrange [0:55000]
set ytics auto font "NimbusRomNo9L-Regu,10"
# set format y "%5.0l x 10^{%L}"
set ylabel "throughput [tpmC]" offset 4.0,0.0 font "NimbusRomNo9L-Regu,14"
plot "t-mqth-lpf.dat" using ($1-xoffset):2 index 5:5 wi lines ls 4 ti "Arrival rate {/StandardSymL l}"

unset arrow
unset label

r_up = 20 * 0.8
r_down = 20 * 0.6
r_th = 20

label_x = 400

set arrow 1 from 0,r_down to 5400,r_down nohead lc 0 lt 3 lw 1.5
set arrow 2 from 0,r_up to 5400,r_up nohead     lc 0 lt 3 lw 1.5

set label 2 at label_x,26 "R_{th}{/StandardSymL \264}R\\_up\\_ratio"
set arrow 4 from label_x-30,25 to label_x-250,r_up+0.5

set label 1 at label_x+300,22 "R_{th}{/StandardSymL \264}R\\_down\\_ratio"
set arrow 3 from label_x+300,21 to label_x,r_down+0.5

set arrow 5 from 0,r_th to 5400,r_th nohead     lc 0 lt 3 lw 1.5

set label 3 at label_x+2200,28 "R_{th}"
set arrow 6 from label_x+2450,26.3 to label_x+2900,r_th

set key right bottom font "NimbusRomNo9L-Regu,13"

set output "rt.eps"
set yrange [0:*]
set ylabel "response time [msec]" offset 2.0,0.0
plot "t-rt.dat" using ($1-xoffset):2 index 0:0 wi lines ls 2 ti "Fixed frequency", \
     "t-rt.dat" using ($1-xoffset):2 index 1:1 wi lines ls 3 ti "RT-based policy", \
     "t-rt.dat" using ($1-xoffset):2 index 3:3 wi lines ls 4 ti "TP-based policy"

set output "rt-lpf.eps"
set yrange [0:*]
set ylabel "response time [msec]" offset 2.0,0.0
plot "t-rt-lpf.dat" using ($1-xoffset):2 index 0:0 wi lines ls 2 ti "Fixed frequency", \
     "t-rt-lpf.dat" using ($1-xoffset):2 index 1:1 wi lines ls 3 ti "RT-based policy", \
     "t-rt-lpf.dat" using ($1-xoffset):2 index 3:3 wi lines ls 4 ti "TP-based policy"

set ytics 5
set grid
set key left top
set output "power-zoom.eps"
set yrange [130:190]
set ylabel "power consumption [W]" offset 2.0,0.0
plot "t-power-lpf.dat" using ($1-xoffset):2 index 0:0 wi lines ls 2 ti "Fixed frequency", \
     "t-power-lpf.dat" using ($1-xoffset):2 index 1:1 wi lines ls 3 ti "RT-based policy", \
     "t-power-lpf.dat" using ($1-xoffset):2 index 3:3 wi lines ls 4 ti "TP-based policy"

