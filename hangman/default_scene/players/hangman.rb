module Hangman

  def casted
    @hangman_index = 0
  end

  def reset
    @hangman_index = 0
    style.background_image = "images/hangman_0.png"
  end

  def miss
    @hangman_index += 1
    style.background_image = "images/hangman_#{@hangman_index}.png"
  end

end