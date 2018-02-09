defmodule WaterparkTestTest do
  use ExUnit.Case
  doctest WaterparkTest

  test "greets the world" do
    assert WaterparkTest.hello() == :world
  end
end
