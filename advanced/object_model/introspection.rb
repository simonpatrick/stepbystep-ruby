class Greeting
  def initialize(msg)
    @msg=msg
  end

  def welcome
    @msg
  end
end

my_greeting = Greeting.new('hello')
puts my_greeting.welcome