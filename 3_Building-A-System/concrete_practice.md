## Exercise — An HTML Link Parser

We'll be building a system of a few files that rely on each other. We'll use the mix project from the previous section.

### Project Namespacing

The convention in Elixir is to namespace your modules by folder names. But namespaces don't actually mean anything.

A namespace is just an Elixir atom. It is completely arbitrary. But we like good conventions so we will create a structure that looks like this.

```bash
├── lib
│   ├── links
│   │   ├── fetcher.ex
│   │   ├── parser.ex
│   │   └── runner.ex
│   └── links.ex
```

These files will have modules named:

- `Links.Fetcher`
- `Links.Parser`
- `Links.Runner`

### The API

`Links.Fetcher`

- `fetch/1` - takes a url string and returns either an HTML body on success or nil on error. Log the error with the `Logger` module.

`Links.Parser`

- `parse/1` - takes a string that represents an HTML body and returns a list of all of the links on the page. Returns an empty list on nil or bad input. Try to break it.

`Links.Runner`

- `scrape/1` - takes a url string and returns a list of urls that belong to the host of the url that was your argument

### Hints

- Elixir's standard library has a URI module with a `parse/1` function
- The standard library `Enum` module can do most things you need to do with lists (mapping, reducing, filtering, splitting, etc.) Google it!

---

#### [Conclusions >>](./conclusions.md)
