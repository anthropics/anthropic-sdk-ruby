# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionUpdatedEvent =
      Beta::BetaManagedAgentsSessionUpdatedEvent

    module Beta
      class BetaManagedAgentsSessionUpdatedEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionUpdatedEvent,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for this event.
        sig { returns(String) }
        attr_accessor :id

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :processed_at

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSessionUpdatedEvent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Resolved `agent` definition for a `session`. Snapshot of the `agent` at
        # `session` creation time.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaManagedAgentsSessionAgent))
        end
        attr_reader :agent

        sig do
          params(
            agent:
              T.nilable(Anthropic::Beta::BetaManagedAgentsSessionAgent::OrHash)
          ).void
        end
        attr_writer :agent

        # The session's full metadata bag after the update. Present when the update set
        # non-empty metadata; absent when metadata was unchanged or cleared to empty.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # The session's new title. Present only when the update changed it.
        sig { returns(T.nilable(String)) }
        attr_accessor :title

        # Emitted when an UpdateSession request changed at least one field. Carries only
        # the fields that changed; absent fields were not part of the update. The new
        # configuration applies from the next turn.
        sig do
          params(
            id: String,
            processed_at: Time,
            type:
              Anthropic::Beta::BetaManagedAgentsSessionUpdatedEvent::Type::OrSymbol,
            agent:
              T.nilable(Anthropic::Beta::BetaManagedAgentsSessionAgent::OrHash),
            metadata: T::Hash[Symbol, String],
            title: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for this event.
          id:,
          # A timestamp in RFC 3339 format
          processed_at:,
          type:,
          # Resolved `agent` definition for a `session`. Snapshot of the `agent` at
          # `session` creation time.
          agent: nil,
          # The session's full metadata bag after the update. Present when the update set
          # non-empty metadata; absent when metadata was unchanged or cleared to empty.
          metadata: nil,
          # The session's new title. Present only when the update changed it.
          title: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              processed_at: Time,
              type:
                Anthropic::Beta::BetaManagedAgentsSessionUpdatedEvent::Type::TaggedSymbol,
              agent: T.nilable(Anthropic::Beta::BetaManagedAgentsSessionAgent),
              metadata: T::Hash[Symbol, String],
              title: T.nilable(String)
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
                Anthropic::Beta::BetaManagedAgentsSessionUpdatedEvent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SESSION_UPDATED =
            T.let(
              :"session.updated",
              Anthropic::Beta::BetaManagedAgentsSessionUpdatedEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionUpdatedEvent::Type::TaggedSymbol
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
