module Letter

  def casted
    disable
  end

  def mouse_clicked(e)
    if @enabled
      scene.guess = text.downcase
      disable
    end
  end

  def disable
    @enabled = false
    @tmp_hover_style = hover_style if hover_style
    style.text_color = "grey"
    self.hover_style = nil
  end

  def enable
    style.text_color = :white
    self.hover_style = @tmp_hover_style if @tmp_hover_style
    @enabled = true
  end

end