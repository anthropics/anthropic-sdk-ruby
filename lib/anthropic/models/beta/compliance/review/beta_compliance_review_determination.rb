# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # A conclusion on flagged messages: `violation` or `no_violation`.
          module BetaComplianceReviewDetermination
            extend Anthropic::Internal::Type::Enum

            # The messages violated a policy.
            VIOLATION = :violation

            # The messages violated no policy.
            NO_VIOLATION = :no_violation

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
