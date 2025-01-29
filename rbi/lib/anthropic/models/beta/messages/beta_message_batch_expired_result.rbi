# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchExpiredResult < Anthropic::BaseModel
          Shape = T.type_alias { {type: Symbol} }

          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(type: Symbol).void }
          def initialize(type: :expired); end

          sig { returns(Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult::Shape) }
          def to_h; end
        end
      end
    end
  end
end
