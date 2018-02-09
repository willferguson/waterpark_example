defmodule Dispatcher do
  use GenServer
  require Logger

  def start_link(pool_name) do
    GenServer.start_link(__MODULE__, pool_name, name: :dispatcher)
  end

  def init(pool_name) do
    Waterpark.create_pool(pool_name, 3, {SlowWorker, :start_link, []})
    {:ok, pool_name}
  end

  def run(arg) do
    GenServer.cast(:dispatcher, {:run, arg})
  end

  def enqueue(arg) do
    GenServer.cast(:dispatcher, {:enqueue, arg})
  end

  def handle_cast({:run, arg}, pool_name) do
    Waterpark.run(pool_name, [{self(), arg}])
    {:noreply, pool_name}
  end

  def handle_cast({:enqueue, arg}, pool_name) do
    Waterpark.enqueue(pool_name, [{self(), arg}])
    {:noreply, pool_name}
  end

  def handle_info({:result, arg}, state) do
    Logger.info("Received #{arg} from Worker")
    {:noreply, state}
  end

end
