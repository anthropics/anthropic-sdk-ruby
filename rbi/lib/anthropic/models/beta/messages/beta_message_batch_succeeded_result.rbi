# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchSucceededResult < Anthropic::BaseModel
          sig { returns(Anthropic::Models::Beta::BetaMessage) }
          def message
          end

          sig do
            params(_: T.any(Anthropic::Models::Beta::BetaMessage, Anthropic::Util::AnyHash))
              .returns(T.any(Anthropic::Models::Beta::BetaMessage, Anthropic::Util::AnyHash))
          end
          def message=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig do
            params(message: T.any(Anthropic::Models::Beta::BetaMessage, Anthropic::Util::AnyHash), type: Symbol)
              .returns(T.attached_class)
          end
          def self.new(message:, type: :succeeded)
          end

          sig { override.returns({message: Anthropic::Models::Beta::BetaMessage, type: Symbol}) }
          def to_hash
          end
        end
      end
    end
  end
end
