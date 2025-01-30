# typed: strong

module Anthropic
  module Models
    BetaRawMessageDeltaEvent = T.type_alias { Beta::BetaRawMessageDeltaEvent }

    module Beta
      class BetaRawMessageDeltaEvent < Anthropic::BaseModel
        Shape = T.type_alias do
          {
            delta: Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta,
            type: Symbol,
            usage: Anthropic::Models::Beta::BetaMessageDeltaUsage
          }
        end

        sig { returns(Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta) }
        attr_accessor :delta

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(Anthropic::Models::Beta::BetaMessageDeltaUsage) }
        attr_accessor :usage

        sig do
          params(
            delta: Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta,
            usage: Anthropic::Models::Beta::BetaMessageDeltaUsage,
            type: Symbol
          ).void
        end
        def initialize(delta:, usage:, type: :message_delta); end

        sig { returns(Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Shape) }
        def to_h; end

        class Delta < Anthropic::BaseModel
          Shape = T.type_alias { {stop_reason: T.nilable(Symbol), stop_sequence: T.nilable(String)} }

          sig { returns(T.nilable(Symbol)) }
          attr_accessor :stop_reason

          sig { returns(T.nilable(String)) }
          attr_accessor :stop_sequence

          sig { params(stop_reason: T.nilable(Symbol), stop_sequence: T.nilable(String)).void }
          def initialize(stop_reason:, stop_sequence:); end

          sig { returns(Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta::Shape) }
          def to_h; end

          class StopReason < Anthropic::Enum
            abstract!

            END_TURN = T.let(:end_turn, T.nilable(Symbol))
            MAX_TOKENS = T.let(:max_tokens, T.nilable(Symbol))
            STOP_SEQUENCE = T.let(:stop_sequence, T.nilable(Symbol))
            TOOL_USE = T.let(:tool_use, T.nilable(Symbol))

            sig { override.returns(T::Array[Symbol]) }
            def self.values; end
          end
        end
      end
    end
  end
end
