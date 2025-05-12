# typed: strong

module Anthropic
  module Models
    MessageBatchRequestCounts = Messages::MessageBatchRequestCounts

    module Messages
      class MessageBatchRequestCounts < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Messages::MessageBatchRequestCounts,
              Anthropic::Internal::AnyHash
            )
          end

        # Number of requests in the Message Batch that have been canceled.
        #
        # This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        attr_accessor :canceled

        # Number of requests in the Message Batch that encountered an error.
        #
        # This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        attr_accessor :errored

        # Number of requests in the Message Batch that have expired.
        #
        # This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        attr_accessor :expired

        # Number of requests in the Message Batch that are processing.
        sig { returns(Integer) }
        attr_accessor :processing

        # Number of requests in the Message Batch that have completed successfully.
        #
        # This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        attr_accessor :succeeded

        sig do
          params(
            canceled: Integer,
            errored: Integer,
            expired: Integer,
            processing: Integer,
            succeeded: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of requests in the Message Batch that have been canceled.
          #
          # This is zero until processing of the entire Message Batch has ended.
          canceled:,
          # Number of requests in the Message Batch that encountered an error.
          #
          # This is zero until processing of the entire Message Batch has ended.
          errored:,
          # Number of requests in the Message Batch that have expired.
          #
          # This is zero until processing of the entire Message Batch has ended.
          expired:,
          # Number of requests in the Message Batch that are processing.
          processing:,
          # Number of requests in the Message Batch that have completed successfully.
          #
          # This is zero until processing of the entire Message Batch has ended.
          succeeded:
        )
        end

        sig do
          override.returns(
            {
              canceled: Integer,
              errored: Integer,
              expired: Integer,
              processing: Integer,
              succeeded: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
