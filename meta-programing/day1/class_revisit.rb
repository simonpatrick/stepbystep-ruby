# 类本身也是对象

puts 'abc'.class
puts String.class
puts String.instance_methods(false)
puts Class.instance_methods(false)

puts Class.superclass #=>Module
puts String.superclass #=>Object
puts Object.superclass # =>BasicObject
puts BasicObject.superclass #=>nil
