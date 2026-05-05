# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserInterruptEventParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # If absent, interrupts every non-archived thread in a multiagent session (or the
          # primary alone in a single-agent session). If present, interrupts only the named
          # thread.
          sig { returns(T.nilable(String)) }
          attr_accessor :session_thread_id

          # Parameters for sending an interrupt to pause the agent.
          sig do
            params(
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type::OrSymbol,
              session_thread_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            type:,
            # If absent, interrupts every non-archived thread in a multiagent session (or the
            # primary alone in a single-agent session). If present, interrupts only the named
            # thread.
            session_thread_id: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type::OrSymbol,
                session_thread_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_INTERRUPT =
              T.let(
                :"user.interrupt",
                Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
