#!/use/bin/env bash

for i in `seq 20` #of pages for a given part`;
do 
	phantomjs scrape_all.js "https://pcpartpicker.com/products/monitor/#page="$i > pages/pages_$i.txt
	result=$(python -c "import random;print(random.uniform(3.5, 4.5))")
	echo "[STATUS] Completed scraping page number $i. Sleeping for $result seconds..."
	sleep $result
done
	
