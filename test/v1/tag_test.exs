defmodule JishoElixir.V1.TagTest do
  use ExUnit.Case, async: true
  doctest JishoElixir.V1.Tag

  test ".validate: returns true if valid" do
    assert JishoElixir.V1.Tag.validate("hob") == "hob"
  end

  test ".validate: raises exception when not valid" do
    assert_raise JishoElixir.V1.TagError, fn ->
      JishoElixir.V1.Tag.validate("123")
    end
  end
end
