# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          module BetaSpendLimitIncreaseRequestStatus
            extend Anthropic::Internal::Type::Enum

            APPROVED = :approved
            DENIED = :denied
            PENDING = :pending

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
