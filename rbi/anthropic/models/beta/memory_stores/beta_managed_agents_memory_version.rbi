# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemoryVersion < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this version (a `memver_...` value).
          sig { returns(String) }
          attr_accessor :id

          # When this version was written, in RFC 3339 format.
          sig { returns(Time) }
          attr_accessor :created_at

          # The ID of the memory that this version belongs to (`mem_...`).
          #
          # The ID stays valid after the memory is deleted. Pass it as `memory_id` to
          # [List Memory Versions](https://platform.claude.com/docs/en/api/beta/memory_stores/memory_versions/list)
          # to get the memory's retained versions, including its `deleted` version while the
          # lineage is retained.
          sig { returns(String) }
          attr_accessor :memory_id

          # ID of the memory store this version belongs to (a `memstore_...` value).
          sig { returns(String) }
          attr_accessor :memory_store_id

          # The kind of mutation this version records: `created`, `modified`, or `deleted`.
          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::TaggedSymbol
            )
          end
          attr_accessor :operation

          sig { returns(Symbol) }
          attr_accessor :type

          # The memory's UTF-8 text content as of this version. `null` when `view=basic`,
          # when `operation` is `deleted`, or when `redacted_at` is set.
          sig { returns(T.nilable(String)) }
          attr_accessor :content

          # Lowercase hex SHA-256 digest of `content` as of this version (64 characters).
          # `null` when `redacted_at` is set or `operation` is `deleted`. Populated
          # regardless of `view` otherwise.
          sig { returns(T.nilable(String)) }
          attr_accessor :content_sha256

          # Size of `content` in bytes as of this version. `null` when `redacted_at` is set
          # or `operation` is `deleted`. Populated regardless of `view` otherwise.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :content_size_bytes

          # Who made this change to the memory, or `null` if the author wasn't recorded.
          #
          # Redacting the version doesn't change this field. A `session_actor` here is an
          # agent that wrote through the store's mounted filesystem at `/mnt/memory/`. The
          # version doesn't record the API key that created that session. So the author in
          # `created_by` is who made the change, not who is ultimately responsible for it.
          #
          # You can
          # [retrieve the session](https://platform.claude.com/docs/en/api/beta/sessions/retrieve)
          # to learn more about where the change came from.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Variants
              )
            )
          end
          attr_reader :created_by

          sig do
            params(
              created_by:
                T.any(
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsServiceAccountActor::OrHash
                )
            ).void
          end
          attr_writer :created_by

          # The memory's path at the time of this write. `null` if and only if `redacted_at`
          # is set.
          sig { returns(T.nilable(String)) }
          attr_accessor :path

          # When the version was redacted, in RFC 3339, or `null` if it hasn't been.
          #
          # When set, `content`, `path`, `content_size_bytes`, and `content_sha256` are
          # `null`.
          #
          # See the
          # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#redact-a-version)
          # to learn more about redaction.
          sig { returns(T.nilable(Time)) }
          attr_accessor :redacted_at

          # Who redacted this version, or `null` if it has not been redacted. In practice
          # always an `api_actor`, `user_actor`, or `service_account_actor` (agents do not
          # have a redact capability).
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Variants
              )
            )
          end
          attr_reader :redacted_by

          sig do
            params(
              redacted_by:
                T.any(
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsServiceAccountActor::OrHash
                )
            ).void
          end
          attr_writer :redacted_by

          # One entry in a memory's history, recording a single change and who made it.
          #
          # Every change to a memory adds one version. Only redaction can change a version
          # after that. Versions belong to the memory store and stay after the memory is
          # deleted. Each version is retained for at least the version retention period
          # after it was written, unless the store itself is deleted.
          #
          # Retrieving a redacted version succeeds, with `content`, `path`,
          # `content_size_bytes`, and `content_sha256` set to `null`. Check `redacted_at` to
          # find out whether a version was redacted.
          #
          # See the
          # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#audit-memory-changes)
          # to learn more about memory versions.
          sig do
            params(
              id: String,
              created_at: Time,
              memory_id: String,
              memory_store_id: String,
              operation:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol,
              content: T.nilable(String),
              content_sha256: T.nilable(String),
              content_size_bytes: T.nilable(Integer),
              created_by:
                T.any(
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsServiceAccountActor::OrHash
                ),
              path: T.nilable(String),
              redacted_at: T.nilable(Time),
              redacted_by:
                T.any(
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsServiceAccountActor::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this version (a `memver_...` value).
            id:,
            # When this version was written, in RFC 3339 format.
            created_at:,
            # The ID of the memory that this version belongs to (`mem_...`).
            #
            # The ID stays valid after the memory is deleted. Pass it as `memory_id` to
            # [List Memory Versions](https://platform.claude.com/docs/en/api/beta/memory_stores/memory_versions/list)
            # to get the memory's retained versions, including its `deleted` version while the
            # lineage is retained.
            memory_id:,
            # ID of the memory store this version belongs to (a `memstore_...` value).
            memory_store_id:,
            # The kind of mutation this version records: `created`, `modified`, or `deleted`.
            operation:,
            # The memory's UTF-8 text content as of this version. `null` when `view=basic`,
            # when `operation` is `deleted`, or when `redacted_at` is set.
            content: nil,
            # Lowercase hex SHA-256 digest of `content` as of this version (64 characters).
            # `null` when `redacted_at` is set or `operation` is `deleted`. Populated
            # regardless of `view` otherwise.
            content_sha256: nil,
            # Size of `content` in bytes as of this version. `null` when `redacted_at` is set
            # or `operation` is `deleted`. Populated regardless of `view` otherwise.
            content_size_bytes: nil,
            # Who made this change to the memory, or `null` if the author wasn't recorded.
            #
            # Redacting the version doesn't change this field. A `session_actor` here is an
            # agent that wrote through the store's mounted filesystem at `/mnt/memory/`. The
            # version doesn't record the API key that created that session. So the author in
            # `created_by` is who made the change, not who is ultimately responsible for it.
            #
            # You can
            # [retrieve the session](https://platform.claude.com/docs/en/api/beta/sessions/retrieve)
            # to learn more about where the change came from.
            created_by: nil,
            # The memory's path at the time of this write. `null` if and only if `redacted_at`
            # is set.
            path: nil,
            # When the version was redacted, in RFC 3339, or `null` if it hasn't been.
            #
            # When set, `content`, `path`, `content_size_bytes`, and `content_sha256` are
            # `null`.
            #
            # See the
            # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#redact-a-version)
            # to learn more about redaction.
            redacted_at: nil,
            # Who redacted this version, or `null` if it has not been redacted. In practice
            # always an `api_actor`, `user_actor`, or `service_account_actor` (agents do not
            # have a redact capability).
            redacted_by: nil,
            type: :memory_version
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                memory_id: String,
                memory_store_id: String,
                operation:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::TaggedSymbol,
                type: Symbol,
                content: T.nilable(String),
                content_sha256: T.nilable(String),
                content_size_bytes: T.nilable(Integer),
                created_by:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Variants,
                path: T.nilable(String),
                redacted_at: T.nilable(Time),
                redacted_by:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Variants
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
