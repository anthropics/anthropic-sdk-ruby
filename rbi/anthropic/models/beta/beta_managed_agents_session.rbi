# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSession = Beta::BetaManagedAgentsSession

    module Beta
      class BetaManagedAgentsSession < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSession,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Resolved `agent` definition for a `session`. Snapshot of the `agent` at
        # `session` creation time.
        sig { returns(Anthropic::Beta::BetaManagedAgentsSessionAgent) }
        attr_reader :agent

        sig do
          params(
            agent: Anthropic::Beta::BetaManagedAgentsSessionAgent::OrHash
          ).void
        end
        attr_writer :agent

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :environment_id

        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :metadata

        sig do
          returns(
            T::Array[
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource::Variants
            ]
          )
        end
        attr_accessor :resources

        # Timing statistics for a session.
        sig { returns(Anthropic::Beta::BetaManagedAgentsSessionStats) }
        attr_reader :stats

        sig do
          params(
            stats: Anthropic::Beta::BetaManagedAgentsSessionStats::OrHash
          ).void
        end
        attr_writer :stats

        # SessionStatus enum
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSession::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig { returns(T.nilable(String)) }
        attr_accessor :title

        sig do
          returns(Anthropic::Beta::BetaManagedAgentsSession::Type::TaggedSymbol)
        end
        attr_accessor :type

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :updated_at

        # Cumulative token usage for a session across all turns.
        sig { returns(Anthropic::Beta::BetaManagedAgentsSessionUsage) }
        attr_reader :usage

        sig do
          params(
            usage: Anthropic::Beta::BetaManagedAgentsSessionUsage::OrHash
          ).void
        end
        attr_writer :usage

        # Vault IDs attached to the session at creation. Empty when no vaults were
        # supplied.
        sig { returns(T::Array[String]) }
        attr_accessor :vault_ids

        # A Managed Agents `session`.
        sig do
          params(
            id: String,
            agent: Anthropic::Beta::BetaManagedAgentsSessionAgent::OrHash,
            archived_at: T.nilable(Time),
            created_at: Time,
            environment_id: String,
            metadata: T::Hash[Symbol, String],
            resources:
              T::Array[
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileResource::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::OrHash
                )
              ],
            stats: Anthropic::Beta::BetaManagedAgentsSessionStats::OrHash,
            status: Anthropic::Beta::BetaManagedAgentsSession::Status::OrSymbol,
            title: T.nilable(String),
            type: Anthropic::Beta::BetaManagedAgentsSession::Type::OrSymbol,
            updated_at: Time,
            usage: Anthropic::Beta::BetaManagedAgentsSessionUsage::OrHash,
            vault_ids: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Resolved `agent` definition for a `session`. Snapshot of the `agent` at
          # `session` creation time.
          agent:,
          # A timestamp in RFC 3339 format
          archived_at:,
          # A timestamp in RFC 3339 format
          created_at:,
          environment_id:,
          metadata:,
          resources:,
          # Timing statistics for a session.
          stats:,
          # SessionStatus enum
          status:,
          title:,
          type:,
          # A timestamp in RFC 3339 format
          updated_at:,
          # Cumulative token usage for a session across all turns.
          usage:,
          # Vault IDs attached to the session at creation. Empty when no vaults were
          # supplied.
          vault_ids:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              agent: Anthropic::Beta::BetaManagedAgentsSessionAgent,
              archived_at: T.nilable(Time),
              created_at: Time,
              environment_id: String,
              metadata: T::Hash[Symbol, String],
              resources:
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource::Variants
                ],
              stats: Anthropic::Beta::BetaManagedAgentsSessionStats,
              status:
                Anthropic::Beta::BetaManagedAgentsSession::Status::TaggedSymbol,
              title: T.nilable(String),
              type:
                Anthropic::Beta::BetaManagedAgentsSession::Type::TaggedSymbol,
              updated_at: Time,
              usage: Anthropic::Beta::BetaManagedAgentsSessionUsage,
              vault_ids: T::Array[String]
            }
          )
        end
        def to_hash
        end

        # SessionStatus enum
        module Status
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsSession::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RESCHEDULING =
            T.let(
              :rescheduling,
              Anthropic::Beta::BetaManagedAgentsSession::Status::TaggedSymbol
            )
          RUNNING =
            T.let(
              :running,
              Anthropic::Beta::BetaManagedAgentsSession::Status::TaggedSymbol
            )
          IDLE =
            T.let(
              :idle,
              Anthropic::Beta::BetaManagedAgentsSession::Status::TaggedSymbol
            )
          TERMINATED =
            T.let(
              :terminated,
              Anthropic::Beta::BetaManagedAgentsSession::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSession::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsSession::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SESSION =
            T.let(
              :session,
              Anthropic::Beta::BetaManagedAgentsSession::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSession::Type::TaggedSymbol
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
