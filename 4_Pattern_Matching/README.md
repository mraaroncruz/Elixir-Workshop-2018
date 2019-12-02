## Pattern Matching 
### Or, when = doesn't mean =

We have been using `=` to bind values to variables. But `=` in Elixir doesn't work the same as it does in most other languages.

```elixir
iex(1)> name = "bob"
"bob"

iex(2)> other_name = "clemens"
"clemens"

iex(3)> name == other_name
false

iex(4)> "bob" = name
"bob"

iex(5)> "bob" = other_name
** (MatchError) no match of right hand side value: "clemens"
```



You can also destructure data using pattern matching.

```elixir
iex(1)> a_tuple = {"bob", "clemens", "david"}
{"bob", "clemens", "david"}

iex(2)> {_, clemi, _} = a_tuple
{"bob", "clemens", "david"}

iex(3)> clemi
"clemens"
```



With lists you can capture arbitrary items, or you can capture the head and the tail.

```elixir
iex(1)> name_list = ["bob", "clemens", "david"]
["bob", "clemens", "david"]

iex(2)> [name1, name2, name3] = name_list
["bob", "clemens", "david"]

iex(3)> name1
"bob"

iex(4)> name2
"clemens"

iex(5)> name3
"david"

iex(6)> [first_name | other_names] = name_list
["bob", "clemens", "david"]

iex(7)> first_name
"bob"

iex(8)> other_names
["clemens", "david"]
```



And something really cool is matching on maps. You can just pull out the values you care about.

```elixir
iex(1)> user = %{username: "mraaroncruz", likes: 1_000_000_000, password: "secret"}
%{likes: 1000000000, password: "secret", username: "mraaroncruz"}

iex(2)> %{likes: like_count} = user
%{likes: 1000000000, password: "secret", username: "mraaroncruz"}

iex(3)> like_count
1000000000
```



And this works really nicely for module functions.

```elixir
defmodule UserPresenter do
  def like_count(%{likes: like_count}), do: like_count
end

iex(1)> user = %{username: "mraaroncruz", likes: 1_000_000_000, password: "secret"}
%{likes: 1000000000, password: "secret", username: "mraaroncruz"}

iex(2)> UserPresenter.like_count(user)
1000000000
```



And we can make alternative functions for default values.

> Note: order really matters. First matched is the winner.

In a language without pattern matching in function arguments, we might write this code:

```js
function likeCountForUser(user) {
  if (user.likes) {
    return user.likes
  } else {
    return "not_initialized"
  }
}
```

But we can write this code in Elixir:

```elixir
defmodule UserPresenter do
  def like_count(%{likes: nil}), do: :not_initialized
  def like_count(%{likes: like_count}), do: like_count
end

iex(1)> user = %{username: "mraaroncruz", password: "secret"}
%{password: "secret", username: "mraaroncruz"}

iex(2)> UserPresenter.like_count(user)
:not_initialized
```



### The case Statement

`case` is a conditional construct that pattern matches on the result.

```elixir
defmodule UserPresenter do
  require Logger
  
  def like_count(%{likes: like_count}), do: like_count
  def like_count(user), do: :not_initialized

  def log_like_count(user) do
    case like_count(user) do
      :not_initialized ->
        Logger.warn("user has no like count. You need to fix this")

      count ->
        Logger.info("The user's like count is #{count}")
    end
  end
end

iex(1)> user = %{username: "mraaroncruz", password: "secret"}
%{password: "secret", username: "mraaroncruz"}

iex(2)> UserPresenter.log_like_count(user)

09:33:20.650 [warn]  user has no like count. You need to fix this
:ok

iex(3)> user = %{username: "mraaroncruz", password: "secret", likes: 1000000}
%{likes: 1000000, password: "secret", username: "mraaroncruz"}

iex(4)> UserPresenter.log_like_count(user)
:ok

09:33:33.363 [info]  The user's like count is 1000000

```



----------------

#### [To Exercise >>](./concrete_practice.md)

