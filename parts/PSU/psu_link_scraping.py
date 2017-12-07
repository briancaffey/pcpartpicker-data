import os
import pandas as pd
from bs4 import BeautifulSoup


os.chdir('/Users/andrewcaffey/Documents/Projects/Data/PCPP/Part_Scraping/PSU/pages/')
all_links = []
for i in os.listdir(os.getcwd()):
    text = open(i, "r")
    html = text.read()
    b = BeautifulSoup(html)
    links = b.find_all('td', attrs={"class":"tdname"})
    #print links
    for a in links: 
        path = a.find('a')['href']
        print path
        all_links.append(path)
    text.close()
os.chdir('/Users/andrewcaffey/Documents/Projects/Data/PCPP/Part_Scraping/PSU/parts/')
url_file = open('psu_links.txt', 'a')
for x in all_links:
    url_file.write('%s\n' % x)
url_file.close()