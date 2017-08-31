defmodule JishoElixir.V1.TagSearch do
  @moduledoc false
  #  Search by tag, Jisho V1.

  alias JishoElixir.V1.Base
  alias JishoElixir.V1.Tag

  @doc """
  Search a tag.
  """
  def search!(tag) do
    Tag.process(tag)
    |> Base.process!
  end

  @doc """
  Search a tag with page.
  """
  def search!(tag, page) do
    Tag.process(tag)
    |> Base.process_with_page!(page)
  end
end
