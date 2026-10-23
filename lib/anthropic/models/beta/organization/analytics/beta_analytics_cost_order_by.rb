# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          module BetaAnalyticsCostOrderBy
            extend Anthropic::Internal::Type::Enum

            AMOUNT = :amount
            LIST_AMOUNT = :list_amount
            TIME = :time

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
