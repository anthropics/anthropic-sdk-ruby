# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaSelfHostedWorkHeartbeatResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # RFC 3339 timestamp of the actual heartbeat from DB
          sig { returns(String) }
          attr_accessor :last_heartbeat

          # Whether the heartbeat succeeded in extending the lease
          sig { returns(T::Boolean) }
          attr_accessor :lease_extended

          # Current state of the work item (active/stopping/stopped)
          sig do
            returns(
              Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State::TaggedSymbol
            )
          end
          attr_accessor :state

          # Effective TTL applied to the lease
          sig { returns(Integer) }
          attr_accessor :ttl_seconds

          # The type of response
          sig { returns(Symbol) }
          attr_accessor :type

          # Response after recording a heartbeat for a work item.
          sig do
            params(
              last_heartbeat: String,
              lease_extended: T::Boolean,
              state:
                Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State::OrSymbol,
              ttl_seconds: Integer,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # RFC 3339 timestamp of the actual heartbeat from DB
            last_heartbeat:,
            # Whether the heartbeat succeeded in extending the lease
            lease_extended:,
            # Current state of the work item (active/stopping/stopped)
            state:,
            # Effective TTL applied to the lease
            ttl_seconds:,
            # The type of response
            type: :work_heartbeat
          )
          end

          sig do
            override.returns(
              {
                last_heartbeat: String,
                lease_extended: T::Boolean,
                state:
                  Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State::TaggedSymbol,
                ttl_seconds: Integer,
                type: Symbol
              }
            )
          end
          def to_hash
          end

          # Current state of the work item (active/stopping/stopped)
          module State
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            QUEUED =
              T.let(
                :queued,
                Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State::TaggedSymbol
              )
            STARTING =
              T.let(
                :starting,
                Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State::TaggedSymbol
              )
            ACTIVE =
              T.let(
                :active,
                Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State::TaggedSymbol
              )
            STOPPING =
              T.let(
                :stopping,
                Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State::TaggedSymbol
              )
            STOPPED =
              T.let(
                :stopped,
                Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State::TaggedSymbol
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
