#!/use/bin/env bash

for i in `seq 1 175`;
do 
	phantomjs production.js "https://pcpartpicker.com/builds/#page="$i > new_pages/pages_$i.txt
	result=$(python -c "import random;print(random.uniform(2.1, 3.4))")
	sleep $result
done