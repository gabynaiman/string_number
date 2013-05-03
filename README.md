# StringNumber

[![Build Status](https://travis-ci.org/gabynaiman/string_number.png?branch=master)](https://travis-ci.org/gabynaiman/string_number)

Strings as a numbers

## Installation

Add this line to your application's Gemfile:

    gem 'string_number'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_number

## Usage

    str = StringNumber.new 'X'
    str + 1 # => Y
    str + 2 # => Z
    str - 1 # => W
    str + 'A' # => Y

    str.to_i # => 24

    StringNumber[1] # => 'A'
    StringNumber[26] # => 'Z'
    StringNumber[27] # => 'AA'

    StringNumber[1] == (StringNumber[2] - 1) # => true

    StringNumber.valid 'ABC' # => true
    StringNumber.valid '123' # => false

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
