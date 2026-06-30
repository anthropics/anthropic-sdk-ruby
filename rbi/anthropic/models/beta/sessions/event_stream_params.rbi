# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class EventStreamParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::EventStreamParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :session_id

          # When set, this connection also receives streaming deltas (`event_start`,
          # `event_delta`) while an event is being produced, before the event itself
          # arrives. Deltas are best-effort; when the final event is produced it carries the
          # complete content. A model request that ends early (an error or interrupt)
          # produces no final event — its terminal `span.model_request_end` closes the
          # preview. Accepts one or more event types to preview and may be repeated:
          # `agent.message` streams `content_delta` fragments; `agent.thinking` is
          # start-only — a signal that the agent has begun extended thinking, concluded by
          # the `agent.thinking` event itself. Only previews of the requested event types
          # are sent.
          sig do
            returns(
              T.nilable(
                T::Array[Anthropic::Beta::BetaManagedAgentsDeltaType::OrSymbol]
              )
            )
          end
          attr_reader :event_deltas

          sig do
            params(
              event_deltas:
                T::Array[Anthropic::Beta::BetaManagedAgentsDeltaType::OrSymbol]
            ).void
          end
          attr_writer :event_deltas

          # Optional header to specify the beta version(s) you want to use.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              session_id: String,
              event_deltas:
                T::Array[Anthropic::Beta::BetaManagedAgentsDeltaType::OrSymbol],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            session_id:,
            # When set, this connection also receives streaming deltas (`event_start`,
            # `event_delta`) while an event is being produced, before the event itself
            # arrives. Deltas are best-effort; when the final event is produced it carries the
            # complete content. A model request that ends early (an error or interrupt)
            # produces no final event — its terminal `span.model_request_end` closes the
            # preview. Accepts one or more event types to preview and may be repeated:
            # `agent.message` streams `content_delta` fragments; `agent.thinking` is
            # start-only — a signal that the agent has begun extended thinking, concluded by
            # the `agent.thinking` event itself. Only previews of the requested event types
            # are sent.
            event_deltas: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                session_id: String,
                event_deltas:
                  T::Array[
                    Anthropic::Beta::BetaManagedAgentsDeltaType::OrSymbol
                  ],
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions
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
