# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchSucceededResult < Anthropic::BaseModel
          Shape = T.type_alias { {message: Anthropic::Models::Beta::BetaMessage, type: Symbol} }

          sig { returns(Anthropic::Models::Beta::BetaMessage) }
          attr_accessor :message

          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(message: Anthropic::Models::Beta::BetaMessage, type: Symbol).void }
          def initialize(message:, type: :succeeded); end

          sig { returns(Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult::Shape) }
          def to_h; end
        end
      end
    end
  end
end
