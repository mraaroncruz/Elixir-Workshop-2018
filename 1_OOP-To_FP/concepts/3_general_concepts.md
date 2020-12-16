# General Elixir Concepts

The easiest way to get started is firing up `iex`, or _Interactive Elixir_, to experiment with code live in the Elixir shell. The code examples in this chapter were entered directly in iex and you are encouraged to follow along in your own session.

### Terminology

- _term_ - An element of any data type and is commonly referred to as such in documentation and code examples
- _literal_ - A value within source code representing a type
- _bitstring_ - Used to store an area of untyped memory
- _binary_ - Bitstrings containing a number of bits evenly divisible by eight and commonly used to store UTF-8 encoded strings
- _arity_ - The number of arguments a function accepts

### Everything is an expression

```elixir
iex(1)> result = if 1 == 1 do
...(1)>   "correct"
...(1)> else
...(1)>   "incorrect"
...(1)> end
"correct"
iex(2)> result
"correct"
```

### Immutability

Variables are immutable. Once assigned, they cannot be changed. Instead of operating on information hiding and mutating shared state, Elixir programs are constructed around data transformation and message passing among isolated processes. This follows the [_Actor Model_](http://en.wikipedia.org/wiki/Actor_model) of concurrency.

### Parenthesis are optional

Parenthesis are optional as long as their absence does not introduce ambiguity.

### Documentation is first class

Documentation in Elixir is written in [Markdown](http://en.wikipedia.org/wiki/Markdown) and compiled into the program as metadata. This allows formatted documentation to be brought up on-demand through `iex`.

### Coexistence with the Erlang ecosystem

Elixir programs compile to the Erlang Abstract Format, or byte-code for Erlang's BEAM Virtual Machine. Erlang modules can be called from Elixir and vice-versa. Calling Erlang modules from Elixir simply requires using an _atom_ by prefixing the module name with a semicolon.

```elixir
iex(7)> IO.puts "Print from Elixir"
Print from Elixir
:ok
iex(8)> :io.fwrite "Print from Erlang~n"
Print from Erlang
:ok
iex(1)> :math.pi
3.141592653589793
iex(2)> :erlang.time
{19, 41, 20}
```

## Debugging

There is a built in debugger that gives you access to the runtime at the point at which you envoke it.

```
# to stop code and inspect values
require IEx
IEx.pry
```

```
# to view documentation for modules and functions
h ModuleName
h ModuleName.function
```

```
# to introspect a variable, e.g., i "hello"
i variable
```

---

#### [To the exercise >>](./exercise.md)
