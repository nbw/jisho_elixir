defmodule JishoElixir.Version do
  @moduledoc false
  # version control for Jisho API

  # current version is V1 (Aug 24, 2017)

  @current_version 1

  @doc """
  Return module name for current version of API

  ## Examples

  iex> JishoElixir.Version.current
  :"Elixir.JishoElixir.V1"

  """
  def current do
    module(@current_version)
    |> String.to_atom
  end


  @doc """
  Return module name for current version of API

  ## Examples

  iex> JishoElixir.Version.current("Base")
  :"Elixir.JishoElixir.V1.Base"

  """
  def current(sub_name) do
    submodule(@current_version, sub_name)
  end


  @doc """
  Assemble sub module for given version

  ## Examples

  iex> JishoElixir.Version.submodule(2,'Test')
  :"Elixir.JishoElixir.V2.Test"

  """
  def submodule(version, sub_name) do
    module(version)
    |> add_subname(sub_name)
    |> String.to_atom
  end
  
  @doc """
  Assemble base module for given version
  """
  def module version do
    "Elixir.JishoElixir.V#{version}"
  end

  defp add_subname module, subname do
    module <> ".#{subname}"
  end
end
