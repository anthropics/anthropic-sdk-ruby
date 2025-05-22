# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaCodeExecutionToolResultBlockContent
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Beta::BetaCodeExecutionToolResultError }

        variant -> { Anthropic::Beta::BetaCodeExecutionResultBlock }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaCodeExecutionToolResultError, Anthropic::Models::Beta::BetaCodeExecutionResultBlock)]
      end
    end

    BetaCodeExecutionToolResultBlockContent = Beta::BetaCodeExecutionToolResultBlockContent
  end
end
