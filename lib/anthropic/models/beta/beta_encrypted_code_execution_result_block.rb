# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaEncryptedCodeExecutionResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Array<Anthropic::Models::Beta::BetaCodeExecutionOutputBlock>]
        required :content,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaCodeExecutionOutputBlock] }

        # @!attribute encrypted_stdout
        #
        #   @return [String]
        required :encrypted_stdout, String

        # @!attribute return_code
        #
        #   @return [Integer]
        required :return_code, Integer

        # @!attribute stderr
        #
        #   @return [String]
        required :stderr, String

        # @!attribute type
        #
        #   @return [Symbol, :encrypted_code_execution_result]
        required :type, const: :encrypted_code_execution_result

        # @!method initialize(content:, encrypted_stdout:, return_code:, stderr:, type: :encrypted_code_execution_result)
        #   Code execution result with encrypted stdout for PFC + web_search results.
        #
        #   @param content [Array<Anthropic::Models::Beta::BetaCodeExecutionOutputBlock>]
        #   @param encrypted_stdout [String]
        #   @param return_code [Integer]
        #   @param stderr [String]
        #   @param type [Symbol, :encrypted_code_execution_result]
      end
    end

    BetaEncryptedCodeExecutionResultBlock = Beta::BetaEncryptedCodeExecutionResultBlock
  end
end
