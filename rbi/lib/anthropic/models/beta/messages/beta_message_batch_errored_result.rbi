# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchErroredResult < Anthropic::BaseModel
          sig { returns(Anthropic::Models::BetaErrorResponse) }
          attr_reader :error

          sig { params(error: T.any(Anthropic::Models::BetaErrorResponse, Anthropic::Util::AnyHash)).void }
          attr_writer :error

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(error: T.any(Anthropic::Models::BetaErrorResponse, Anthropic::Util::AnyHash), type: Symbol)
              .returns(T.attached_class)
          end
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
