defmodule SlowWorker do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def init(args) do
    send(self(), {:work, args})
    {:ok, args}
  end

  def handle_info({:work, args}, state) do
    :timer.sleep(5000)
    {pid, arg} = args
    send(pid, {:result, arg})
    {:stop, :normal, state}
  end


end
