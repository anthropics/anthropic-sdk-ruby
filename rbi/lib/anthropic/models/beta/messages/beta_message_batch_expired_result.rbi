# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchExpiredResult < Anthropic::BaseModel
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :expired)
          end

          sig { override.returns({type: Symbol}) }
          def to_hash
          end
        end
      end
    end
  end
end
