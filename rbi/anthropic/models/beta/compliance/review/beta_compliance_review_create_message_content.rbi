# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewCreateMessageContent < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCreateMessageContent,
                  Anthropic::Internal::AnyHash
                )
              end

            # The `POST /v1/messages` request body, without thinking blocks or unpublished
            # fields. For a user's message from an Anthropic app, such as Claude Code,
            # `system` is a placeholder.
            sig { returns(T::Hash[Symbol, T.anything]) }
            attr_accessor :request

            # The model's `Message`, without thinking blocks or unpublished fields. Null when
            # no response was stored, for example because the client disconnected.
            sig { returns(T.nilable(Anthropic::Beta::BetaMessage)) }
            attr_reader :response

            sig do
              params(
                response: T.nilable(Anthropic::Beta::BetaMessage::OrHash)
              ).void
            end
            attr_writer :response

            sig { returns(Symbol) }
            attr_accessor :type

            # A request to create a message, and its response.
            sig do
              params(
                request: T::Hash[Symbol, T.anything],
                response: T.nilable(Anthropic::Beta::BetaMessage::OrHash),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The `POST /v1/messages` request body, without thinking blocks or unpublished
              # fields. For a user's message from an Anthropic app, such as Claude Code,
              # `system` is a placeholder.
              request:,
              # The model's `Message`, without thinking blocks or unpublished fields. Null when
              # no response was stored, for example because the client disconnected.
              response:,
              type: :create_message
            )
            end

            sig do
              override.returns(
                {
                  request: T::Hash[Symbol, T.anything],
                  response: T.nilable(Anthropic::Beta::BetaMessage),
                  type: Symbol
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
end
