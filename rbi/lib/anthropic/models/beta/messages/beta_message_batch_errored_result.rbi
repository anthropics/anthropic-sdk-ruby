# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchErroredResult < Anthropic::BaseModel
          Shape = T.type_alias { {error: Anthropic::Models::BetaErrorResponse, type: Symbol} }

          sig { returns(Anthropic::Models::BetaErrorResponse) }
          attr_accessor :error

          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(error: Anthropic::Models::BetaErrorResponse, type: Symbol).void }
          def initialize(error:, type: :errored); end

          sig { returns(Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult::Shape) }
          def to_h; end
        end
      end
    end
  end
end
