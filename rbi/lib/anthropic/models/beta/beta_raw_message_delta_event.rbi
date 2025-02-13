# typed: strong

module Anthropic
  module Models
    BetaRawMessageDeltaEvent = T.type_alias { Beta::BetaRawMessageDeltaEvent }

    module Beta
      class BetaRawMessageDeltaEvent < Anthropic::BaseModel
        sig { returns(Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta) }
        def delta
        end

        sig do
          params(_: Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta).returns(Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta)
        end
        def delta=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { returns(Anthropic::Models::Beta::BetaMessageDeltaUsage) }
        def usage
        end

        sig do
          params(_: Anthropic::Models::Beta::BetaMessageDeltaUsage).returns(Anthropic::Models::Beta::BetaMessageDeltaUsage)
        end
        def usage=(_)
        end

        sig do
          params(
            delta: Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta,
            usage: Anthropic::Models::Beta::BetaMessageDeltaUsage,
            type: Symbol
          ).void
        end
        def initialize(delta:, usage:, type: :message_delta)
        end

        sig do
          override.returns(
            {
              delta: Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta,
              type: Symbol,
              usage: Anthropic::Models::Beta::BetaMessageDeltaUsage
            }
          )
        end
        def to_hash
        end

        class Delta < Anthropic::BaseModel
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

          sig { params(stop_reason: T.nilable(Symbol), stop_sequence: T.nilable(String)).void }
          def initialize(stop_reason:, stop_sequence:)
          end

          sig { override.returns({stop_reason: T.nilable(Symbol), stop_sequence: T.nilable(String)}) }
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
end
