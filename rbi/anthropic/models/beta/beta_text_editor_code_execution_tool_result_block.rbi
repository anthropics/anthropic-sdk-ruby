# typed: strong

module Anthropic
  module Models
    BetaTextEditorCodeExecutionToolResultBlock =
      Beta::BetaTextEditorCodeExecutionToolResultBlock

    module Beta
      class BetaTextEditorCodeExecutionToolResultBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlock::Content::Variants
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
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::OrHash,
                Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::OrHash,
                Anthropic::Beta::BetaTextEditorCodeExecutionCreateResultBlock::OrHash,
                Anthropic::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlock::OrHash
              ),
            tool_use_id: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          content:,
          tool_use_id:,
          type: :text_editor_code_execution_tool_result
        )
        end

        sig do
          override.returns(
            {
              content:
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlock::Content::Variants,
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
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError,
                Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock,
                Anthropic::Beta::BetaTextEditorCodeExecutionCreateResultBlock,
                Anthropic::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlock
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlock::Content::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
