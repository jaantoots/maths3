set terminal postscript eps color

set output "Z_n.eps"

z(l,x) = (-x/4!)**l * (4*l)!/(4**l * (2*l)! * l!)

set xrange [0:40]
set yrange [0.9882:0.9885]
set samples 41
plot '+' using 1:(sum [l=0:floor($1)] z(l, 0.1)) with points notitle

set output
