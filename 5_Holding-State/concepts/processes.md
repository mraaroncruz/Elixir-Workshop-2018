## Processes

All Elixir processes have a process ID or `pid`

```elixir
iex(1)> pid = spawn fn -> IO.puts "Hi from a parallel world" end
Hi from a parallel world
#PID<0.90.0>
iex(2)> pid
#PID<0.90.0>
iex(3)> Process.alive? pid
false
iex(4)> pid = spawn fn ->
...(4)> :timer.sleep(10_000)
...(4)> end
#PID<0.96.0>
iex(5)> Process.alive? pid
true
iex(6)> Process.alive? pid
true
iex(7)> Process.alive? pid
true
iex(8)> Process.alive? pid
false
```



You can send a message to a process' mailbox using its `pid`

```elixir
defmodule Forever do
  def loop(time \\ 1000) do
    :timer.sleep(time)
    IO.puts("Looping")
    loop(time)
  end
end

iex(3)> pid = spawn fn -> Forever.loop(5000) end
iex(4)> info = Process.info(pid)
iex(5)> info[:messages]
[]
iex(6)> send pid, :stop
:stop
Looping
iex(7)> send pid, :start
:start
Looping
iex(9)> info = Process.info(pid)
```



### Receiving messages

```elixir
defmodule Looper do
  def start do
    spawn &loop/0
  end

  def loop do
    receive do
      :stop -> IO.puts("Nope. I ain't stopping")
      :hello -> IO.puts("Hi there")
    end
    loop
  end
end

pid = Looper.start
send pid, :stop
send pid, :hello
send pid, :stays_in_mailbox
Process.info(pid)
```

Now this is a way we can hold state and update it.

```elixir
defmodule TodoList do
  def start_link do
    spawn fn -> loop([]) end
  end

  def loop(list) do
    receive do
      {:all, pid} ->
        send(pid, {:list, list})
        loop(list)
      {:add, item} ->
        list = [item | list]
        loop(list)
      :boom -> raise "BOOM!"
    end
  end
end

pid = TodoList.start_link()
send pid, {:add, "Wash hair"}
send pid, {:add, "Do dishes"}
send pid, {:add, "Finish workshop"}

me = self()
IO.inspect(me)

send pid, {:all, me}
receive do
  {:list, todos} -> IO.inspect(todos)
end
```

--------------

#### [To Exercise >>](../concrete_practice.md)