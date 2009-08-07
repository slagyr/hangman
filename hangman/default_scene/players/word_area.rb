module WordArea

  def clear
    remove_all
    @animation.stop if @animation
  end

  def update_word(word)
    letters = parse_letters(word)
    if children.length == 0
      build_word(letters)
    else
      update_current_word(letters)
    end
  end

  def show_loss(word)
    parse_letters(word).each_with_index do |letter, index|
      space = children[index]
      if space.text != letter
        space.style.text_color = "maroon"
        space.update_letter(letter)
      end
    end
  end

  def show_win
    children.each do |child|
      child.style.text_color = "golden_rod"
    end
    @animate_max = children.length
    @animate_index = @animate_max - 1
    @animation = animate(:updates_per_second => 9) do
      children[@animate_index].style.text_color = "golden_rod"
      @animate_index = (@animate_index + 1) % @animate_max
      children[@animate_index].style.text_color = "#2661da"
    end
  end

  private #################################################

  def parse_letters(word)
    word = word.gsub("_", " ").upcase
    letters = []
    (0...word.length).each { |i| letters << word[i..i] }
    return letters
  end

  def build_word(letters)
    build do
      letters.each_with_index do |letter, index|
        word_space :id => "letter#{index}", :text => letter
      end
    end
  end

  def update_current_word(letters)
    letters.each_with_index do |letter, index|
      space = children[index]
      if space.text != letter
        space.update_letter(letter)
      end
    end
  end


end