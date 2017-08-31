defmodule JishoElixir.V1.Tag do
  @moduledoc false
  # Process tags for Jisho V1 API 

  # Refer to: http://jisho.org/docs ; Aug 27, 2017
  @word_tags ~w(
    adjective counter abbr adj adj-f adj-i adj-ix adj-kari adj-ku adj-na adj-nari 
    adj-no adj-pn adj-shiku adj-t adv adv-to anat ant arch archit astron ateji aux
    aux-adj aux-v baseb biol bot bus chem chn col comp conj cop-da ctr derog eK 
    econ ek engr equ ex exp expl fam fem fig finc food geol geom gikun go hob hon 
    hum iK id ik int io iv jlpt-n1 jlpt-n2 jlpt-n3 jlpt-n4 jlpt-n5 joc jouyou kan 
    kanyou ksb ktb kun kvar kyb kyu law ling lit m-sl mahj male male-sl math med 
    mil music n n-adv n-pr n-pref n-suf n-t nab name num oK obs obsc oik ok on 
    on-mim osb physics pn poet pol pref proverb prt rad rare rkb see sens shogi 
    sl sports suf sumo syn thb tou tsb tsug uK uk unc v-unspec v1 v1-s v2a-s v2b-k 
    v2b-s v2d-k v2d-s v2g-k v2g-s v2h-k v2h-s v2k-k v2k-s v2m-k v2m-s v2n-s v2r-k 
    v2r-s v2s-s v2t-k v2t-s v2w-s v2y-k v2y-s v2z-s v4b v4g v4h v4k v4m v4n v4r 
    v4s v4t v5aru v5b v5g v5k v5k-s v5m v5n v5r v5r-i v5s v5t v5u v5u-s v5uru v5z 
    verb vi vk vn vr vs vs-c vs-i vs-s vt vulg vz yoji zool Buddh MA Shinto X wasei
  ) 

  @name_tags ~w(
    surname place unclass company product masc fem person given station organization 
    oik
  )
    

  @doc """
  Process single word tag.

  Returns a single item list. Throws an error if the tag is not valid.
  """
  def process(tag) when is_binary(tag) do
    validate(tag)
    ["##{tag}"]
  end


  @doc """
  Process list of tags.

  ## Examples

  iex> JishoElixir.V1.Tag.process("verb")
  ["#verb"]

  iex> JishoElixir.V1.Tag.process(["verb","hob"])
  ["#verb","#hob"]
  """
  def process(tags) when is_list(tags) do
    Enum.map(tags, fn(t) -> process(t) |> List.first end)
  end


  @doc """
  Checks if a valid tag.
  ## Examples

  iex> JishoElixir.V1.Tag.valid_tag?("verb")
  true

  iex> JishoElixir.V1.Tag.valid_tag?("watermelon")
  false
  """
  def valid_tag? tag do
    Enum.member?((@word_tags ++ @name_tags), tag)
  end
  

  @doc """
  Validates tag, throws error if invalid.
  """
  def validate(tag) do
    case valid_tag?(tag) do
      true -> tag
      false -> raise JishoElixir.V1.TagError, tag
    end
  end
end

defmodule JishoElixir.V1.TagError do
  @moduledoc false

  defexception [:message]

  def exception(value) do
    msg = "Invalid Jisho tag: '#{value}'. Refer to http://jisho.org/docs"
    %JishoElixir.V1.TagError{message: msg}
  end
end
