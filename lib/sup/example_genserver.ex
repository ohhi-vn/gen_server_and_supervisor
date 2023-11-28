defmodule Sup.ExampleGenserver do
  use GenServer

  def start_link(arg) do
    IO.puts("ExampleGenserver start")
    GenServer.start_link(__MODULE__, arg, name: :example_gen_server)
  end

  def init(state) do
    IO.puts("timer sleep 5 seconds! ")
    :timer.sleep(5000)
    send(self(), :finish)
    {:ok, state}
  end

  def handle_info(:finish, %{name: name} = state) do
    IO.puts("Hello from #{self()}, #{name}")
    {:noreply, state}
  end

end
