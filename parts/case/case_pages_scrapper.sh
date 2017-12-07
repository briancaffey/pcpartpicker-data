#!/use/bin/env bash

for i in `seq 28` #of pages for a given part`;
do 
	phantomjs scrape_all.js "http://pcpartpicker.com/products/case/#page="$i > pages/pages_$i.txt
	result=$(python -c "import random;print(random.uniform(5.0, 6.0))")
	echo "[STATUS] Completed scraping page number $i. Sleeping for $result seconds..."
	sleep $result
done