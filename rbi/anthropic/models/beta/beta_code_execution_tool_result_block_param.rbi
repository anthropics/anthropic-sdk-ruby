# typed: strong

module Anthropic
  module Models
    BetaCodeExecutionToolResultBlockParam =
      Beta::BetaCodeExecutionToolResultBlockParam

    module Beta
      class BetaCodeExecutionToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCodeExecutionToolResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.any(
              Anthropic::Beta::BetaCodeExecutionToolResultErrorParam,
              Anthropic::Beta::BetaCodeExecutionResultBlockParam
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
                Anthropic::Beta::BetaCodeExecutionToolResultErrorParam::OrHash,
                Anthropic::Beta::BetaCodeExecutionResultBlockParam::OrHash
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
          type: :code_execution_tool_result
        )
        end

        sig do
          override.returns(
            {
              content:
                T.any(
                  Anthropic::Beta::BetaCodeExecutionToolResultErrorParam,
                  Anthropic::Beta::BetaCodeExecutionResultBlockParam
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
      end
    end
  end
end
