defmodule JishoElixir.Client do
  use HTTPoison.Base
  @moduledoc false
  # Handles any HTTP Client related tasks. 

  # Created to reduce dependancy injection by isolating a third-party
  # library (thanks POODR); basically a wrapper around HTTPoison. 
end
