# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module SpendLimits
        module SpendLimitIncreaseRequestStatus
          extend Anthropic::Internal::Type::Enum

          APPROVED = :approved
          DENIED = :denied
          PENDING = :pending

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      SpendLimitIncreaseRequestStatus = SpendLimits::SpendLimitIncreaseRequestStatus
    end
  end
end
