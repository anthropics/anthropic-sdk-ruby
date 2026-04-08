# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class EventSendParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::EventSendParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :session_id

          # Events to send to the `session`.
          sig do
            returns(
              T::Array[
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams
                )
              ]
            )
          end
          attr_accessor :events

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
              events:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams::OrHash
                  )
                ],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            session_id:,
            # Events to send to the `session`.
            events:,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                session_id: String,
                events:
                  T::Array[
                    T.any(
                      Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                      Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams,
                      Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams,
                      Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams
                    )
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
