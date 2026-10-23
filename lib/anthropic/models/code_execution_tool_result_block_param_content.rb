# frozen_string_literal: true

module Anthropic
  module Models
    module CodeExecutionToolResultBlockParamContent
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::CodeExecutionToolResultErrorParam }

      variant -> { Anthropic::CodeExecutionResultBlockParam }

      # The output and exit code of Python code that Claude ran with the code execution tool, with standard output in encrypted form, sent back in a later request.
      variant -> { Anthropic::EncryptedCodeExecutionResultBlockParam }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::CodeExecutionToolResultErrorParam, Anthropic::Models::CodeExecutionResultBlockParam, Anthropic::Models::EncryptedCodeExecutionResultBlockParam)]
    end
  end
end
