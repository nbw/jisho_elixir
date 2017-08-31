defmodule JishoElixir do
  @moduledoc """
  A wrapper around Jisho's API (http://jisho.org) 

  Supports:
  * Searching by word (or any term)
  * Searching by tag (http://jisho.org/docs); word and name tags
  * Searching by verb

  ## API Version
  
  Currently V1 
   
  """

  alias JishoElixir.Version
  
  @doc """
  Search by word (or term)

  Params:
    * word [String]

  Response:
    * Parsed JSON [Map]

  Returns `{:ok, response}` if successful, else `{:error, reason}`

  ## Example
  
  Searching an English word:
    
      JishoElixir.search("apple")

  Searching a Japanese word:
    
      JishoElixir.search("とうげ")

      JishoElixir.search("峠")

  ### A note about searching by kanji
  
  The API doesn't support kanji specific results quite yet, but Kimtaro has indicated that
  it's in the works. In the meantime, one can search for kanji as if it were a word.  
  """
  defdelegate search(word),   to: Version.current


  @doc """
  Search by word (or term)

  For usage refer to _JishoElixir.search(word)_
  """
  defdelegate search!(word),  to: Version.current


  @doc """
  Search by word (or term) with tag(s). For a list of tags, refer to http://jisho.org/docs

  Params:
    * word [String]
    * tags [String] or [List]

  Response:
    * Parsed JSON [Map]

  Returns `{:ok, response}` if successful, else `{:error, reason}`

  ## Example
  
  Searching an English word:
    
      JishoElixir.search("apple", "n" )

      JishoElixir.search("apple", ["n", "food"] )

  Searching a Japanese word:
    
      JishoElixir.search("とうげ", "n" )

      JishoElixir.search("峠", ["n", "exp"])
  """
  defdelegate search(word, tags),   to: Version.current


  @doc """
  Search by word (or term) with tag(s)

  For usage refer to _JishoElixir.search(word, tag)_
  """
  defdelegate search!(word, tags),  to: Version.current


  @doc """
  Search by word (or term) with tag(s). For a list of tags, refer to http://jisho.org/docs

  Params:
    * word [String]
    * tags [String] or [List]
    * page [Integer]

  Response:
    * Parsed JSON [Map]

  Returns `{:ok, response}` if successful, else `{:error, reason}`

  ## Example
  
  Searching an English word:
    
      JishoElixir.search("loose", "n", 2)

      JishoElixir.search("loose", ["n", "adj-na"], 2)

  Searching a Japanese word:
    
      JishoElixir.search("とうげ", "n", 1)

      JishoElixir.search("峠", ["n", "exp"], 1)
  """
  defdelegate search(word, tags, page),   to: Version.current


  @doc """
  Search by word (or term) with tag(s) and page number

  For usage refer to _JishoElixir.search(word, tag, page)_
  """
  defdelegate search!(word, tags, page),  to: Version.current


  @doc """
  Search by tag(s), refer to http://jisho.org/docs 

  Params:
    * tag [String] or [List]

  Response:
    * Parsed JSON [Map]

  Returns `{:ok, response}` if successful, else `{:error, reason}`

  ## Example
  
  Searching a tag(s):
    
      JishoElixir.tag("jlpt-n1")

      JishoElixir.tag(["jlpt-n1", "n"])
  """
  defdelegate tag(tag),   to: Version.current


  @doc """
  Search by tag(s), refer to http://jisho.org/docs 

  For usage refer to _JishoElixir.tag(tag)_
  """
  defdelegate tag!(tag),  to: Version.current


  @doc """
  Search by tag(s), refer to http://jisho.org/docs, and page number

  Params:
    * tag [String] or [List]
    * page [Integer]

  Response:
    * Parsed JSON [Map]

  Returns `{:ok, response}` if successful, else `{:error, reason}`

  ## Example
  
  Searching a tag(s):
    
      JishoElixir.tag("jlpt-n1", 1)

      JishoElixir.tag(["jlpt-n1", "n"], 1)
  """
  defdelegate tag(tag, page),   to: Version.current


  @doc """
  Search by tag(s), refer to http://jisho.org/docs, and page number

  For usage refer to _JishoElixir.tag(tag, page)_
  """
  defdelegate tag!(tag, page),  to: Version.current


  @doc """
  Search by verb

  Params:
    * verb [String]

  Response:
    * Parsed JSON [Map]

  Returns `{:ok, response}` if successful, else `{:error, reason}`

  ## Example
  
  Searching a verb:
    
      JishoElixir.verb("eat")

      JishoElixir.verb("食べる")
  """
  defdelegate verb(word),   to: Version.current


  @doc """
  Search by verb

  For usage refer to _JishoElixir.verb(tag)_
  """
  defdelegate verb!(word),  to: Version.current


  @doc """
  Search by verb and tag(s)

  Params:
    * verb [String]
    * tag [String] or [List]

  Response:
    * Parsed JSON [Map]

  Returns `{:ok, response}` if successful, else `{:error, reason}`

  ## Example
  
  Searching a verb:
    
      JishoElixir.verb("eat", "hon")

      JishoElixir.verb("食べる", ["hon", "v1"])
  """
  defdelegate verb(word, tag),   to: Version.current


  @doc """
  Search by verb and tag(s)

  For usage refer to _JishoElixir.verb(word, tag)_
  """
  defdelegate verb!(word, tag),  to: Version.current


  @doc """
  Search by verb and tag(s) and page number

  Params:
    * verb  [String]
    * tag   [String] or [List]
    * page  [Integer]

  Response:
    * Parsed JSON [Map]

  Returns `{:ok, response}` if successful, else `{:error, reason}`

  ## Example
  
  Searching a verb:
    
      JishoElixir.verb("eat", "hon", 1)

      JishoElixir.verb("食べる", ["hon", "v1"], 1)
  """
  defdelegate verb(word, tag, page),   to: Version.current


  @doc """
  Search by verb and tag(s) and page

  For usage refer to _JishoElixir.verb(word, tag, page)_
  """
  defdelegate verb!(word, tag, page),  to: Version.current
end
