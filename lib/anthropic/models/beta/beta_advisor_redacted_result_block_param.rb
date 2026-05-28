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

        # @!attribute stop_reason
        #
        #   @return [String, nil]
        optional :stop_reason, String, nil?: true

        # @!method initialize(encrypted_content:, stop_reason: nil, type: :advisor_redacted_result)
        #   @param encrypted_content [String] Opaque blob produced by a prior response; must be round-tripped verbatim.
        #
        #   @param stop_reason [String, nil]
        #
        #   @param type [Symbol, :advisor_redacted_result]
      end
    end

    BetaAdvisorRedactedResultBlockParam = Beta::BetaAdvisorRedactedResultBlockParam
  end
end
