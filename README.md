# StringNumber

[![Gem Version](https://badge.fury.io/rb/string_number.png)](https://rubygems.org/gems/string_number)
[![Build Status](https://travis-ci.org/gabynaiman/string_number.png?branch=master)](https://travis-ci.org/gabynaiman/string_number)
[![Coverage Status](https://coveralls.io/repos/gabynaiman/string_number/badge.png)](https://coveralls.io/r/gabynaiman/string_number)
[![Code Climate](https://codeclimate.com/github/gabynaiman/string_number.png)](https://codeclimate.com/github/gabynaiman/string_number)
[![Dependency Status](https://gemnasium.com/gabynaiman/string_number.png)](https://gemnasium.com/gabynaiman/string_number)

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
