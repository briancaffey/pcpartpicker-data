#!/use/bin/env bash

counter=70
while read NAME; do
    echo "[STATUS] Scraping build number $counter: $NAME..."
    file="new_build-"${NAME//\/b\//$counter-}
    phantomjs scrape_build.js "https://pcpartpicker.com$NAME" > builds/$file.txt
	result=$(python -c "import random;print(random.uniform(2.5, 4.4))")
	echo "[STATUS] Completed scraping build number $counter ($NAME). Sleeping for $result seconds..."
	sleep $result
    ((counter += 1))
done < new_links2.txt