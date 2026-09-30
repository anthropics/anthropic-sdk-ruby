# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaSpendLimitPeriod
          extend Anthropic::Internal::Type::Enum

          DAILY = :daily
          MONTHLY = :monthly
          WEEKLY = :weekly

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
