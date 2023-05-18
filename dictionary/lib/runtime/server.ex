defmodule Dictionary.Runtime.Server do
  alias Dictionary.Impl.WordList

  @pid __MODULE__

  @type t :: pid()

  use Agent

  def start_link(_) do
    Agent.start_link(&WordList.word_list/0, name: @pid)
  end

 def random_word() do
    Agent.get(@pid, &WordList.random_word/1)
 end
end
