# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaCodeExecutionToolResultBlockParamContent
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Beta::BetaCodeExecutionToolResultErrorParam }

        variant -> { Anthropic::Beta::BetaCodeExecutionResultBlockParam }

        # The output and exit code of Python code that Claude ran with the code execution tool, with standard output in encrypted form, sent back in a later request.
        variant -> { Anthropic::Beta::BetaEncryptedCodeExecutionResultBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaCodeExecutionResultBlockParam, Anthropic::Models::Beta::BetaEncryptedCodeExecutionResultBlockParam)]
      end
    end

    BetaCodeExecutionToolResultBlockParamContent = Beta::BetaCodeExecutionToolResultBlockParamContent
  end
end
