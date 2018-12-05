defmodule Links.Consumer do
  def consume(url) do
    url
    |> Links.Fetcher.fetch()
    |> Links.Parser.parse()
    |> own_site_only(url)
  end

  def own_site_only(links, url) do
    uri = URI.parse(url)

    links
    |> Stream.filter(&local?(uri.host, &1))
    |> Stream.map(&expand_url(uri, &1))
    |> Stream.uniq()
    |> Enum.sort()
  end

  def local?(host, link_url) do
    uri = URI.parse(link_url)
    is_nil(uri.host) || uri.host == host
  end

  def expand_url(parent_uri, url) do
    uri = URI.parse(url)

    cond do
      is_nil(uri.host) ->
        parent_uri
        |> Map.put(:path, uri.path || parent_uri.path)
        |> Map.put(:fragment, uri.fragment)
        |> URI.to_string()

      true ->
        URI.to_string(uri)
    end
  end
end
