# typed: strong

module Anthropic
  module Models
    BetaClearThinking20251015Edit = Beta::BetaClearThinking20251015Edit

    module Beta
      class BetaClearThinking20251015Edit < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaClearThinking20251015Edit,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Number of most recent assistant turns to keep thinking blocks for. Older turns
        # will have their thinking blocks removed.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaThinkingTurns,
                Anthropic::Beta::BetaAllThinkingTurns,
                Symbol
              )
            )
          )
        end
        attr_reader :keep

        sig do
          params(
            keep:
              T.any(
                Anthropic::Beta::BetaThinkingTurns::OrHash,
                Anthropic::Beta::BetaAllThinkingTurns::OrHash,
                Symbol
              )
          ).void
        end
        attr_writer :keep

        sig do
          params(
            keep:
              T.any(
                Anthropic::Beta::BetaThinkingTurns::OrHash,
                Anthropic::Beta::BetaAllThinkingTurns::OrHash,
                Symbol
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of most recent assistant turns to keep thinking blocks for. Older turns
          # will have their thinking blocks removed.
          keep: nil,
          type: :clear_thinking_20251015
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              keep:
                T.any(
                  Anthropic::Beta::BetaThinkingTurns,
                  Anthropic::Beta::BetaAllThinkingTurns,
                  Symbol
                )
            }
          )
        end
        def to_hash
        end

        # Number of most recent assistant turns to keep thinking blocks for. Older turns
        # will have their thinking blocks removed.
        module Keep
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaThinkingTurns,
                Anthropic::Beta::BetaAllThinkingTurns,
                Symbol
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaClearThinking20251015Edit::Keep::Variants
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
