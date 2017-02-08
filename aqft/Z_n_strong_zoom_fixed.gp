set terminal epslatex size 16cm,10cm color standalone "" 10

set output "Z_n_strong_zoom_fixed.tex"
set format x "$%g$"
set format y "$%g$"

z(l,x) = (1/(2*sqrt(pi))) * ((-1)**l / l!) * (6/x)**((l/2.) + 1/4.) * gamma((l/2.) + 1/4.)

set xlabel '$n$'
set ylabel '$\mathcal{Z}_n\left(\lambda=\frac{1}{10}\right)$'
# gnuplot breaks if n>98
set xrange [90:98]
set yrange [0.9882:0.9885]
set samples 9
plot '+' using 1:(sum [l=0:floor($1)] z(l, 0.1)) with points notitle

set output
