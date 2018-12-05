## Elixir Todos

Elixir modules are just a grouping of related behaviour that manipulates data.

We will create a data structure to hold our todos, then use the functions in the `Todos` module to pass around this structure and return modified copies of it. To show more how this works, we'll use a basic data structure, a `Map` as our underlying `Todo` structure and a `List` as our `Todos`

```elixir
defmodule Todos do
  # Just return a basic list. We don't have to care about the underlying data structure
  # It is an implementation detail
  def new, do: []
  
  # You see here we pass in our todo list as the first argument
  def add(todos, description) do
  	todo = Todo.new
    [todo | todos]
  end
  
  def remove(todos, todo) do
    Enum.reject(todos, fn t -> t == todo end)
  end
  
  def to_s(todos) do
    IO.puts "## Our Todos ##"
    IO.puts "###############"
    Enum.each(todos, fn todo ->
      IO.puts "[#{if Todo.complete?(todo), do: 'x', else: ' '}] #{todo.description}"
    end)
    IO.puts "###############"
  end
end
```

And our Todo is very simple:

```elixir
defmodule Todo do
  def new(description) do
  	%{
      description: description,
      is_complete: false
  	}
  end
  
  def complete(todo)
    %{todo | is_complete: true }
  end
end
```

But now if we call `complete/1` on a `Todo`, it won't do anything to the item in the list.

## Demo

## Adding complete to Todos

One solution is to add complete to `Todos`:

```elixir
defmodule Todos do
  def complete(todos, complete_todo) do
    Enum.map(todos, fn todo ->
      if todo == complete_todo, do: Todo.complete(todo), else: todo
    end)
  end
end
```



## Advantages



## Complete Example

```elixir
defmodule Todo do
  def new(description) do
  	%{
      description: description,
      is_complete: false
  	}
  end
  
  def complete?(%{is_complete: is_complete}),
    do: is_complete
  
  def complete(todo) do
    %{todo | is_complete: true }
  end
end

defmodule Todos do
  # Just return a basic list. We don't have to care about the underlying data structure
  # It is an implementation detail
  def new, do: []
  
  # You see here we pass in our todo list as the first argument
  def add(todos, description) do
  	todo = Todo.new(description)
    [todo | todos]
  end
  
  def remove(todos, todo) do
    Enum.reject(todos, fn t -> t == todo end)
  end
  
  def to_s(todos) do
    IO.puts "## Our Todos ##"
    IO.puts "###############"
    
    Enum.each(todos, fn todo ->
      IO.puts "[#{if Todo.complete?(todo), do: 'x', else: ' '}] #{todo.description}"
    end)
    
    IO.puts "###############"
  end
  
  def complete(todos, complete_todo) do
    Enum.map(todos, fn todo ->
      if todo == complete_todo, do: Todo.complete(todo), else: todo
    end)
  end
end
```