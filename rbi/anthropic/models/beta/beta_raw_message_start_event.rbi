# typed: strong

module Anthropic
  module Models
    BetaRawMessageStartEvent = Beta::BetaRawMessageStartEvent

    module Beta
      class BetaRawMessageStartEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRawMessageStartEvent,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Anthropic::Beta::BetaMessage) }
        attr_reader :message

        sig { params(message: Anthropic::Beta::BetaMessage::OrHash).void }
        attr_writer :message

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            message: Anthropic::Beta::BetaMessage::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(message:, type: :message_start)
        end

        sig do
          override.returns(
            { message: Anthropic::Beta::BetaMessage, type: Symbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
