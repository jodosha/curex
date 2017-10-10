# frozen_string_literal: true

require "hanami/cli"
require "bigdecimal"
require "money"
require "money/bank/google_currency"

module Curex
  require "curex/version"

  class Converter
    SCALE = 100

    def initialize
      Money.use_i18n = false
      Money.default_bank = Money::Bank::GoogleCurrency.new
    end

    def call(amount, from, to)
      money = Money.new(amount.to_d * SCALE, from)
      money.exchange_to(to)
    end
  end

  class CLI
    def call(*args)
      Hanami::CLI.new(Commands).call(*args)
    end

    module Commands
      extend Hanami::CLI::Registry

      class Convert < Hanami::CLI::Command
        desc "Convert an amount from one currency to another"

        argument :amount, required: true, desc: "the amount of money to convert"
        argument :from,   required: true, desc: "the starting currency"
        argument :to,     required: true, desc: "the final currency"

        example [
          "100 USD EUR # convert 100 USD to EUR"
        ]

        def call(amount:, from:, to:, **)
          result = Converter.new.call(amount, from, to)
          puts "#{amount} #{from} == #{result} #{to}"
        end
      end

      register "convert", Convert, aliases: ["c"]
    end
  end
end
