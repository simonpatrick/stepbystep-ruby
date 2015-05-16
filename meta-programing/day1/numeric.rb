# to_money 不能和原来Numberic方法
# 重名
class Numeric
  def to_money
    Money.new(self*1000)
  end
end

# can't use replace because of Array already
# have a method named replace
class Array
  def replace(from,to)
    each_with_index do |element,index|
      self[index]=to if element==from
    end
  end
  def substitute(from,to)
    each_with_index do |element,index|
      self[index]=to if element==from
    end
  end
end

puts [].methods.grep /^re/
puts [].methods.grep /^sub/