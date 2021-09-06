openssl genrsa -out pass.txt 2048
echo "PASSWORD" | openssl rsautl -inkey pass.txt -encrypt >output.bin
openssl rsautl -inkey pass.txt -decrypt <output.bin
