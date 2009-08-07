class String
  def camelcase
    self.gsub(/^\w/) do |char|
      char.upcase
    end.gsub(/\_\w/) do |chars|
      chars.split('').last.upcase
    end
  end
  
  def constantize
    instance_eval(self)
  end
end