# typed: strong

module Anthropic
  module Models
    MessageBatchResult = T.type_alias { Messages::MessageBatchResult }

    module Messages
      # Processing result for this request.
      #
      #   Contains a Message output if processing was successful, an error response if
      #   processing failed, or the reason why processing was not attempted, such as
      #   cancellation or expiration.
      class MessageBatchResult < Anthropic::Union
        abstract!

        class << self
          # @api private
          sig do
            override
              .returns(
                [[Symbol, Anthropic::Models::Messages::MessageBatchSucceededResult], [Symbol, Anthropic::Models::Messages::MessageBatchErroredResult], [Symbol, Anthropic::Models::Messages::MessageBatchCanceledResult], [Symbol, Anthropic::Models::Messages::MessageBatchExpiredResult]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
