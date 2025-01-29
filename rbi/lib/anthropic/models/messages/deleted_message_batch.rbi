# typed: strong

module Anthropic
  module Models
    module Messages
      class DeletedMessageBatch < Anthropic::BaseModel
        Shape = T.type_alias { {id: String, type: Symbol} }

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(id: String, type: Symbol).void }
        def initialize(id:, type: :message_batch_deleted); end

        sig { returns(Anthropic::Models::Messages::DeletedMessageBatch::Shape) }
        def to_h; end
      end
    end
  end
end
