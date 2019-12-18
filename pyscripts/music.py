from bs4 import BeautifulSoup
import requests

pitchfork = requests.get("https://pitchfork.com/best/")
pitchfork.raise_for_status()
p4ksoup = BeautifulSoup(pitchfork.text, "lxml")

bigauth = p4ksoup.select(".bnm-hero__artist .artist-list li")[0].getText()
bigalbum = p4ksoup.select(".bnm-hero__title")[0].getText()
imglink = "https://pitchfork.com" + p4ksoup.select(".bnm-hero__link-block")[0].get(
    "href"
)
reviewpage = requests.get(imglink)
reviewpage.raise_for_status()
reviewsoup = BeautifulSoup(reviewpage.text, "lxml")
bigtime = reviewsoup.select(".article-meta .pub-date")[0].getText()
print(f"{bigauth} - {bigalbum} ({bigtime})")

for index in range(0, 6):
    author = p4ksoup.select(".bnm-small .artist-list li")[index].getText()
    album = p4ksoup.select(".bnm-small .title")[index].getText()
    imglink = "https://pitchfork.com" + p4ksoup.select(".bnm-small .link-block")[
        index
    ].get("href")
    reviewpage = requests.get(imglink)
    reviewpage.raise_for_status()
    reviewsoup = BeautifulSoup(reviewpage.text, "lxml")
    time = reviewsoup.select(".article-meta .pub-date")[0].getText()
    print(f"{author} - {album} ({time})")
print("")

needledrop = requests.get("https://www.theneedledrop.com/loved-list/")
needledrop.raise_for_status()
ndsoup = BeautifulSoup(needledrop.text, "lxml")

for index in range(0, 7):
    albumline = ndsoup.select(
        ".sqs-block .sqs-block-content a")[index].getText()
    reviewlink = ndsoup.select(
        ".sqs-block .sqs-block-content a")[index].get("href")
    reviewpage = requests.get(reviewlink)
    reviewpage.raise_for_status()
    reviewsoup = BeautifulSoup(reviewpage.text, "lxml")
    date = reviewsoup.select(".entry-header-date-link")[0].getText()
    print(f"{albumline} ({date})")
