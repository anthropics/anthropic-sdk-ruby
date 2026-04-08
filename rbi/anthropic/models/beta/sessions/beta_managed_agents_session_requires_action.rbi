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

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The agent is idle waiting on one or more blocking user-input events (tool
          # confirmation, custom tool result, etc.). Resolving all of them transitions the
          # session back to running.
          sig do
            params(
              event_ids: T::Array[String],
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The ids of events the agent is blocked on. Resolving fewer than all re-emits
            # `session.status_idle` with the remainder.
            event_ids:,
            type:
          )
          end

          sig do
            override.returns(
              {
                event_ids: T::Array[String],
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            REQUIRES_ACTION =
              T.let(
                :requires_action,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction::Type::TaggedSymbol
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
