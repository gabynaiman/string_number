class StringNumber
  SYMBOLS = Hash[('A'..'Z').each_with_index.map{|s,i| [s,i+1]}]

  def initialize(value)
    raise ArgumentError, "Invalid value for #{self.class.name} (#{value})" unless self.class.valid(value)
    @value = value.upcase
  end

  def +(value)
    self.class[to_i + number_of(value)]
  end

  def -(value)
    number = number_of(value)
    result = to_i - number
    raise StandardError, "Cant substract from #{number} to #{to_s}" if result < 1
    self.class[result]
  end

  def eql?(other)
    return false unless other.is_a? self.class
    to_s.eql?(other.to_s)
  end

  def ==(other)
    return false unless other.is_a? self.class
    to_s == other.to_s
  end

  def to_s
    @value
  end

  def to_i
    segments = @value.reverse.split('')
    units = segments.each_with_index.map{ |s,i| SYMBOLS[s] * self.class.base**i }
    units.inject(:+)
  end

  def self.[](number)
    return self.new(SYMBOLS.keys[number-1]) if number <= SYMBOLS.count

    quotient = number / base
    reminder = number % base
    quotient -= 1 if reminder == 0
    recursive = self[quotient].to_s if quotient > 0
    self.new((recursive || '') + SYMBOLS.keys[reminder-1])
  end

  def self.base
    SYMBOLS.count
  end

  def self.valid(string)
    return false unless string.is_a? String
    string.match(/[A-Z]*/i).to_s == string
  end

  private

  def number_of(value)
    if value.is_a? Integer
      value
    elsif self.class.valid(value)
      self.class.new(value).to_i
    else
      raise ArgumentError, "Cant convert #{value} to a number"
    end
  end

end