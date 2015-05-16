class MyClass
  def my_method
    @v=1
  end
end

obj = MyClass.new
# 类
print obj.class

#实例变量
print "no instance variables at all before my_method is called"
print obj.instance_variables
puts "\n"
obj.my_method
puts "instance variables is coming after my_method was classed"
print obj.instance_variables

# 方法
print obj.methods
puts "\n"
print obj.methods.grep /^my/

# 实例变量在对象中，方法在类中
puts "实例变量在对象中，方法在类中"
puts String.instance_methods=='abc'.methods
puts String.methods=='abc'.methods

puts MyClass.superclass
