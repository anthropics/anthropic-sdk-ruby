# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaWorkLeaseState < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::BetaWorkLeaseState,
                Anthropic::Internal::AnyHash
              )
            end

          # RFC 3339 timestamp of the stored heartbeat, or null if there has been none
          sig { returns(T.nilable(String)) }
          attr_accessor :last_heartbeat

          # Always false: a refused heartbeat does not extend the lease
          sig { returns(T::Boolean) }
          attr_accessor :lease_extended

          # Current state of the work item
          sig do
            returns(
              Anthropic::Beta::Environments::BetaWorkLeaseState::State::TaggedSymbol
            )
          end
          attr_accessor :state

          # TTL of the lease
          sig { returns(Integer) }
          attr_accessor :ttl_seconds

          # A work item's lease as the server holds it.
          sig do
            params(
              last_heartbeat: T.nilable(String),
              lease_extended: T::Boolean,
              state:
                Anthropic::Beta::Environments::BetaWorkLeaseState::State::OrSymbol,
              ttl_seconds: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # RFC 3339 timestamp of the stored heartbeat, or null if there has been none
            last_heartbeat:,
            # Always false: a refused heartbeat does not extend the lease
            lease_extended:,
            # Current state of the work item
            state:,
            # TTL of the lease
            ttl_seconds:
          )
          end

          sig do
            override.returns(
              {
                last_heartbeat: T.nilable(String),
                lease_extended: T::Boolean,
                state:
                  Anthropic::Beta::Environments::BetaWorkLeaseState::State::TaggedSymbol,
                ttl_seconds: Integer
              }
            )
          end
          def to_hash
          end

          # Current state of the work item
          module State
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Environments::BetaWorkLeaseState::State
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            QUEUED =
              T.let(
                :queued,
                Anthropic::Beta::Environments::BetaWorkLeaseState::State::TaggedSymbol
              )
            STARTING =
              T.let(
                :starting,
                Anthropic::Beta::Environments::BetaWorkLeaseState::State::TaggedSymbol
              )
            ACTIVE =
              T.let(
                :active,
                Anthropic::Beta::Environments::BetaWorkLeaseState::State::TaggedSymbol
              )
            STOPPING =
              T.let(
                :stopping,
                Anthropic::Beta::Environments::BetaWorkLeaseState::State::TaggedSymbol
              )
            STOPPED =
              T.let(
                :stopped,
                Anthropic::Beta::Environments::BetaWorkLeaseState::State::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Environments::BetaWorkLeaseState::State::TaggedSymbol
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
