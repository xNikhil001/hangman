defmodule Dictionary do

  @spec start() :: list(String.t())
  defdelegate start(), to: Dictionary.Impl.WordList , as: :word_list

  @spec random_word(list(String.t())) :: String.t()
  defdelegate random_word(words), to: Dictionary.Impl.WordList
end
