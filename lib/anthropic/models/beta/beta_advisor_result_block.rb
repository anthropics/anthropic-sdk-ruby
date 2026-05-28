# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAdvisorResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute stop_reason
        #   The advisor sub-inference's stop reason (same values as the top-level message
        #   `stop_reason`). `max_tokens` indicates the advisor's output was truncated at the
        #   tool's `max_tokens` value or the advisor model's policy cap.
        #
        #   @return [String, nil]
        required :stop_reason, String, nil?: true

        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, :advisor_result]
        required :type, const: :advisor_result

        # @!method initialize(stop_reason:, text:, type: :advisor_result)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaAdvisorResultBlock} for more details.
        #
        #   @param stop_reason [String, nil] The advisor sub-inference's stop reason (same values as the top-level message `s
        #
        #   @param text [String]
        #
        #   @param type [Symbol, :advisor_result]
      end
    end

    BetaAdvisorResultBlock = Beta::BetaAdvisorResultBlock
  end
end
