# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaDeletedMessageBatch < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Messages::BetaDeletedMessageBatch,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the Message Batch.
          sig { returns(String) }
          attr_accessor :id

          # Deleted object type.
          #
          # For Message Batches, this is always `"message_batch_deleted"`.
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # ID of the Message Batch.
            id:,
            # Deleted object type.
            #
            # For Message Batches, this is always `"message_batch_deleted"`.
            type: :message_batch_deleted
          )
          end

          sig { override.returns({ id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
