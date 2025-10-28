# typed: strong

module Anthropic
  module Models
    BetaClearThinking20251015EditResponse =
      Beta::BetaClearThinking20251015EditResponse

    module Beta
      class BetaClearThinking20251015EditResponse < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaClearThinking20251015EditResponse,
              Anthropic::Internal::AnyHash
            )
          end

        # Number of input tokens cleared by this edit.
        sig { returns(Integer) }
        attr_accessor :cleared_input_tokens

        # Number of thinking turns that were cleared.
        sig { returns(Integer) }
        attr_accessor :cleared_thinking_turns

        # The type of context management edit applied.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            cleared_input_tokens: Integer,
            cleared_thinking_turns: Integer,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of input tokens cleared by this edit.
          cleared_input_tokens:,
          # Number of thinking turns that were cleared.
          cleared_thinking_turns:,
          # The type of context management edit applied.
          type: :clear_thinking_20251015
        )
        end

        sig do
          override.returns(
            {
              cleared_input_tokens: Integer,
              cleared_thinking_turns: Integer,
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
