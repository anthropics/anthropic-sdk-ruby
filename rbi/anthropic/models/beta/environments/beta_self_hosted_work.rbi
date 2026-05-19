# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaSelfHostedWork < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::BetaSelfHostedWork,
                Anthropic::Internal::AnyHash
              )
            end

          # Work identifier (e.g., 'work\_...')
          sig { returns(String) }
          attr_accessor :id

          # RFC 3339 timestamp when the work item was acknowledged and assigned to a
          # self-hosted sandbox
          sig { returns(T.nilable(String)) }
          attr_accessor :acknowledged_at

          # RFC 3339 timestamp when work was created
          sig { returns(String) }
          attr_accessor :created_at

          # The actual work to be performed
          sig { returns(Anthropic::Beta::Environments::BetaSessionWorkData) }
          attr_reader :data

          sig do
            params(
              data: Anthropic::Beta::Environments::BetaSessionWorkData::OrHash
            ).void
          end
          attr_writer :data

          # Environment identifier this work belongs to (e.g., `env_...`)
          sig { returns(String) }
          attr_accessor :environment_id

          # RFC 3339 timestamp of the most recent heartbeat
          sig { returns(T.nilable(String)) }
          attr_accessor :latest_heartbeat_at

          # User-provided metadata key-value pairs associated with this work item
          sig { returns(T::Hash[Symbol, String]) }
          attr_accessor :metadata

          # RFC 3339 timestamp when work execution started
          sig { returns(T.nilable(String)) }
          attr_accessor :started_at

          # Current state of the work item
          sig do
            returns(
              Anthropic::Beta::Environments::BetaSelfHostedWork::State::TaggedSymbol
            )
          end
          attr_accessor :state

          # RFC 3339 timestamp when stop was requested
          sig { returns(T.nilable(String)) }
          attr_accessor :stop_requested_at

          # RFC 3339 timestamp when work execution stopped
          sig { returns(T.nilable(String)) }
          attr_accessor :stopped_at

          # The type of object (always 'work')
          sig { returns(Symbol) }
          attr_accessor :type

          # Work resource representing a unit of work in a self-hosted environment.
          #
          # Work items are queued when sessions are created or when long-dormant sessions
          # receive new messages. The environment worker polls for work to execute in a
          # self-hosted sandbox.
          sig do
            params(
              id: String,
              acknowledged_at: T.nilable(String),
              created_at: String,
              data: Anthropic::Beta::Environments::BetaSessionWorkData::OrHash,
              environment_id: String,
              latest_heartbeat_at: T.nilable(String),
              metadata: T::Hash[Symbol, String],
              started_at: T.nilable(String),
              state:
                Anthropic::Beta::Environments::BetaSelfHostedWork::State::OrSymbol,
              stop_requested_at: T.nilable(String),
              stopped_at: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Work identifier (e.g., 'work\_...')
            id:,
            # RFC 3339 timestamp when the work item was acknowledged and assigned to a
            # self-hosted sandbox
            acknowledged_at:,
            # RFC 3339 timestamp when work was created
            created_at:,
            # The actual work to be performed
            data:,
            # Environment identifier this work belongs to (e.g., `env_...`)
            environment_id:,
            # RFC 3339 timestamp of the most recent heartbeat
            latest_heartbeat_at:,
            # User-provided metadata key-value pairs associated with this work item
            metadata:,
            # RFC 3339 timestamp when work execution started
            started_at:,
            # Current state of the work item
            state:,
            # RFC 3339 timestamp when stop was requested
            stop_requested_at:,
            # RFC 3339 timestamp when work execution stopped
            stopped_at:,
            # The type of object (always 'work')
            type: :work
          )
          end

          sig do
            override.returns(
              {
                id: String,
                acknowledged_at: T.nilable(String),
                created_at: String,
                data: Anthropic::Beta::Environments::BetaSessionWorkData,
                environment_id: String,
                latest_heartbeat_at: T.nilable(String),
                metadata: T::Hash[Symbol, String],
                started_at: T.nilable(String),
                state:
                  Anthropic::Beta::Environments::BetaSelfHostedWork::State::TaggedSymbol,
                stop_requested_at: T.nilable(String),
                stopped_at: T.nilable(String),
                type: Symbol
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
                  Anthropic::Beta::Environments::BetaSelfHostedWork::State
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            QUEUED =
              T.let(
                :queued,
                Anthropic::Beta::Environments::BetaSelfHostedWork::State::TaggedSymbol
              )
            STARTING =
              T.let(
                :starting,
                Anthropic::Beta::Environments::BetaSelfHostedWork::State::TaggedSymbol
              )
            ACTIVE =
              T.let(
                :active,
                Anthropic::Beta::Environments::BetaSelfHostedWork::State::TaggedSymbol
              )
            STOPPING =
              T.let(
                :stopping,
                Anthropic::Beta::Environments::BetaSelfHostedWork::State::TaggedSymbol
              )
            STOPPED =
              T.let(
                :stopped,
                Anthropic::Beta::Environments::BetaSelfHostedWork::State::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Environments::BetaSelfHostedWork::State::TaggedSymbol
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
