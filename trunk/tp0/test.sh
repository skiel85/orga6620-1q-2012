gcc -Wall -Wextra -O0 -g main.c -o tp0
rm temp/*

echo "Ordenar números con selection sort."
echo -n "9876543210" > temp/digits.source
echo -n "0123456789" > temp/digits.expected
./tp0 -s temp/digits.source > temp/digits.actual
diff temp/digits.expected temp/digits.actual

echo "Ordenar números con merge sort."
echo -n "9876543210" > temp/digits.source
echo -n "0123456789" > temp/digits.expected
./tp0 -m temp/digits.source > temp/digits.actual
diff temp/digits.expected temp/digits.actual

echo "Ordenar letras con selection sort."
echo -n "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ" > temp/letters.source
echo -n "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" > temp/letters.expected
./tp0 -s temp/letters.source > temp/letters.actual
diff temp/letters.expected temp/letters.actual

echo "Ordenar letras con merge sort."
echo -n "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ" > temp/letters.source
echo -n "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" > temp/letters.expected
./tp0 -m temp/letters.source > temp/letters.actual
diff temp/letters.expected temp/letters.actual

