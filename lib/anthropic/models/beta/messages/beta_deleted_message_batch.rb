# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaDeletedMessageBatch < Anthropic::BaseModel
          # @!attribute id
          #   ID of the Message Batch.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Deleted object type.
          #
          # For Message Batches, this is always `"message_batch_deleted"`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaDeletedMessageBatch::Type]
          required :type, enum: -> { Anthropic::Models::Beta::Messages::BetaDeletedMessageBatch::Type }

          # @!parse
          #   # @param id [String] ID of the Message Batch.
          #   #
          #   # @param type [String] Deleted object type.
          #   #
          #   #   For Message Batches, this is always `"message_batch_deleted"`.
          #   #
          #   def initialize(id:, type:, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # Deleted object type.
          #
          # For Message Batches, this is always `"message_batch_deleted"`.
          #
          # @example
          #
          # ```ruby
          # case enum
          # in :message_batch_deleted
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            MESSAGE_BATCH_DELETED = :message_batch_deleted
          end
        end
      end
    end
  end
end
