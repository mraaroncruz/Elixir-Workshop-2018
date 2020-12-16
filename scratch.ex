defmodule Todo do
  def add(%{} = todo) do
    IO.puts("It is a todo")
  end

  def add({first_thing, second_thing}) do
    IO.puts(first_thing)
  end

  def add(whatever_this_is) do
    IO.puts("This thing is weird: #{inspect(whatever_this_is)}")
  end
end
