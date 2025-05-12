# typed: strong

module Anthropic
  module Models
    MessageBatchSucceededResult = Messages::MessageBatchSucceededResult

    module Messages
      class MessageBatchSucceededResult < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Messages::MessageBatchSucceededResult,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Anthropic::Message) }
        attr_reader :message

        sig { params(message: Anthropic::Message::OrHash).void }
        attr_writer :message

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(message: Anthropic::Message::OrHash, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(message:, type: :succeeded)
        end

        sig { override.returns({ message: Anthropic::Message, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
