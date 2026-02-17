# typed: strong

module Anthropic
  module Models
    class BashCodeExecutionToolResultBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BashCodeExecutionToolResultBlock,
            Anthropic::Internal::AnyHash
          )
        end

      sig do
        returns(Anthropic::BashCodeExecutionToolResultBlock::Content::Variants)
      end
      attr_accessor :content

      sig { returns(String) }
      attr_accessor :tool_use_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content:
            T.any(
              Anthropic::BashCodeExecutionToolResultError::OrHash,
              Anthropic::BashCodeExecutionResultBlock::OrHash
            ),
          tool_use_id: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        content:,
        tool_use_id:,
        type: :bash_code_execution_tool_result
      )
      end

      sig do
        override.returns(
          {
            content:
              Anthropic::BashCodeExecutionToolResultBlock::Content::Variants,
            tool_use_id: String,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      module Content
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::BashCodeExecutionToolResultError,
              Anthropic::BashCodeExecutionResultBlock
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::BashCodeExecutionToolResultBlock::Content::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
