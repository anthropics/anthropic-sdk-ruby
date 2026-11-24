# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewContentNotCaptured < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :not_captured]
            required :type, const: :not_captured

            # @!method initialize(type: :not_captured)
            #   No copy of the message was stored.
            #
            #   @param type [Symbol, :not_captured]
          end
        end
      end
    end
  end
end
