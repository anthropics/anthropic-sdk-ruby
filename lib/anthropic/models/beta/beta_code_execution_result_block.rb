# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCodeExecutionResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Array<Anthropic::Models::Beta::BetaCodeExecutionOutputBlock>]
        required :content,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaCodeExecutionOutputBlock] }

        # @!attribute return_code
        #
        #   @return [Integer]
        required :return_code, Integer

        # @!attribute stderr
        #
        #   @return [String]
        required :stderr, String

        # @!attribute stdout
        #
        #   @return [String]
        required :stdout, String

        # @!attribute type
        #
        #   @return [Symbol, :code_execution_result]
        required :type, const: :code_execution_result

        # @!method initialize(content:, return_code:, stderr:, stdout:, type: :code_execution_result)
        #   @param content [Array<Anthropic::Models::Beta::BetaCodeExecutionOutputBlock>]
        #   @param return_code [Integer]
        #   @param stderr [String]
        #   @param stdout [String]
        #   @param type [Symbol, :code_execution_result]
      end
    end

    BetaCodeExecutionResultBlock = Beta::BetaCodeExecutionResultBlock
  end
end
