# typed: strong

module Anthropic
  module Models
    class CodeExecutionToolResultBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CodeExecutionToolResultBlock,
            Anthropic::Internal::AnyHash
          )
        end

      # Code execution result with encrypted stdout for PFC + web_search results.
      sig { returns(Anthropic::CodeExecutionToolResultBlockContent::Variants) }
      attr_accessor :content

      sig { returns(String) }
      attr_accessor :tool_use_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content:
            T.any(
              Anthropic::CodeExecutionToolResultError::OrHash,
              Anthropic::CodeExecutionResultBlock::OrHash,
              Anthropic::EncryptedCodeExecutionResultBlock::OrHash
            ),
          tool_use_id: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Code execution result with encrypted stdout for PFC + web_search results.
        content:,
        tool_use_id:,
        type: :code_execution_tool_result
      )
      end

      sig do
        override.returns(
          {
            content: Anthropic::CodeExecutionToolResultBlockContent::Variants,
            tool_use_id: String,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
