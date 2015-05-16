class ModifyString

  def to_alphanumberic(s)
    s.gsub /[^\w\s]/,''
  end
end

s = ModifyString.new
print s.to_alphanumberic("abcd,|2345")