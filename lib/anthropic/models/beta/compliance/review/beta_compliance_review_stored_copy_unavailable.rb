# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewStoredCopyUnavailable < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :stored_copy_unavailable]
            required :type, const: :stored_copy_unavailable

            # @!method initialize(type: :stored_copy_unavailable)
            #   A copy of the message was stored and can't be returned.
            #
            #   @param type [Symbol, :stored_copy_unavailable]
          end
        end
      end
    end
  end
end
