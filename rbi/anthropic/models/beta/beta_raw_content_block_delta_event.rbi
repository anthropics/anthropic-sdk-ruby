# typed: strong

module Anthropic
  module Models
    BetaRawContentBlockDeltaEvent = Beta::BetaRawContentBlockDeltaEvent

    module Beta
      class BetaRawContentBlockDeltaEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRawContentBlockDeltaEvent,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Anthropic::Beta::BetaRawContentBlockDelta::Variants) }
        attr_accessor :delta

        sig { returns(Integer) }
        attr_accessor :index

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            delta:
              T.any(
                Anthropic::Beta::BetaTextDelta::OrHash,
                Anthropic::Beta::BetaInputJSONDelta::OrHash,
                Anthropic::Beta::BetaCitationsDelta::OrHash,
                Anthropic::Beta::BetaThinkingDelta::OrHash,
                Anthropic::Beta::BetaSignatureDelta::OrHash
              ),
            index: Integer,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(delta:, index:, type: :content_block_delta)
        end

        sig do
          override.returns(
            {
              delta: Anthropic::Beta::BetaRawContentBlockDelta::Variants,
              index: Integer,
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
