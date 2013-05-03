require 'test_helper'

class TestStringNumber < Test::Unit::TestCase

  def test_initialization
    assert_equal 'A', StringNumber.new('A').to_s
    assert_equal 'STA', StringNumber.new('STA').to_s
    assert_equal 'ABC', StringNumber.new('abc').to_s

    assert_raise(ArgumentError) { StringNumber.new('abc123') }
    assert_raise(ArgumentError) { StringNumber.new(123) }
    assert_raise(ArgumentError) { StringNumber.new(Object.new) }
  end

  def test_valid
    assert StringNumber.valid('A')
    assert StringNumber.valid('STA')
    assert StringNumber.valid('abc')

    assert !StringNumber.valid('abc123')
    assert !StringNumber.valid(123)
    assert !StringNumber.valid(Object.new)
  end

  def test_to_number
    assert_equal 1, StringNumber.new('A').to_i
    assert_equal 26, StringNumber.new('Z').to_i
    assert_equal 27, StringNumber.new('AA').to_i
    assert_equal 36, StringNumber.new('AJ').to_i
    assert_equal 52, StringNumber.new('AZ').to_i
    assert_equal 53, StringNumber.new('BA').to_i
    assert_equal 78, StringNumber.new('BZ').to_i
    assert_equal 79, StringNumber.new('CA').to_i
    assert_equal 702, StringNumber.new('ZZ').to_i
    assert_equal 703, StringNumber.new('AAA').to_i
    assert_equal 704, StringNumber.new('AAB').to_i
    assert_equal 728, StringNumber.new('AAZ').to_i
    assert_equal 729, StringNumber.new('ABA').to_i
  end

  def test_from_number
    assert_equal 'A', StringNumber[1].to_s
    assert_equal 'Z', StringNumber[26].to_s
    assert_equal 'AA', StringNumber[27].to_s
    assert_equal 'AJ', StringNumber[36].to_s
    assert_equal 'AZ', StringNumber[52].to_s
    assert_equal 'BA', StringNumber[53].to_s
    assert_equal 'BZ', StringNumber[78].to_s
    assert_equal 'CA', StringNumber[79].to_s
    assert_equal 'ZZ', StringNumber[702].to_s
    assert_equal 'AAA', StringNumber[703].to_s
    assert_equal 'AAB', StringNumber[704].to_s
    assert_equal 'AAZ', StringNumber[728].to_s
    assert_equal 'ABA', StringNumber[729].to_s
  end

  def test_addition
    assert_equal 'B', (StringNumber.new('A') + 1).to_s
    assert_equal 'AA', (StringNumber.new('Y') + 2).to_s
    assert_equal 'BA', (StringNumber.new('AX') + 3).to_s
    assert_equal 'CA', (StringNumber.new('BW') + 4).to_s
    assert_equal 'AAAA', (StringNumber.new('ZZV') + 5).to_s

    assert_equal 'B', (StringNumber.new('A') + 'A').to_s
    assert_equal 'C', (StringNumber.new('A') + 'B').to_s

    assert_raise(ArgumentError) { StringNumber.new('A') + Object.new }
  end

  def test_substraction
    assert_equal 'A', (StringNumber.new('B') - 1).to_s
    assert_equal 'Y', (StringNumber.new('AA') - 2).to_s
    assert_equal 'AX', (StringNumber.new('BA') - 3).to_s
    assert_equal 'BW', (StringNumber.new('CA') - 4).to_s
    assert_equal 'ZZV', (StringNumber.new('AAAA') - 5).to_s

    assert_equal 'A', (StringNumber.new('B') - 'A').to_s
    assert_equal 'A', (StringNumber.new('C') - 'B').to_s

    assert_raise(ArgumentError) { StringNumber.new('A') - Object.new }
    assert_raise(StandardError) { StringNumber.new('A') - 1 }
  end

  def test_equality
    assert_equal StringNumber.new('A'), StringNumber.new('A')
    assert_equal StringNumber.new('A'), StringNumber[1]
    assert_equal [StringNumber.new('A')], [StringNumber[1]]

    assert_not_equal StringNumber.new('A'), StringNumber.new('B')
  end

end
