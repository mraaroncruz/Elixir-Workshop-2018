defmodule Links.Fetcher do
  require Logger

  def fetch(url) do
    case HTTPoison.get(url) do
      {:ok, res} ->
        res.body

      {:error, err} ->
        Logger.error("Error hitting url #{url}: #{err.reason}")
        nil
    end
  end
end
