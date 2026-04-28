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

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :created_at

          # ID of the memory this version snapshots (a `mem_...` value). Remains valid after
          # the memory is deleted; pass it as `memory_id` to
          # [List memory versions](/en/api/beta/memory_stores/memory_versions/list) to
          # retrieve the full lineage including the `deleted` row.
          sig { returns(String) }
          attr_accessor :memory_id

          # ID of the memory store this version belongs to (a `memstore_...` value).
          sig { returns(String) }
          attr_accessor :memory_store_id

          # The kind of mutation a `memory_version` records. Every non-no-op mutation to a
          # memory appends exactly one version row with one of these values.
          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::TaggedSymbol
            )
          end
          attr_accessor :operation

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type::TaggedSymbol
            )
          end
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

          # Identifies who performed a write or redact operation. Captured at write time on
          # the `memory_version` row. The API key that created a session is not recorded on
          # agent writes; attribution answers who made the write, not who is ultimately
          # responsible. Look up session provenance separately via the
          # [Sessions API](/en/api/sessions-retrieve).
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
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash
                )
            ).void
          end
          attr_writer :created_by

          # The memory's path at the time of this write. `null` if and only if `redacted_at`
          # is set.
          sig { returns(T.nilable(String)) }
          attr_accessor :path

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :redacted_at

          # Identifies who performed a write or redact operation. Captured at write time on
          # the `memory_version` row. The API key that created a session is not recorded on
          # agent writes; attribution answers who made the write, not who is ultimately
          # responsible. Look up session provenance separately via the
          # [Sessions API](/en/api/sessions-retrieve).
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
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash
                )
            ).void
          end
          attr_writer :redacted_by

          # A `memory_version` object: one immutable, attributed row in a memory's
          # append-only history. Every non-no-op mutation to a memory produces a new
          # version. Versions belong to the store (not the individual memory) and persist
          # after the memory is deleted. Retrieving a redacted version returns 200 with
          # `content`, `path`, `content_size_bytes`, and `content_sha256` set to `null`;
          # branch on `redacted_at`, not HTTP status.
          sig do
            params(
              id: String,
              created_at: Time,
              memory_id: String,
              memory_store_id: String,
              operation:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol,
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type::OrSymbol,
              content: T.nilable(String),
              content_sha256: T.nilable(String),
              content_size_bytes: T.nilable(Integer),
              created_by:
                T.any(
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash
                ),
              path: T.nilable(String),
              redacted_at: T.nilable(Time),
              redacted_by:
                T.any(
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::OrHash,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this version (a `memver_...` value).
            id:,
            # A timestamp in RFC 3339 format
            created_at:,
            # ID of the memory this version snapshots (a `mem_...` value). Remains valid after
            # the memory is deleted; pass it as `memory_id` to
            # [List memory versions](/en/api/beta/memory_stores/memory_versions/list) to
            # retrieve the full lineage including the `deleted` row.
            memory_id:,
            # ID of the memory store this version belongs to (a `memstore_...` value).
            memory_store_id:,
            # The kind of mutation a `memory_version` records. Every non-no-op mutation to a
            # memory appends exactly one version row with one of these values.
            operation:,
            type:,
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
            # Identifies who performed a write or redact operation. Captured at write time on
            # the `memory_version` row. The API key that created a session is not recorded on
            # agent writes; attribution answers who made the write, not who is ultimately
            # responsible. Look up session provenance separately via the
            # [Sessions API](/en/api/sessions-retrieve).
            created_by: nil,
            # The memory's path at the time of this write. `null` if and only if `redacted_at`
            # is set.
            path: nil,
            # A timestamp in RFC 3339 format
            redacted_at: nil,
            # Identifies who performed a write or redact operation. Captured at write time on
            # the `memory_version` row. The API key that created a session is not recorded on
            # agent writes; attribution answers who made the write, not who is ultimately
            # responsible. Look up session provenance separately via the
            # [Sessions API](/en/api/sessions-retrieve).
            redacted_by: nil
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
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type::TaggedSymbol,
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

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMORY_VERSION =
              T.let(
                :memory_version,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type::TaggedSymbol
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
