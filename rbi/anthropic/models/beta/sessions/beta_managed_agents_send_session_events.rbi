# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSendSessionEvents < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents,
                Anthropic::Internal::AnyHash
              )
            end

          # Sent events
          sig do
            returns(
              T.nilable(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Variants
                ]
              )
            )
          end
          attr_reader :data

          sig do
            params(
              data:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::OrHash
                  )
                ]
            ).void
          end
          attr_writer :data

          # Events that were successfully sent to the session.
          sig do
            params(
              data:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::OrHash
                  )
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Sent events
            data: nil
          )
          end

          sig do
            override.returns(
              {
                data:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Variants
                  ]
              }
            )
          end
          def to_hash
          end

          # Union type for events that can be sent to a session.
          module Data
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data::Variants
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
end
