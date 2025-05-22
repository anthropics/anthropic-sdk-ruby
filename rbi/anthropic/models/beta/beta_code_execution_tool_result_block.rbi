# typed: strong

module Anthropic
  module Models
    BetaCodeExecutionToolResultBlock = Beta::BetaCodeExecutionToolResultBlock

    module Beta
      class BetaCodeExecutionToolResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCodeExecutionToolResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaCodeExecutionToolResultBlockContent::Variants
          )
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
                Anthropic::Beta::BetaCodeExecutionToolResultError::OrHash,
                Anthropic::Beta::BetaCodeExecutionResultBlock::OrHash
              ),
            tool_use_id: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(content:, tool_use_id:, type: :code_execution_tool_result)
        end

        sig do
          override.returns(
            {
              content:
                Anthropic::Beta::BetaCodeExecutionToolResultBlockContent::Variants,
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
end
