#!/bin/bash

# rorate 90 for gnuplot graphs
convert -density 200 -rotate 90 FILE1 FILE2

# rorate 90 for gnuplot graphs, and fill background with white
convert -background white -density 200 -rotate 90 FILE1 FILE2

# rorate 90 for gnuplot graphs, and fill background with HEX color spec (#FFFF00 = yellow here)
convert -background '#ffff00' -density 200 -rotate 90 FILE1 FILE2

# rorate 90 for gnuplot graphs, and disable alpha channel
convert -alpha Off -density 200 -rotate 90 FILE1 FILE2