# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewEnforcementAction < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #   The kind of action. New values can appear, so accept a value that you don't
            #   know.
            #
            #   @return [String]
            required :type, String

            # @!method initialize(type:)
            #   An action that Anthropic took on the flagged traffic.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewEnforcementAction}
            #   for more details.
            #
            #   @param type [String] The kind of action. New values can appear, so accept a value that you don't know
          end
        end
      end
    end
  end
end
