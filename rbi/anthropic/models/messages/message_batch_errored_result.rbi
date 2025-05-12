# typed: strong

module Anthropic
  module Models
    MessageBatchErroredResult = Messages::MessageBatchErroredResult

    module Messages
      class MessageBatchErroredResult < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Messages::MessageBatchErroredResult,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Anthropic::ErrorResponse) }
        attr_reader :error

        sig { params(error: Anthropic::ErrorResponse::OrHash).void }
        attr_writer :error

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(error: Anthropic::ErrorResponse::OrHash, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(error:, type: :errored)
        end

        sig do
          override.returns({ error: Anthropic::ErrorResponse, type: Symbol })
        end
        def to_hash
        end
      end
    end
  end
end
