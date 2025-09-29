# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCountTokensContextManagementResponse < Anthropic::Internal::Type::BaseModel
        # @!attribute original_input_tokens
        #   The original token count before context management was applied
        #
        #   @return [Integer]
        required :original_input_tokens, Integer

        # @!method initialize(original_input_tokens:)
        #   @param original_input_tokens [Integer] The original token count before context management was applied
      end
    end

    BetaCountTokensContextManagementResponse = Beta::BetaCountTokensContextManagementResponse
  end
end
