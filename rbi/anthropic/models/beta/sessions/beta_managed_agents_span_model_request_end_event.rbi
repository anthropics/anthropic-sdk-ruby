# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSpanModelRequestEndEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Whether the model request resulted in an error.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :is_error

          # The id of the corresponding `span.model_request_start` event.
          sig { returns(String) }
          attr_accessor :model_request_start_id

          # Token usage for this model request.
          sig do
            returns(Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage)
          end
          attr_reader :model_usage

          sig do
            params(
              model_usage:
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage::OrHash
            ).void
          end
          attr_writer :model_usage

          # Timestamp when the model request completed.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig { returns(Symbol) }
          attr_accessor :type

          # Emitted when a model request completes.
          sig do
            params(
              id: String,
              is_error: T.nilable(T::Boolean),
              model_request_start_id: String,
              model_usage:
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage::OrHash,
              processed_at: Time,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Whether the model request resulted in an error.
            is_error:,
            # The id of the corresponding `span.model_request_start` event.
            model_request_start_id:,
            # Token usage for this model request.
            model_usage:,
            # Timestamp when the model request completed.
            processed_at:,
            type: :"span.model_request_end"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                is_error: T.nilable(T::Boolean),
                model_request_start_id: String,
                model_usage:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage,
                processed_at: Time,
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
