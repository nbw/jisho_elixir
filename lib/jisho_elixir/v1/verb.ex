defmodule JishoElixir.V1.Verb do
  @moduledoc false
  # Search verbs using the #verb tag, Jisho V1 

  import JishoElixir.V1.Base

  @doc """
  Search a verb.
  """
  def search!(word) do
    process_with_tag!(word, "verb") 
  end

  @doc """
  Search a verb with tag(s).
  """
  def search!(word, tag) when is_binary(tag) do
    process_with_tag!(word, ["verb", tag]) 
  end

  @doc """
  Search a verb with tag(s).
  """
  def search!(word, tags) when is_list(tags) do
    process_with_tag!(word, ["verb" | tags]) 
  end

  @doc """
  Search a verb with tag(s) and page.
  """
  def search!(word, tag, page) when is_binary(tag) do
    process_with_tag_and_page!(word, ["verb" , tag], page) 
  end

  @doc """
  Search a verb with tag(s) and page.
  """
  def search!(word, tags, page) when is_list(tags) do
    process_with_tag_and_page!(word, ["verb" | tags], page) 
  end
end

