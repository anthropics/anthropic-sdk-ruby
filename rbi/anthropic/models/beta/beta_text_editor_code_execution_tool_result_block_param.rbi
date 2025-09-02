# typed: strong

module Anthropic
  module Models
    BetaTextEditorCodeExecutionToolResultBlockParam =
      Beta::BetaTextEditorCodeExecutionToolResultBlockParam

    module Beta
      class BetaTextEditorCodeExecutionToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.any(
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam,
              Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlockParam,
              Anthropic::Beta::BetaTextEditorCodeExecutionCreateResultBlockParam,
              Anthropic::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlockParam
            )
          )
        end
        attr_accessor :content

        sig { returns(String) }
        attr_accessor :tool_use_id

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        sig do
          params(
            content:
              T.any(
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::OrHash,
                Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlockParam::OrHash,
                Anthropic::Beta::BetaTextEditorCodeExecutionCreateResultBlockParam::OrHash,
                Anthropic::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlockParam::OrHash
              ),
            tool_use_id: String,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          content:,
          tool_use_id:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          type: :text_editor_code_execution_tool_result
        )
        end

        sig do
          override.returns(
            {
              content:
                T.any(
                  Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam,
                  Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlockParam,
                  Anthropic::Beta::BetaTextEditorCodeExecutionCreateResultBlockParam,
                  Anthropic::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlockParam
                ),
              tool_use_id: String,
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)
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
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam,
                Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlockParam,
                Anthropic::Beta::BetaTextEditorCodeExecutionCreateResultBlockParam,
                Anthropic::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlockParam
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlockParam::Content::Variants
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
