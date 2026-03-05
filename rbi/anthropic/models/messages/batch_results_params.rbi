# typed: strong

module Anthropic
  module Models
    module Messages
      class BatchResultsParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Messages::BatchResultsParams,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the Message Batch.
        sig { returns(String) }
        attr_accessor :message_batch_id

        sig do
          params(
            message_batch_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the Message Batch.
          message_batch_id:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              message_batch_id: String,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
