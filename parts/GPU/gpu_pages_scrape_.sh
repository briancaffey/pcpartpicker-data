#!/use/bin/env bash

counter=277
while read NAME; do
    echo "[STATUS] Scraping build number $counter: $NAME..."
    file="gpu-$counter"
    phantomjs scrape_all.js "https://pcpartpicker.com$NAME" > gpu_parts/$file.txt
	result=$(python -c "import random;print(random.uniform(2.5, 4.4))")
	echo "[STATUS] Completed scraping build number $counter ($NAME). Sleeping for $result seconds..."
	sleep $result
    ((counter += 1))
done < parts/gpu_links_1.txt