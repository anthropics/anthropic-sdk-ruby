# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchErroredResult < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Anthropic::Internal::AnyHash) }

          sig { returns(Anthropic::BetaErrorResponse) }
          attr_reader :error

          sig { params(error: Anthropic::BetaErrorResponse::OrHash).void }
          attr_writer :error

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(
              error: Anthropic::BetaErrorResponse::OrHash,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(error:, type: :errored)
          end

          sig do
            override.returns(
              { error: Anthropic::BetaErrorResponse, type: Symbol }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
