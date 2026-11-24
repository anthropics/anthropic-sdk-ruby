# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # A review case status to filter by: `open` or `closed`.
          module BetaComplianceReviewCaseStatusFilter
            extend Anthropic::Internal::Type::Enum

            # Cases that Anthropic is waiting for a response to.
            OPEN = :open

            # Cases that Anthropic has stopped waiting on.
            CLOSED = :closed

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
