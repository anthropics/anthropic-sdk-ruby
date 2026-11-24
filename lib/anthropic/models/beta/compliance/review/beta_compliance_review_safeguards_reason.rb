# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewSafeguardsReason < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :safeguards_review]
            required :type, const: :safeguards_review

            # @!method initialize(type: :safeguards_review)
            #   Anthropic flagged the item for your organization to review.
            #
            #   @param type [Symbol, :safeguards_review]
          end
        end
      end
    end
  end
end
