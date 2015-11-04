def to_alphanumberic(s)
  s.gsub(/[^\w\s]/,'')
end

require 'test/unit'

class ToAlphaNumbericTest < Test::Unit::TestCase
  def test_strip_non_alphumuberic_characters
    assert_equal '3 the magic number',to_alphanumberic('#3, the *magic, Number*?')
  end
end

class String
  def to_alphanumberic
    gsub(/[^\w\s]/,'')
  end
end

require 'test/unit'

class StringExpressionsTest <Test::Unit::TestCase
  def test_strip_non_alphanumeric_characters
    assert_equal '3 the Magic Number', '#3, the *Magic, Number*?'.to_alphanumeric
  end
end