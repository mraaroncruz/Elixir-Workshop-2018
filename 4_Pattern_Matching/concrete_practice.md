## Exercise - Play around

Open up iex and start matching.

- create some `case` statements

- write a module that has default function bodies or match on a string argument. For example:

  ```elixir
  def status("invalid"), do: IO.puts("This is invalid")
  def status("error"), do: IO.puts("you've got an error here")
  def status(the_status), do: IO.puts("I don't know what this #{the_status} is :S")
  ```

- That's it. Fiddle with it!