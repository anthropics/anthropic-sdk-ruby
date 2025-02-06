# typed: strong

module Anthropic
  module Models
    MessageBatchErroredResult = T.type_alias { Messages::MessageBatchErroredResult }

    module Messages
      class MessageBatchErroredResult < Anthropic::BaseModel
        sig { returns(Anthropic::Models::ErrorResponse) }
        attr_accessor :error

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(error: Anthropic::Models::ErrorResponse, type: Symbol).void }
        def initialize(error:, type: :errored)
        end

        sig { override.returns({error: Anthropic::Models::ErrorResponse, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
