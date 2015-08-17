module MyModule
  MyConstant = "Outer Constant"

  class MyClass
    MyConstant ="Inner Constant"
  end
end

puts MyModule::MyClass::MyConstant