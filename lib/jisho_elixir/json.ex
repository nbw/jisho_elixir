defmodule JishoElixir.JSON do
  @moduledoc false
  # Handles any JSON parsing related tasks. 

  # Created to reduce dependancy injection by isolating a third-party
  # library (thanks POODR); basically a wrapper around Poison. 

  # For now relying on Poison's error output. 


  @doc """
  Decode JSON into a Map; returns tuple on pass/fail.

  ## Examples

  iex> JishoElixir.JSON.decode('{\"name\":\"jisho\"}')
  {:ok, %{name: "jisho"}}

  iex> JishoElixir.JSON.decode("a")
  {:error, {:invalid, "a", 0}}

  """
  def decode(json) do
    Poison.decode(json, keys: :atoms)
  end


  @doc """
  Decode JSON; raise exception on fail. 

  ## Examples

  iex> JishoElixir.JSON.decode!('{\"name\":\"jisho\"}')
  %{name: "jisho"}

  iex> assert_raise Poison.SyntaxError, "Unexpected token at position 0: x", fn ->
  iex>    JishoElixir.JSON.decode!("x")
  iex> end
  %Poison.SyntaxError{message: "Unexpected token at position 0: x", pos: nil, token: "x"}

  """
  def decode!(json) do
    Poison.decode!(json, keys: :atoms)
  end

end
