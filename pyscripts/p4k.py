from bs4 import BeautifulSoup
import requests

site = requests.get("https://pitchfork.com/best/")
site.raise_for_status()
soup = BeautifulSoup(site.text, "lxml")

bigauth = soup.select(".bnm-hero__artist .artist-list li")[0].getText()
bigalbum = soup.select(".bnm-hero__title")[0].getText()
print(f"{bigauth} - {bigalbum}")

for index in range(0, 6):
    author = soup.select(".bnm-small .artist-list li")[index].getText()
    album = soup.select(".bnm-small .title")[index].getText()
    print(f"{author} - {album}")
