# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionRequiresAction < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction,
                Anthropic::Internal::AnyHash
              )
            end

          # The ids of events the agent is blocked on. Resolving fewer than all re-emits
          # `session.status_idle` with the remainder.
          sig { returns(T::Array[String]) }
          attr_accessor :event_ids

          sig { returns(Symbol) }
          attr_accessor :type

          # The agent is idle waiting on one or more blocking user-input events (tool
          # confirmation, custom tool result, etc.). Resolving all of them transitions the
          # session back to running.
          sig do
            params(event_ids: T::Array[String], type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The ids of events the agent is blocked on. Resolving fewer than all re-emits
            # `session.status_idle` with the remainder.
            event_ids:,
            type: :requires_action
          )
          end

          sig do
            override.returns({ event_ids: T::Array[String], type: Symbol })
          end
          def to_hash
          end
        end
      end
    end
  end
end
