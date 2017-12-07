#!/use/bin/env bash

counter=1
while read NAME; do
    echo "[STATUS] Scraping build number $counter: $NAME..."
    file="case-$counter"
    phantomjs scrape_all.js "https://pcpartpicker.com$NAME" > parts/$file.txt
	result=$(python -c "import random;print(random.uniform(1.5, 2.4))")
	echo "[STATUS] Completed scraping build number $counter ($NAME). Sleeping for $result seconds..."
	sleep $result
    ((counter += 1))
done < parts/case_links.txt