gcc -Wall -c -pg ../src/tp0.c ../src/manejoes.c ../src/sort.c
gcc -Wall -pg tp0.o manejoes.o sort.o

echo "GPROF selection sort 204800 bytes."
./a.out -s files/random204800 > tmp
gprof a.out > gprof-selection-sort

echo "GPROF merge sort 6553600 bytes."
./a.out -m files/random6553600 > tmp
gprof a.out > gprof-merge-sort




