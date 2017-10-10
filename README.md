# CurEx

CURrency EXchange command line utility.

This is a proof of concept to use [`hanami-cli`](https://github.com/hanami/cli)

## Installation

```shell
$ gem install curex
```

## Usage

```shell
$ curex --help
Commands:
  curex convert AMOUNT FROM TO                # Convert an amount from one currency to another
```

```shell
$ curex convert --help
Command:
  curex convert

Usage:
  curex convert AMOUNT FROM TO

Description:
  Convert an amount from one currency to another

Arguments:
  AMOUNT              	# REQUIRED the amount of money to convert
  FROM                	# REQUIRED the starting currency
  TO                  	# REQUIRED the final currency

Options:
  --help, -h                      	# Print this help

Examples:
  curex convert 100 USD EUR # convert 100 USD to EUR
```

```shell
$ curex convert 100 USD EUR
100 USD == 84,90 EUR
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jodosha/curex.

## Copyright

[Luca Guidi](https://lucaguidi.com) &copy; 2017 - Released under the MIT License
