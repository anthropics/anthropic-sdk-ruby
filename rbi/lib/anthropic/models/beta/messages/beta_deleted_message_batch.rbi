# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaDeletedMessageBatch < Anthropic::BaseModel
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(id: String, type: Symbol).void }
          def initialize(id:, type: :message_batch_deleted)
          end

          sig { override.returns({id: String, type: Symbol}) }
          def to_hash
          end
        end
      end
    end
  end
end
