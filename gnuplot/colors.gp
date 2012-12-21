color_list="grey10 gray20 grey20 gray30 grey30 gray40 grey40 gray50 \
grey50 gray60 grey60 gray70 grey70 gray80 grey80 gray90 grey90 gray100 grey100 \
gray grey light-gray light-grey dark-gray dark-grey red light-red dark-red \
yellow light-yellow dark-yellow green light-green dark-green spring-green \
forest-green sea-green blue light-blue dark-blue midnight-blue navy \
medium-blue royalblue skyblue cyan light-cyan dark-cyan magenta light-magenta \
dark-magenta turquoise light-turquoise dark-turquoise pink light-pink \
dark-pink coral light-coral orange-red salmon light-salmon dark-salmon \
aquamarine khaki dark-khaki goldenrod light-goldenrod dark-goldenrod gold \
beige brown orange dark-orange violet dark-violet plum purple"

color_list_16="#1a1a1a #333333 #333333 #4d4d4d #4d4d4d #666666 #666666 #7f7f7f \
#7f7f7f #999999 #999999 #b3b3b3 #b3b3b3 #cccccc #cccccc #e5e5e5 #e5e5e5 \
#ffffff #ffffff #bebebe #bebebe #d3d3d3 #d3d3d3 #a9a9a9 #a9a9a9 #ff0000 \
#f03232 #8b0000 #ffff00 #ffffe0 #c8c800 #00ff00 #90ee90 #006400 #00ff7f \
#228b22 #2e8b57 #0000ff #add8e6 #00008b #191970 #000080 #0000cd #4169e1 \
#87ceeb #00ffff #e0ffff #008b8b #ff00ff #f055f0 #8b008b #40e0d0 #afeeee \
#00ced1 #ffc0cb #ffb6c1 #ff1493 #ff7f50 #f08080 #ff4500 #fa8072 #ffa07a \
#e9967a #7fffd4 #f0e68c #bdb76b #daa520 #eedd82 #b8860b #ffd700 #f5f5dc \
#a52a2a #ffa500 #ff8c00 #ee82ee #9400d3 #dda0dd #a020f0"

num2col(n)=word(color_list, n)
num2col16(n)=word(color_list_16, n)

set multiplot

#色名の一覧を作る
set tmargin 0
set origin 0,0
set xrange [0:1]
set yrange [0:1]
set format x ""
set format y ""
unset xtics
unset ytics
set border 0
set key default
plot for [i=1:words(color_list)] 1/0 w l lw 10 lt 1 lc rgb num2col(i) title num2col(i)." = {/Courier ".num2col16(i)."}"
unset label 100

set key samplen 0.4 bottom center inside width -0.3

#Pointの種類の一覧を作る
set tmargin 39.5
set bmargin 2
plot for [i=0:100] 1/0 w p ps 1 lw 1 lt 1 lc i pt i\
     title sprintf("{/Arial %d}",i)

unset multiplot

if (exist("TERM")==0 || TERM eq "WIN") TERM="PS";\
     set out "colorname-list.eps";\
     set term post enhanced color "Arial" 13.5 portrait;\
     reread;

TERM="WIN"
set term win
set out
