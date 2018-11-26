class String
  def to_method
    self.downcase.gsub(' ','_').to_sym
  end
end