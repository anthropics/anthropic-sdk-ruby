# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchErroredResult < Anthropic::BaseModel
          sig { returns(Anthropic::Models::BetaErrorResponse) }
          def error
          end

          sig do
            params(_: T.any(Anthropic::Models::BetaErrorResponse, Anthropic::Util::AnyHash))
              .returns(T.any(Anthropic::Models::BetaErrorResponse, Anthropic::Util::AnyHash))
          end
          def error=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { params(error: Anthropic::Models::BetaErrorResponse, type: Symbol).returns(T.attached_class) }
          def self.new(error:, type: :errored)
          end

          sig { override.returns({error: Anthropic::Models::BetaErrorResponse, type: Symbol}) }
          def to_hash
          end
        end
      end
    end
  end
end
