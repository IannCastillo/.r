#!/usr/bin/gnuplot

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#++  GRAFICA LOS CASOS CON ALPHA 2.0,2.05,2.1,2.15,2.2,2.25,2.3,2.35,2.4,2.45 Y 2.5. ++ 
#++  12 NOV 2024. Ejemplo                                        ++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#========= plot with circles in 3D (only for gnuplot >=5.4) ======
reset session

#set terminal qt persist enhanced "Helvetica,20"
#set terminal postscript enhanced color solid "Helvetica, 16"
#set output 'circles-fractal.eps'


set datafile separator ','

set palette rgb 33,13,10
set view equal xy #z
set tics 1
set size ratio 1
unset colorbox

unset key

set xrange [-1:1]
set yrange [-1:1]
set multiplot layout 1,2
# GRAFICA 1 =========================================================
     
plot 'alphas/c3.csv' every 5::2 u 2:3:4:5 w circles lw 2 lc palette,\
     'alphas/c3.csv' every 5::3 u 2:3:4:5 w circles lw 1.5  lc palette,\
     'alphas/c3.csv' every 5::4 u 2:3:4:5 w circles lw 1.5  lc palette,\
     'alphas/c3.csv' every 5::5 u 2:3:4:5 w circles lw 1.5  lc palette,\
     'alphas/c3.csv' every 5::6 u 2:3:4:5 w circles lw 1.5  lc palette,\
     'alphas/c3.csv' every 5::1::1 u 2:3:4:5 w circles lw 1.5 lc -1
     
# GRAFICA 2 ========================================================

set xtics font "Arial,12"
set ytics font "Arial,12"
set label 1 "(f)" at -0.7,0.7 font "Arial, 18" front     
              
                  
plot [-1:1][-1:1] 'alphas/a2.3.csv'  u ($5<0 ? $3:1/0):4:(abs($5)):6 w circles dt " -" lw 1.5 lc palette,\
                  'alphas/a2.3.csv'  u ($5>0 ? $3:1/0):4:5:6 w circles lw 2 lc palette
 
     
### ----------------------------------------------- end of code

