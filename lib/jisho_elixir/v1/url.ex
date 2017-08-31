defmodule JishoElixir.V1.URL do
  @moduledoc false
  # Handles building the API request URL, Jisho V1
  
  @base "http://jisho.org/api/v1/search/"
  
  
  @doc """
  Build URL for searching a word.

  ## Examples

  iex> JishoElixir.V1.URL.search_word(["eat","#verb"])
  "http://jisho.org/api/v1/search/words?keyword=eat+%23verb"
  """
  def search_word(items) do
    "#{@base}words?keyword=#{uri_encode(items)}"
  end


  @doc """
  Build URL for searching a word and page number.

  ## Examples

  iex> JishoElixir.V1.URL.search_word_with_page(["eat","#verb"], 2)
  "http://jisho.org/api/v1/search/words?keyword=eat+%23verb&page=2"
  """
  def search_word_with_page(items, page) do
    search_word(items)
    |> append_page(page)
  end
  

  @doc """
  Encode single item.

  ## Examples

  iex> JishoElixir.V1.URL.uri_encode("%term")
  "%23term"
  """
  def uri_encode(item) when is_binary(item) do
    URI.encode_www_form(item)
  end


  @doc """
  Encode list of items after inserting a space between.

  ## Examples

  iex> JishoElixir.V1.URL.uri_encode(["term","#tag","#tag2"])
  "term+%23tag+%23tag2"
  """
  def uri_encode(items) when is_list(items) do
    Enum.join(items, " ")
    |> URI.encode_www_form
  end


  # Add page param to url string.
  defp append_page(url, page) when is_integer(page) do
    "#{url}&page=#{page}"
  end
end
