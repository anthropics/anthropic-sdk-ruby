# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchIndividualResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Messages::BetaMessageBatchIndividualResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # Developer-provided ID created for each request in a Message Batch. Useful for
          # matching results to requests, as results may be given out of request order.
          #
          # Must be unique for each request within the Message Batch.
          sig { returns(String) }
          attr_accessor :custom_id

          # Processing result for this request.
          #
          # Contains a Message output if processing was successful, an error response if
          # processing failed, or the reason why processing was not attempted, such as
          # cancellation or expiration.
          sig do
            returns(Anthropic::Beta::Messages::BetaMessageBatchResult::Variants)
          end
          attr_accessor :result

          # This is a single line in the response `.jsonl` file and does not represent the
          # response as a whole.
          sig do
            params(
              custom_id: String,
              result:
                T.any(
                  Anthropic::Beta::Messages::BetaMessageBatchSucceededResult::OrHash,
                  Anthropic::Beta::Messages::BetaMessageBatchErroredResult::OrHash,
                  Anthropic::Beta::Messages::BetaMessageBatchCanceledResult::OrHash,
                  Anthropic::Beta::Messages::BetaMessageBatchExpiredResult::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Developer-provided ID created for each request in a Message Batch. Useful for
            # matching results to requests, as results may be given out of request order.
            #
            # Must be unique for each request within the Message Batch.
            custom_id:,
            # Processing result for this request.
            #
            # Contains a Message output if processing was successful, an error response if
            # processing failed, or the reason why processing was not attempted, such as
            # cancellation or expiration.
            result:
          )
          end

          sig do
            override.returns(
              {
                custom_id: String,
                result:
                  Anthropic::Beta::Messages::BetaMessageBatchResult::Variants
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
