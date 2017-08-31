defmodule JishoElixir.V1.Base do
  @moduledoc false
  # Base processor for JishoElixir API.
 
  alias JishoElixir.JSON
  alias JishoElixir.Client
  alias JishoElixir.V1.Tag
  alias JishoElixir.V1.URL

  def process!(term) do
    URL.search_word(term)
    |> Client.get!
    |> Map.fetch!(:body)
    |> JSON.decode!
  end

  def process_with_tag!(word, tags) do 
    [word | Tag.process(tags)]
    |> process!
  end

  def process_with_tag_and_page!(word, tags, page) do 
    [word | Tag.process(tags)]
    |> process_with_page!(page)
  end

  def process_with_page!(term, page) do
    URL.search_word_with_page(term, page)
    |> Client.get!
    |> Map.fetch!(:body)
    |> JSON.decode!
  end
end
