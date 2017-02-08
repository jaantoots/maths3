set terminal epslatex size 28cm,17.5cm color standalone "" 10

set output "Z_n_strong.tex"
set format x "$%g$"
set format y "$%g$"

z(l,x) = (1/(2*sqrt(pi))) * ((-1)**l / l!) * (6/x)**((l/2.) + 1/4.) * gamma((l/2.) + 1/4.)

set xlabel '$\lambda$'
set ylabel '$\mathcal{Z}$'
set xrange [0:1]
set yrange [0:2]
set samples 1025
set key right top maxrows 32

set multiplot
set parametric
plot 0.1,t ls 0 notitle
unset parametric
plot for [n=1:128] '+' using 1:(sum [l=0:n] z(l, $1)) with lines title sprintf("$n = %d$", n)
unset multiplot

set output
