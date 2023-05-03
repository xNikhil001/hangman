defmodule TextClient.Impl.Player do
  def start() do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    interact({game,tally})
  end

  def interact({_game,_tally = %{game_state: :won}}) do
    IO.puts "You Won!"
  end

  def interact({_game,tally = %{game_state: :lost}}) do
    IO.puts("You Lost! The word was #{tally.letters |> Enum.join()}")
  end

  def interact({game,tally}) do
    IO.puts feedback_for(tally)
    IO.puts current_word(tally)
    guess = get_guess()
    {updated_game, updated_tally} = Hangman.make_move(game,guess)
    interact({updated_game, updated_tally})
  end

  defp feedback_for(%{game_state: :initializing}) do
    "Welcome to the game!"
  end

  defp feedback_for(%{game_state: :good_guess}) do
    "Good Guess!"
  end

  defp feedback_for(%{game_state: :bad_guess}) do
    "Bad Guess!"
  end

  defp feedback_for(%{game_state: :already_used}) do
    "Already Used!"
  end

  def current_word(tally) do
    [
      "word so far ", tally.letters |> Enum.join(" "),
      "   turns left   ", tally.turns_left |> to_string(),
      "   used so far  ", tally.used |> Enum.join(",")
    ]
  end

  def get_guess() do
    IO.gets("Next letter: ")
    |> String.trim()
    |> String.downcase()
  end
end
