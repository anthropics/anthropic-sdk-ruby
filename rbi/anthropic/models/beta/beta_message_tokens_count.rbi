# typed: strong

module Anthropic
  module Models
    BetaMessageTokensCount = Beta::BetaMessageTokensCount

    module Beta
      class BetaMessageTokensCount < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMessageTokensCount,
              Anthropic::Internal::AnyHash
            )
          end

        # Information about context management applied to the message.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaCountTokensContextManagementResponse)
          )
        end
        attr_reader :context_management

        sig do
          params(
            context_management:
              T.nilable(
                Anthropic::Beta::BetaCountTokensContextManagementResponse::OrHash
              )
          ).void
        end
        attr_writer :context_management

        # The total number of tokens across the provided list of messages, system prompt,
        # and tools.
        sig { returns(Integer) }
        attr_accessor :input_tokens

        sig do
          params(
            context_management:
              T.nilable(
                Anthropic::Beta::BetaCountTokensContextManagementResponse::OrHash
              ),
            input_tokens: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Information about context management applied to the message.
          context_management:,
          # The total number of tokens across the provided list of messages, system prompt,
          # and tools.
          input_tokens:
        )
        end

        sig do
          override.returns(
            {
              context_management:
                T.nilable(
                  Anthropic::Beta::BetaCountTokensContextManagementResponse
                ),
              input_tokens: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
