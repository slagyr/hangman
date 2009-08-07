module WordSpace

  def update_letter(letter)
    style.transparency = 100
    self.text = letter
    @transparency = 100
    @animation = animate(:updates_per_second => 20) do
      @transparency -= 5
      style.transparency = @transparency
      @animation.stop if @transparency <= 0
    end
  end

end