# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchSucceededResult < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Messages::BetaMessageBatchSucceededResult,
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
          def self.new(message:, type: :succeeded)
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
end
