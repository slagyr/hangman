module MenuItem

  attr_accessor :action

  def casted
    @enabled = true
  end

  def mouse_clicked(e)
    if @enabled
      instance_eval(@action)
    end
  end

  def disable
    @enabled = false
    @tmp_hover_style = hover_style if hover_style
    style.text_color = "grey"  
    self.hover_style = nil
  end

  def enable
    style.text_color = "#2661da"
    self.hover_style = @tmp_hover_style if @tmp_hover_style
    @enabled = true
  end

end