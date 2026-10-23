# typed: strong

module Anthropic
  module Models
    BetaMessageThreadParam = Beta::BetaMessageThreadParam

    module Beta
      # Server-held conversation state (a Thread). `{"type": "create"}` asks the server
      # to hold this conversation's state under the response's `id`;
      # `{"type": "continue", "previous_message_id": ...}` resumes from a previous
      # response so only the new turn's messages are sent. The response shape is
      # unchanged.
      module BetaMessageThreadParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThreadCreateParams,
              Anthropic::Beta::BetaThreadContinueParams
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaMessageThreadParam::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CREATE =
            T.let(
              :create,
              Anthropic::Beta::BetaMessageThreadParam::Type::TaggedSymbol
            )
          CONTINUE =
            T.let(
              :continue,
              Anthropic::Beta::BetaMessageThreadParam::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaMessageThreadParam::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaMessageThreadParam::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Beta::BetaMessageThreadParam::Type::OrSymbol,
            previous_message_id: String
          ).returns(Anthropic::Beta::BetaMessageThreadParam::Variants)
        end
        def self.new(
          type:,
          # The `id` of the previous response in this Thread.
          previous_message_id: nil
        )
        end
      end
    end
  end
end
