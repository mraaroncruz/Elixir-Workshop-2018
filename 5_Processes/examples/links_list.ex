defmodule Links.List do
  def start_link(list) do
    spawn(fn ->
      loop(list)
    end)
  end

  def add(pid, link) do
    send(pid, {:add, link})
  end

  def all(pid) do
    send(pid, {:all, self()})

    receive do
      {:list, list} -> list
    end
  end

  def loop(list) do
    receive do
      {:all, pid} ->
        send(pid, {:list, list})
        loop(list)

      {:add, item} ->
        list = [item | list]
        loop(list)

      :boom ->
        raise "BOOM!"
    end
  end
end
