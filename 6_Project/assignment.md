## The Assignment

The assignment is to do something to improve the spider.

- [ ] \* Turn `Links.List` into a [GenServer](https://elixirschool.com/en/lessons/advanced/otp-concurrency/) and [Supervise](https://elixirschool.com/en/lessons/advanced/otp-supervisors/) it. (also supervise the scrapers (look at [Task.Supervisor](https://hexdocs.pm/elixir/Task.Supervisor.html)))
- [ ] Set the link depth - how many levels deep it can go on a page
- [ ] Follow robots.txt rules
- [ ] \* Index the bodies in a search engine like ElasticSearch or PostgreSQL
- [ ] Rate limit it per domain so it doesn't perform a Denial of Service on the sites it is scraping
- [ ] \* Store results in a database and make it queriable from the `Links.List` or from somewhere else [Ecto, database adapter](https://github.com/elixir-ecto/ecto). A process can hide storage implementation details.
- [ ] Write a sitemap.xml in Google's format for the sites that are indexed
- [ ] \* Create basic Phoenix app to do searches on your links (search indexed or just simply filtered)

> \* means I think they are the more interesting solutions
