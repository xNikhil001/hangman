defmodule Dictionary.Impl.WordList do

  def word_list() do
    "assets/words.txt"
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end




  def random_word(word_list) do
    word_list
    |> Enum.random
  end
end
