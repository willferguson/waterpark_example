defmodule WaterparkTest do
  @moduledoc """
  Documentation for WaterparkTest.
  """


  def run() do
    Dispatcher.start_link("test_pool")
    Dispatcher.run("Hello")
    Dispatcher.enqueue("World")
  end
end
