# typed: strong

module Anthropic
  module Models
    BetaClearToolUses20250919EditResponse =
      Beta::BetaClearToolUses20250919EditResponse

    module Beta
      class BetaClearToolUses20250919EditResponse < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaClearToolUses20250919EditResponse,
              Anthropic::Internal::AnyHash
            )
          end

        # Number of input tokens cleared by this edit.
        sig { returns(Integer) }
        attr_accessor :cleared_input_tokens

        # Number of tool uses that were cleared.
        sig { returns(Integer) }
        attr_accessor :cleared_tool_uses

        # The type of context management edit applied.
        sig { returns(Symbol) }
        attr_accessor :type

        # Results for clear_tool_uses_20250919 edit.
        sig do
          params(
            cleared_input_tokens: Integer,
            cleared_tool_uses: Integer,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of input tokens cleared by this edit.
          cleared_input_tokens:,
          # Number of tool uses that were cleared.
          cleared_tool_uses:,
          # The type of context management edit applied.
          type: :clear_tool_uses_20250919
        )
        end

        sig do
          override.returns(
            {
              cleared_input_tokens: Integer,
              cleared_tool_uses: Integer,
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
