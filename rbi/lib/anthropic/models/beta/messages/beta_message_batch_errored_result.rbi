# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchErroredResult < Anthropic::BaseModel
          sig { returns(Anthropic::Models::BetaErrorResponse) }
          attr_accessor :error

          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(error: Anthropic::Models::BetaErrorResponse, type: Symbol).void }
          def initialize(error:, type: :errored); end

          sig { override.returns({error: Anthropic::Models::BetaErrorResponse, type: Symbol}) }
          def to_hash; end
        end
      end
    end
  end
end
