# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchSucceededResult < Anthropic::Internal::Type::BaseModel
          sig { returns(Anthropic::Models::Beta::BetaMessage) }
          attr_reader :message

          sig { params(message: T.any(Anthropic::Models::Beta::BetaMessage, Anthropic::Internal::AnyHash)).void }
          attr_writer :message

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(message: T.any(Anthropic::Models::Beta::BetaMessage, Anthropic::Internal::AnyHash), type: Symbol)
              .returns(T.attached_class)
          end
          def self.new(message:, type: :succeeded); end

          sig { override.returns({message: Anthropic::Models::Beta::BetaMessage, type: Symbol}) }
          def to_hash; end
        end
      end
    end
  end
end
