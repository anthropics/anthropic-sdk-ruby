# typed: strong

module Anthropic
  module Models
    BetaMessage = T.type_alias { Beta::BetaMessage }

    module Beta
      class BetaMessage < Anthropic::BaseModel
        sig { returns(String) }
        def id
        end

        sig { params(_: String).returns(String) }
        def id=(_)
        end

        sig do
          returns(
            T::Array[T.any(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock)]
          )
        end
        def content
        end

        sig do
          params(
            _: T::Array[T.any(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock)]
          )
            .returns(
              T::Array[T.any(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock)]
            )
        end
        def content=(_)
        end

        sig { returns(T.any(Symbol, String)) }
        def model
        end

        sig { params(_: T.any(Symbol, String)).returns(T.any(Symbol, String)) }
        def model=(_)
        end

        sig { returns(Symbol) }
        def role
        end

        sig { params(_: Symbol).returns(Symbol) }
        def role=(_)
        end

        sig { returns(T.nilable(Symbol)) }
        def stop_reason
        end

        sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
        def stop_reason=(_)
        end

        sig { returns(T.nilable(String)) }
        def stop_sequence
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def stop_sequence=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { returns(Anthropic::Models::Beta::BetaUsage) }
        def usage
        end

        sig { params(_: Anthropic::Models::Beta::BetaUsage).returns(Anthropic::Models::Beta::BetaUsage) }
        def usage=(_)
        end

        sig do
          params(
            id: String,
            content: T::Array[T.any(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock)],
            model: T.any(Symbol, String),
            stop_reason: T.nilable(Symbol),
            stop_sequence: T.nilable(String),
            usage: Anthropic::Models::Beta::BetaUsage,
            role: Symbol,
            type: Symbol
          )
            .void
        end
        def initialize(
          id:,
          content:,
          model:,
          stop_reason:,
          stop_sequence:,
          usage:,
          role: :assistant,
          type: :message
        )
        end

        sig do
          override
            .returns(
              {
                id: String,
                content: T::Array[T.any(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock)],
                model: T.any(Symbol, String),
                role: Symbol,
                stop_reason: T.nilable(Symbol),
                stop_sequence: T.nilable(String),
                type: Symbol,
                usage: Anthropic::Models::Beta::BetaUsage
              }
            )
        end
        def to_hash
        end

        class StopReason < Anthropic::Enum
          abstract!

          END_TURN = T.let(:end_turn, T.nilable(Symbol))
          MAX_TOKENS = T.let(:max_tokens, T.nilable(Symbol))
          STOP_SEQUENCE = T.let(:stop_sequence, T.nilable(Symbol))
          TOOL_USE = T.let(:tool_use, T.nilable(Symbol))

          sig { override.returns(T::Array[Symbol]) }
          def self.values
          end
        end
      end
    end
  end
end
