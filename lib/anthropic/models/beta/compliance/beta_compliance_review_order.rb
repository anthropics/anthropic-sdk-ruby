# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        # A sort direction: `asc` or `desc`.
        module BetaComplianceReviewOrder
          extend Anthropic::Internal::Type::Enum

          # Oldest first.
          ASC = :asc

          # Newest first.
          DESC = :desc

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
