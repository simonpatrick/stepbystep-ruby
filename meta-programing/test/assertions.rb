def assert(condition)
  raise "Error" unless condition
  puts "Assertion OK"
end

def assert_completes(condition)
  assert condition
end

def assert_false(condition)
  assert !condition
end

def assert_equal(actual,expected)
  raise "Expected #{expected},got #{actual}" unless actual==expected
  puts "Assertion OK: I expected #{expected},get #{actual}"
end

def assert_matches(regexp, x)
  raise "Expected #{x} to match #{regexp}" unless x.to_s =~ Regexp.new(regexp)
  puts "Assertion OK: I expected #{x} to match #{regexp} and it does"
end

def assert_raises(klass)
  yield
  raise "Expected a #{klass}, didn't get it"
rescue klass
end
