defmodule LinksTest do
  use ExUnit.Case
  doctest Links

  test "greets the world" do
    assert Links.hello() == :world
  end
end
