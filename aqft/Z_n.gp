set terminal epslatex size 16cm,10cm color standalone "" 10

set output "Z_n.tex"
set format x "$%g$"
set format y "$%g$"

z(l,x) = (-x/4!)**l * (4*l)!/(4**l * (2*l)! * l!)

set xlabel '$n$'
set ylabel '$\mathcal{Z}_n\left(\lambda=\frac{1}{10}\right)$'
set xrange [0:40]
set yrange [0.9882:0.9885]
set samples 41
plot '+' using 1:(sum [l=0:floor($1)] z(l, 0.1)) with points notitle

set output
