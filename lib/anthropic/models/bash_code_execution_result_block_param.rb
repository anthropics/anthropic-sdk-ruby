# frozen_string_literal: true

module Anthropic
  module Models
    class BashCodeExecutionResultBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Array<Anthropic::Models::BashCodeExecutionOutputBlockParam>]
      required :content, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::BashCodeExecutionOutputBlockParam] }

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
      #   @return [Symbol, :bash_code_execution_result]
      required :type, const: :bash_code_execution_result

      # @!method initialize(content:, return_code:, stderr:, stdout:, type: :bash_code_execution_result)
      #   @param content [Array<Anthropic::Models::BashCodeExecutionOutputBlockParam>]
      #   @param return_code [Integer]
      #   @param stderr [String]
      #   @param stdout [String]
      #   @param type [Symbol, :bash_code_execution_result]
    end
  end
end
