# Ruby中类定义和其他语句没有本质区别
3.times do
  class C
     # do it as init
     puts "hello Class C!"
  end
end

class D
  def x
    'x'
  end
end

class D
  def y
    'twice'
  end
end

# class D 更像是个作用域和不是类声明
# 所以ruby的类其实是Open Class(可以随时改变)
d = D.new
puts d.x
puts d.y


