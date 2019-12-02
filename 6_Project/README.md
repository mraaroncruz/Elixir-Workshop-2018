## The Project - A web spider

You will build a web spider.

It will take a seed url and scrape the content and the links from the page and keep going deeper into the web until you stop it.

### Somewhere to start

`Links.Spider`

`start(seed_url)` - Starts spidering the WWW

`Links.Spider` should start in its own process (so it doesn't block when running)

Links are added to `Links.List` as they are found.

---

- the links should be held in the `Links.List` and be queriable
- It's ok to just run this from iex

### Some ways to improve it

The assignment is to do two of these things to improve the spider.

> \* means I think they are the more interesting solutions

- [ ] \* Turn `Links.List` into a [GenServer](https://elixirschool.com/en/lessons/advanced/otp-concurrency/) and [Supervise](https://elixirschool.com/en/lessons/advanced/otp-supervisors/) it. (also supervise the scrapers (look at [Task.Supervisor](https://hexdocs.pm/elixir/Task.Supervisor.html)))
- [ ] Set the link depth - how many levels deep it can go on a page
- [ ] Follow robots.txt rules
- [ ] \* Index the bodies in a search engine like ElasticSearch or Postgresql
- [ ] Rate limit it per domain so it doesn't Denial of Service the sites it's scraping
- [ ] \* Store results in a database and make it queriable from the `Links.List` or from somewhere else [Ecto, database adapter](https://github.com/elixir-ecto/ecto). A process can hide storage implementation details.
- [ ] Write a sitemap.xml in Google's format for the sites that are indexed
- [ ] \* Create basic Phoenix app to do searches on your links (search indexed or just simply filtered)
