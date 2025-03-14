# typed: strong

module Anthropic
  module Models
    MessageBatchRequestCounts = T.type_alias { Messages::MessageBatchRequestCounts }

    module Messages
      class MessageBatchRequestCounts < Anthropic::BaseModel
        # Number of requests in the Message Batch that have been canceled.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        def canceled
        end

        sig { params(_: Integer).returns(Integer) }
        def canceled=(_)
        end

        # Number of requests in the Message Batch that encountered an error.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        def errored
        end

        sig { params(_: Integer).returns(Integer) }
        def errored=(_)
        end

        # Number of requests in the Message Batch that have expired.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        def expired
        end

        sig { params(_: Integer).returns(Integer) }
        def expired=(_)
        end

        # Number of requests in the Message Batch that are processing.
        sig { returns(Integer) }
        def processing
        end

        sig { params(_: Integer).returns(Integer) }
        def processing=(_)
        end

        # Number of requests in the Message Batch that have completed successfully.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        def succeeded
        end

        sig { params(_: Integer).returns(Integer) }
        def succeeded=(_)
        end

        sig do
          params(
            canceled: Integer,
            errored: Integer,
            expired: Integer,
            processing: Integer,
            succeeded: Integer
          )
            .returns(T.attached_class)
        end
        def self.new(canceled:, errored:, expired:, processing:, succeeded:)
        end

        sig do
          override
            .returns({
                       canceled: Integer,
                       errored: Integer,
                       expired: Integer,
                       processing: Integer,
                       succeeded: Integer
                     })
        end
        def to_hash
        end
      end
    end
  end
end
