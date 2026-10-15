# typed: strong

module Anthropic
  module Models
    module Beta
      class MemoryStoreUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::MemoryStoreUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the memory store to update (a `memstore_...` identifier). Required.
        # Enumerate IDs via `GET /v1/memory_stores`. Updating an archived store
        # returns 400.
        sig { returns(String) }
        attr_accessor :memory_store_id

        # New description for the store, up to 1024 characters. Pass an empty string to
        # clear it.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        # Omit the field to preserve. The stored bag is limited to 16 keys (up to 64 chars
        # each) with values up to 512 chars.
        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_accessor :metadata

        # New human-readable name for the store. 1–255 characters; no control characters.
        # Renaming changes the slug used for the store's `mount_path` in sessions created
        # after the update.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # This endpoint is in beta: requests must send `agent-memory-2026-07-22` or
        # `managed-agents-2026-04-01` in this header.
        sig do
          returns(
            T.nilable(
              T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            )
          )
        end
        attr_reader :betas

        sig do
          params(
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
          ).void
        end
        attr_writer :betas

        # Optional header to select the Workspace for this request. The value is a
        # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
        #
        # Only needed for credentials that can act on more than one Workspace. A
        # credential that belongs to a specific Workspace may omit it; if sent, it must
        # match that Workspace.
        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig do
          params(
            memory_store_id: String,
            description: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            name: T.nilable(String),
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the memory store to update (a `memstore_...` identifier). Required.
          # Enumerate IDs via `GET /v1/memory_stores`. Updating an archived store
          # returns 400.
          memory_store_id:,
          # New description for the store, up to 1024 characters. Pass an empty string to
          # clear it.
          description: nil,
          # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
          # Omit the field to preserve. The stored bag is limited to 16 keys (up to 64 chars
          # each) with values up to 512 chars.
          metadata: nil,
          # New human-readable name for the store. 1–255 characters; no control characters.
          # Renaming changes the slug used for the store's `mount_path` in sessions created
          # after the update.
          name: nil,
          # This endpoint is in beta: requests must send `agent-memory-2026-07-22` or
          # `managed-agents-2026-04-01` in this header.
          betas: nil,
          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              memory_store_id: String,
              description: T.nilable(String),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              name: T.nilable(String),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
