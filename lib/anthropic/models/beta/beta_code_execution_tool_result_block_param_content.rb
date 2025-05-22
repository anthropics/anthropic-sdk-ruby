# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaCodeExecutionToolResultBlockParamContent
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Beta::BetaCodeExecutionToolResultErrorParam }

        variant -> { Anthropic::Beta::BetaCodeExecutionResultBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaCodeExecutionResultBlockParam)]
      end
    end

    BetaCodeExecutionToolResultBlockParamContent = Beta::BetaCodeExecutionToolResultBlockParamContent
  end
end
