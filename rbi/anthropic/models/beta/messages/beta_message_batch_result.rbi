# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        # Processing result for this request.
        #
        # Contains a Message output if processing was successful, an error response if
        # processing failed, or the reason why processing was not attempted, such as
        # cancellation or expiration.
        module BetaMessageBatchResult
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Messages::BetaMessageBatchSucceededResult,
                Anthropic::Beta::Messages::BetaMessageBatchErroredResult,
                Anthropic::Beta::Messages::BetaMessageBatchCanceledResult,
                Anthropic::Beta::Messages::BetaMessageBatchExpiredResult
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Messages::BetaMessageBatchResult::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
