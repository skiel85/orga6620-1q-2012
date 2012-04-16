rm temp/*
rm tp0
gcc -Wall -Wextra -O0 -g ../src/tp0.c ../src/manejoes.c ../src/sort.c -o tp0

echo "Tiempos para el merge sort. Archivos aleatorios"
time ./tp0 -m files/random100 > files/random100-mergesort
time ./tp0 -m files/random200 > files/random200-mergesort
time ./tp0 -m files/random400 > files/random400-mergesort
time ./tp0 -m files/random800 > files/random800-mergesort
time ./tp0 -m files/random1600 > files/random1600-mergesort
time ./tp0 -m files/random3200 > files/random3200-mergesort
time ./tp0 -m files/random6400 > files/random6400-mergesort
time ./tp0 -m files/random12800 > files/random12800-mergesort
time ./tp0 -m files/random25600 > files/random25600-mergesort
#time ./tp0 -m files/random51200 > files/random51200-mergesort
#time ./tp0 -m files/random102400 > files/random102400-mergesort
#time ./tp0 -m files/random204800 > files/random2048-mergesort
#time ./tp0 -m files/random819200 > files/random819200-mergesort

echo "Tiempos para el selection sort. Archivos aleatorios"
time ./tp0 -s files/random100 > files/random100-selectionsort
time ./tp0 -s files/random200 > files/random200-selectionsort
time ./tp0 -s files/random400 > files/random400-selectionsort
time ./tp0 -s files/random800 > files/random800-selectionsort
time ./tp0 -s files/random1600 > files/random1600-selectionsort
time ./tp0 -s files/random3200 > files/random3200-selectionsort
time ./tp0 -s files/random6400 > files/random6400-selectionsort
time ./tp0 -s files/random12800 > files/random12800-selectionsort
time ./tp0 -s files/random25600 > files/random25600-selectionsort
#time ./tp0 -s files/random51200 > files/random51200-selectionsort
#time ./tp0 -s files/random102400 > files/random102400-selectionsort
#time ./tp0 -s files/random204800 > files/random2048-selectionsort
#time ./tp0 -s files/random819200 > files/random819200-selectionsort

echo "Comparo para comprobar que ambos ordenamiendos hayan dado igual"
diff files/random100-mergesort files/random100-selectionsort
diff files/random200-mergesort files/random200-selectionsort
diff files/random400-mergesort files/random400-selectionsort
diff files/random800-mergesort files/random800-selectionsort
diff files/random1600-mergesort files/random1600-selectionsort
diff files/random3200-mergesort files/random3200-selectionsort
diff files/random6400-mergesort files/random6400-selectionsort
diff files/random12800-mergesort files/random12800-selectionsort
diff files/random25600-mergesort files/random25600-selectionsort
#diff files/random51200-mergesort files/random51200-selectionsort
#diff files/random102400-mergesort files/random102400-selectionsort
#diff files/random204800-mergesort files/random2048-selectionsort
#diff files/random819200-mergesort files/random819200-selectionsort 

