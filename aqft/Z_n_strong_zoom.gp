set terminal epslatex size 24cm,15cm color standalone "" 10

set output "Z_n_strong_zoom.tex"
set format x "$%g$"
set format y "$%g$"

z(l,x) = (1/(2*sqrt(pi))) * ((-1)**l / l!) * (6/x)**((l/2.) + 1/4.) * gamma((l/2.) + 1/4.)

set xlabel '$\lambda$'
set ylabel '$\mathcal{Z}$'
set xrange [0:0.2]
set yrange [0.975:1]
set samples 1025
set key left top maxrows 32

set multiplot
set parametric
plot 0.1,t ls 0 notitle
unset parametric
# gnuplot breaks if n>98
plot for [n=41:98] '+' using 1:(sum [l=0:n] z(l, $1)) with lines title sprintf("$n = %d$", n)
unset multiplot

set output
