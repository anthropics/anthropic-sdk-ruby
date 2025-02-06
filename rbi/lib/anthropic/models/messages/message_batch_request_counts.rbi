# typed: strong

module Anthropic
  module Models
    MessageBatchRequestCounts = T.type_alias { Messages::MessageBatchRequestCounts }

    module Messages
      class MessageBatchRequestCounts < Anthropic::BaseModel
        sig { returns(Integer) }
        attr_accessor :canceled

        sig { returns(Integer) }
        attr_accessor :errored

        sig { returns(Integer) }
        attr_accessor :expired

        sig { returns(Integer) }
        attr_accessor :processing

        sig { returns(Integer) }
        attr_accessor :succeeded

        sig do
          params(
            canceled: Integer,
            errored: Integer,
            expired: Integer,
            processing: Integer,
            succeeded: Integer
          ).void
        end
        def initialize(canceled:, errored:, expired:, processing:, succeeded:)
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
