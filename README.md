FindNBiggestNumbersInText
=========================

[![Build Status](https://travis-ci.org/logrusorgru/find_n_biggest_numbers_in_text.svg?branch=master)](https://travis-ci.org/logrusorgru/find_n_biggest_numbers_in_text)

Find set of biggest numbers in a stdin. It looks for decimal integers
numbers only regardless a sign.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'find_n_biggest_numbers_in_text'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install find_n_biggest_numbers_in_text

## Usage

### Commandline usage

```
cat file_with_numbers.txt | find_n_biggest_numbers_in_text 10
```

The 10 can be any 1+.

### Script usage

```ruby
require 'find_n_biggest_numbers_in_text'

list = FindNBiggestNumbersInText.find STDIN, 10
```

or

```ruby
require 'find_n_biggest_numbers_in_text'

finder = FindNBiggestNumbersInText::Finder.new
list = finder.find STDIN, 10
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/logrusorgru/find_n_biggest_numbers_in_text. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FindNBiggestNumbersInText project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/logrusorgru/find_n_biggest_numbers_in_text/blob/master/CODE_OF_CONDUCT.md).
