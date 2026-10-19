# typed: strong

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        sig { returns(Anthropic::Resources::Beta::MemoryStores::Memories) }
        attr_reader :memories

        sig do
          returns(Anthropic::Resources::Beta::MemoryStores::MemoryVersions)
        end
        attr_reader :memory_versions

        # Create a Memory Store
        sig do
          params(
            name: String,
            description: String,
            metadata: T::Hash[Symbol, String],
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsMemoryStore)
        end
        def create(
          # Body param: The name of the memory store, 1 to 255 characters long, without
          # control characters. Names don't have to be unique in a workspace.
          #
          # In a session, the store's directory under `/mnt/memory/` is based on this name.
          # The name is lowercased and every run of characters other than ASCII letters and
          # digits becomes one hyphen. The session's memory store resource gives the exact
          # path in `mount_path`.
          #
          # See the
          # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#how-the-agent-accesses-memory)
          # to learn more about how agents access memory stores.
          name:,
          # Body param: Free-text description of what the store contains, up to 1,024
          # characters. Included in the agent's system prompt when the store is attached, so
          # word it to be useful to the agent.
          description: nil,
          # Body param: Key-value pairs for your own use, such as the end user that the
          # store belongs to. The agent doesn't see them.
          #
          # A store has at most 16 pairs. Keys are 1 to 64 characters long and values at
          # most 512 characters.
          metadata: nil,
          # Header param: This endpoint is in beta: requests must send
          # `agent-memory-2026-07-22` or `managed-agents-2026-04-01` in this header.
          betas: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Retrieve a Memory Store
        sig do
          params(
            memory_store_id: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsMemoryStore)
        end
        def retrieve(
          # The ID of the memory store to retrieve (`memstore_...`).
          memory_store_id,
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

        # Update a Memory Store
        sig do
          params(
            memory_store_id: String,
            description: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            name: T.nilable(String),
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsMemoryStore)
        end
        def update(
          # Path param: The ID of the memory store to update (`memstore_...`).
          #
          # The request fails with HTTP status 400 if the store is archived.
          memory_store_id,
          # Body param: New description for the store, up to 1,024 characters. Pass an empty
          # string to clear it.
          description: nil,
          # Body param: Changes to apply to the memory store's metadata. Keys you leave out
          # keep their values.
          #
          # Set a key to a string to add or replace it, or to `null` to remove it. After the
          # change, the metadata can hold at most 16 key-value pairs. Keys are 1 to 64
          # characters long and values at most 512 characters.
          metadata: nil,
          # Body param: The new name of the memory store, 1 to 255 characters long, without
          # control characters.
          #
          # Sessions created after the change use the new name for the store's directory
          # under `/mnt/memory/`.
          name: nil,
          # Header param: This endpoint is in beta: requests must send
          # `agent-memory-2026-07-22` or `managed-agents-2026-04-01` in this header.
          betas: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # List Memory Stores
        sig do
          params(
            created_at_gte: Time,
            created_at_lte: Time,
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[
              Anthropic::Beta::BetaManagedAgentsMemoryStore
            ]
          )
        end
        def list(
          # Query param: Return only memory stores created at or after this time
          # (inclusive).
          created_at_gte: nil,
          # Query param: Return only memory stores created at or before this time
          # (inclusive).
          created_at_lte: nil,
          # Query param: When `true`, archived stores are included in the results. Defaults
          # to `false` (archived stores are excluded).
          include_archived: nil,
          # Query param: Maximum number of stores to return per page. Must be between 1
          # and 100. Defaults to 20 when omitted.
          limit: nil,
          # Query param: The `next_page` value from a previous response, to get the next
          # page. Omit it to get the first page.
          page: nil,
          # Header param: This endpoint is in beta: requests must send
          # `agent-memory-2026-07-22` or `managed-agents-2026-04-01` in this header.
          betas: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Delete a Memory Store
        sig do
          params(
            memory_store_id: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore)
        end
        def delete(
          # The ID of the memory store to delete (`memstore_...`).
          #
          # Deleting a store also deletes all its memories and memory versions. It can't be
          # undone.
          memory_store_id,
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

        # Archive a Memory Store
        sig do
          params(
            memory_store_id: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsMemoryStore)
        end
        def archive(
          # The ID of the memory store to archive (`memstore_...`).
          #
          # Archiving can't be undone. Archiving a store that is already archived returns it
          # unchanged.
          memory_store_id,
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

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
