set terminal epslatex color standalone "" 10

set output "Z_n_lambda.tex"
set format x "$%g$"
set format y "$%g$"

z(l,x) = (-x/4!)**l * (4*l)!/(4**l * (2*l)! * l!)

set xlabel '$\lambda$'
set ylabel '$\mathcal{Z}$'
set key left bottom maxrows 16
set xrange [0:0.2]
set yrange [0.975:1]
plot for [n=1:32] '+' using 1:(sum [l=0:n] z(l, $1)) with lines title sprintf("$n = %d$", n)

set output
