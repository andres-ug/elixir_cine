defmodule ElixirCineTest do
  use ExUnit.Case
  doctest ElixirCine

  test "greets the world" do
    assert ElixirCine.hello() == :world
  end
end
