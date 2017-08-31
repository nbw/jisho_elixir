defmodule JishoElixir.V1.Search do
  @moduledoc false
  # General case search, Jisho V1
  
  import JishoElixir.V1.Base

  @doc """
  Search a word or term.
  """
  def search!(word) do
    process!(word) 
  end


  @doc """
  Search a word with tag(s).
  """
  def search!(word, tags) do
    process_with_tag!(word, tags) 
  end


  @doc """
  Search a word with tag(s) and page.
  """
  def search!(word, tags, page) do
    process_with_tag_and_page!(word, tags, page) 
  end
end
