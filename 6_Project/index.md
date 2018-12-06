## The Project - A web spider

You will build a web spider.

It will take a seed url and scrape the content and the links from the page and keep going deeper into the web until you stop it.

### Somewhere to start

`Links.Spider`

`start(seed_url)` - Starts spidering the WWW

--------

- the links should be held in the `Links.List` and be queriable
- It's ok to just run this from iex



### Some ways to improve it

The assignment is to do one of these things to improve the spider.

- [ ] Set the link depth - how many levels deep it can go on a page
- [ ] Index the bodies in a search engine like ElasticSearch or Postgresql
- [ ] Rate limit it per domain so it doesn't Denial of Service the sites it's scraping
- [ ] Store results in a database and make it queriable from the `Links.List` or from somewhere else
- [ ] Write a sitemap.xml in Google's format for the sites that are indexed