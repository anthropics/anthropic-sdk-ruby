# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaDeletedMessageBatch < Anthropic::BaseModel
          # ID of the Message Batch.
          sig { returns(String) }
          def id
          end

          sig { params(_: String).returns(String) }
          def id=(_)
          end

          # Deleted object type.
          #
          #   For Message Batches, this is always `"message_batch_deleted"`.
          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(id:, type: :message_batch_deleted)
          end

          sig { override.returns({id: String, type: Symbol}) }
          def to_hash
          end
        end
      end
    end
  end
end
