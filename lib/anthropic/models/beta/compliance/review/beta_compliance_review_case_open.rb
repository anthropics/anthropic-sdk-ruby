# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewCaseOpen < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :open]
            required :type, const: :open

            # @!method initialize(type: :open)
            #   Anthropic is waiting for a response to the case.
            #
            #   @param type [Symbol, :open]
          end
        end
      end
    end
  end
end
