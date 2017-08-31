require IEx;
defmodule JishoElixir.V1 do
  @moduledoc false
  # JishoElixir API V1

  alias JishoElixir.V1.Search
  alias JishoElixir.V1.Verb
  alias JishoElixir.V1.TagSearch

  defdelegate search!(word),  to: Search 
  def search(word), do: tuplify(&search!(&1), word) 

  defdelegate search!(word, tag), to: Search 
  def search(word, tag), do: tuplify(&search!(&1,tag), word) 

  defdelegate search!(word, tag, page), to: Search 
  def search(word, tag, page), do: tuplify(&search!(&1, tag, page), word) 

  defdelegate tag!(tag), to: TagSearch, as: :search!
  def tag(tag), do: tuplify(&tag!(&1), tag) 

  defdelegate tag!(tag, page), to: TagSearch, as: :search!
  def tag(tag, page), do: tuplify(&tag!(&1,page), tag) 

  defdelegate verb!(verb), to: Verb, as: :search!
  def verb(verb), do: tuplify(&verb!(&1), verb) 

  defdelegate verb!(word, tag), to: Verb, as: :search!
  def verb(verb, tag), do: tuplify(&verb!(&1, tag), verb) 

  defdelegate verb!(word, tag, page), to: Verb, as: :search!
  def verb(verb, tag, page), do: tuplify(&verb!(&1, tag, page), verb) 

  defp tuplify(f,w) do
    {:ok, f.(w)}
  rescue
    e -> {:error, e}
  end
end
