# typed: strong

module Anthropic
  module Models
    module Messages
      class MessageBatchErroredResult < Anthropic::BaseModel
        sig { returns(Anthropic::Models::ErrorResponse) }
        def error
        end

        sig { params(_: Anthropic::Models::ErrorResponse).returns(Anthropic::Models::ErrorResponse) }
        def error=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(error: Anthropic::Models::ErrorResponse, type: Symbol).returns(T.attached_class) }
        def self.new(error:, type: :errored)
        end

        sig { override.returns({error: Anthropic::Models::ErrorResponse, type: Symbol}) }
        def to_hash
        end
      end
    end

    MessageBatchErroredResult = Messages::MessageBatchErroredResult
  end
end
