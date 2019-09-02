# 抓取谷歌新闻链接中包含"articles"的新闻，
# 然后把标题和链接写入csv文件
import urllib.request
import csv
from bs4 import BeautifulSoup
#指定csv文件路径，如果不存在会新建
savepath="D:/news.csv"
class Scraper:
    def __init__(self,site):
        self.site=site
    def scrape(self):
        r=urllib.request.urlopen(self.site)
        html=r.read()
        parser="html.parser"
        sp=BeautifulSoup(html,parser)
        with open(savepath) as f:
            w=csv.writer(f,delimiter=",")
            for tag in sp.find_all("a"):
                if tag.text=="":
                    continue
                url=tag.get("href")
                if url is None:
                    continue
                if "article" in url:
                    w.writerow([tag.text,news+url.lstrip("./")])

news = "https://news.google.com/"
Scraper(news).scrape()