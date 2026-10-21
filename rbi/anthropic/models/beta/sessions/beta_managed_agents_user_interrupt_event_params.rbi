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

          sig { returns(Symbol) }
          attr_accessor :type

          # If absent, interrupts every non-archived thread in a multiagent session (or the
          # primary alone in a single-agent session). If present, interrupts only the named
          # thread.
          sig { returns(T.nilable(String)) }
          attr_accessor :session_thread_id

          # Parameters for sending an interrupt to pause the agent.
          sig do
            params(session_thread_id: T.nilable(String), type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # If absent, interrupts every non-archived thread in a multiagent session (or the
            # primary alone in a single-agent session). If present, interrupts only the named
            # thread.
            session_thread_id: nil,
            type: :"user.interrupt"
          )
          end

          sig do
            override.returns(
              { type: Symbol, session_thread_id: T.nilable(String) }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
