# typed: strong

module Anthropic
  module Models
    module Messages
      class DeletedMessageBatch < Anthropic::BaseModel
        sig { returns(String) }
        def id
        end

        sig { params(_: String).returns(String) }
        def id=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

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
