# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAdvisorRedactedResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute encrypted_content
        #   Opaque blob containing the advisor's output. Round-trip verbatim; do not inspect
        #   or modify.
        #
        #   @return [String]
        required :encrypted_content, String

        # @!attribute type
        #
        #   @return [Symbol, :advisor_redacted_result]
        required :type, const: :advisor_redacted_result

        # @!method initialize(encrypted_content:, type: :advisor_redacted_result)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaAdvisorRedactedResultBlock} for more details.
        #
        #   @param encrypted_content [String] Opaque blob containing the advisor's output. Round-trip verbatim; do not inspect
        #
        #   @param type [Symbol, :advisor_redacted_result]
      end
    end

    BetaAdvisorRedactedResultBlock = Beta::BetaAdvisorRedactedResultBlock
  end
end
