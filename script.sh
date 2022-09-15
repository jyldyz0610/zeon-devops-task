#!/bin/bash
echo "spisok Unikalniy IP address"
cat ./nginx.access.log| awk '{print $1}'| uniq 
echo "\\nKolichestvo  IP";
cat ./nginx.access.log| awk '{print $1}'| uniq -c | sort -n

echo "\nKolichestvo Apple klientov: $(cat nginx.access.log | grep Apple | wc -l)"
echo "Kolichestvo Windows klientov: $(cat nginx.access.log | grep -i Windows  | wc -l )"
echo "Kolichestvo Linux klientov: $(cat nginx.access.log | grep -i Linux | wc -l)"

echo "\nKolichestvo Uspeshnih zaprosov: $(cat nginx.access.log | grep 200 | wc -l)"
echo "Kolichestvo zaprosov s oshibkami: $(cat nginx.access.log | grep -v 200 | wc -l)"
