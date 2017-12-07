#!/use/bin/env bash

for i in `seq 24` #of pages for a given part`;
do 
	phantomjs scrape_all.js "http://pcpartpicker.com/products/motherboard/#page="$i > pages/pages_$i.txt
	result=$(python -c "import random;print(random.uniform(1.2, 1.5))")
	echo "[STATUS] Completed scraping page number $i. Sleeping for $result seconds..."
	sleep $result
done