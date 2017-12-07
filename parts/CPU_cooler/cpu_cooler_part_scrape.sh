#!/use/bin/env bash

counter=1
while read NAME; do
    echo "[STATUS] Scraping build number $counter: $NAME..."
    file="cpu-cooler-$counter"
    phantomjs scrape_all.js "https://pcpartpicker.com$NAME" > parts/$file.txt
	result=$(python -c "import random;print(random.uniform(0.3, 1.0))")
	echo "[STATUS] Completed scraping build number $counter ($NAME). Sleeping for $result seconds..."
	sleep $result
    ((counter += 1))
done < parts/cpu_cooler_links.txt