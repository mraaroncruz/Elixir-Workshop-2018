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

iex(6)> send(pid, :stop)
:stop
Looping

iex(7)> send(pid, :start)
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
send(pid, :stop)
send(pid, :hello)
send(pid, :stays_in_mailbox)
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
send(pid, {:add, "Wash hair"})
send(pid, {:add, "Do dishes"})
send(pid, {:add, "Finish workshop"})

me = self()
IO.inspect(me)

send(pid, {:all, me})
receive do
  {:list, todos} -> IO.inspect(todos)
end
```

### Why this might be interesting...

Let's say we have 1000 workers that are all doing some kind of work, handling web requests, downloading files, transcoding videos, etc. and we want them to be able to do that in parallel and then send their completed work to another server that saves these things in one or more data stores.

```elixir
defmodule Worker do
  def work(worker_number, server_pid) do
    result = do_work()
    send(server_pid, {:work, worker_number, result})
    work(worker_number, server_pid)
  end

  defp do_work() do
    random_sleeptime = :rand.uniform(3000)
    :timer.sleep(random_sleeptime)
    {:magic_number, :rand.uniform(1_000_000_000)}
  end
end

defmodule Server do
  require Logger

  def start_link() do
    Task.start_link(&serve/0)
  end 

  def serve() do
    receive do
      {:work, worker_number, work} ->
        save(worker_number, work)
      unknown ->
        Logger.warn("Unknown message sent to Server #{inspect self()}: #{inspect unknown}")
    end
    serve()
  end

  defp save(worker_number, {:magic_number, n}) do
    save_to_postgres(worker_number, n)
    save_to_s3(worker_number, n)
  end

  defp save_to_postgres(worker_number, n) do
    :timer.sleep(100)
    IO.puts("Saved work from worker #{worker_number} in S3: #{n}")
  end

  defp save_to_s3(worker_number, n) do
    :timer.sleep(100)
    IO.puts("Saved work from worker #{worker_number} in postgres: #{n}")
  end

end

defmodule WorkerSpawner do
  def spawn(server_pid, n) do
    for worker_number <- 1..n do
      Task.start(fn ->
        Worker.work(worker_number, server_pid)
      end)
    end
  end
end
```

### Demo


### How do we make it more parallel?

The bottleneck is that the Server process is synchronous therefore can only process one message at a time. Let's pretend that our persistence layer doesn't have a limited amount of connections (we could just use a process pool if this mattered) and process each persistence job in its own Task (aka Process)

```elixir
defmodule Server do
  # ...
  defp save(worker_number, {:magic_number, n}) do
    Task.start(fn -> save_to_postgres(worker_number, n) end)
    Task.start(fn -> save_to_s3(worker_number, n) end)
  end
  # ...
end
```

You can see how simple it is to create a massively parallel system that can run easily on your laptop.

--------------

#### [To Exercise >>](../concrete_practice.md)