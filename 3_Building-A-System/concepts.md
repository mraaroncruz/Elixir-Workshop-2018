## New Concepts

### The pipe operator `|>`

One thing that is wonderful about Elixir is the pipe operator. It is very simple and elegant.

It says, take the previous output from the previous expression and throw it in as the first argument of the next expression.

**Javascript**

```js
const double = (n) => n * 2
const square = (n) => n * n
const upTo = (n) => {
    let arr = []
    for(let i = 0; i <= n; i++) {
        arr.push(i)
    }
    return arr
}

console.log(upTo(square(double(2))))

```



**Elixir**

```elixir
defmodule Numbers do
  def double(n), do: n * 2
  def square(n), do: n * n
  def up_to(n), do: Enum.to_list(0..n)
end

import Numbers

2 |> double |> square |> up_to |> IO.inspect

```


And since a lot of what you're doing in Elixir is manipulating lists, this makes code so much more readable.

-------------

#### [To the exercise >>](./concrete_practice.md)

