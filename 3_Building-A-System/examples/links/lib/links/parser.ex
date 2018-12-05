defmodule Links.Parser do
  def parse(html) do
    html
    |> Floki.find("a")
    |> Floki.attribute("href")
  end
end
