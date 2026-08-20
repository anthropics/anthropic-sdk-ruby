# typed: strong

module Anthropic
  module Models
    MessageBatchResult = Messages::MessageBatchResult

    module Messages
      # Processing result for this request.
      #
      # Contains a Message output if processing was successful, an error response if
      # processing failed, or the reason why processing was not attempted, such as
      # cancellation or expiration.
      module MessageBatchResult
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Messages::MessageBatchSucceededResult,
              Anthropic::Messages::MessageBatchErroredResult,
              Anthropic::Messages::MessageBatchCanceledResult,
              Anthropic::Messages::MessageBatchExpiredResult
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Messages::MessageBatchResult::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SUCCEEDED =
            T.let(
              :succeeded,
              Anthropic::Messages::MessageBatchResult::Type::TaggedSymbol
            )
          ERRORED =
            T.let(
              :errored,
              Anthropic::Messages::MessageBatchResult::Type::TaggedSymbol
            )
          CANCELED =
            T.let(
              :canceled,
              Anthropic::Messages::MessageBatchResult::Type::TaggedSymbol
            )
          EXPIRED =
            T.let(
              :expired,
              Anthropic::Messages::MessageBatchResult::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Messages::MessageBatchResult::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Messages::MessageBatchResult::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            message: Anthropic::Message::OrHash,
            error: Anthropic::ErrorResponse::OrHash
          ).returns(Anthropic::Messages::MessageBatchResult::Variants)
        end
        def self.new(type:, message: nil, error: nil)
        end
      end
    end
  end
end
