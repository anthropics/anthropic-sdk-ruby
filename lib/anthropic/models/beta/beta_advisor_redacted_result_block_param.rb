# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAdvisorRedactedResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute encrypted_content
        #   Opaque blob produced by a prior response; must be round-tripped verbatim.
        #
        #   @return [String]
        required :encrypted_content, String

        # @!attribute type
        #
        #   @return [Symbol, :advisor_redacted_result]
        required :type, const: :advisor_redacted_result

        # @!method initialize(encrypted_content:, type: :advisor_redacted_result)
        #   @param encrypted_content [String] Opaque blob produced by a prior response; must be round-tripped verbatim.
        #
        #   @param type [Symbol, :advisor_redacted_result]
      end
    end

    BetaAdvisorRedactedResultBlockParam = Beta::BetaAdvisorRedactedResultBlockParam
  end
end
