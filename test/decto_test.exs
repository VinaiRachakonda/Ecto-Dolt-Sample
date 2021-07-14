defmodule DectoTest do
  use ExUnit.Case
  doctest Decto

  test "greets the world" do
    assert Decto.hello() == :world
  end
end
