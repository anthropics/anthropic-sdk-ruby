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

        # Create a memory store
        sig do
          params(
            name: String,
            description: String,
            metadata: T::Hash[Symbol, String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsMemoryStore)
        end
        def create(
          # Body param: Human-readable name for the store. Required; 1–255 characters; no
          # control characters. The mount-path slug under `/mnt/memory/` is derived from
          # this name (lowercased, non-alphanumeric runs collapsed to a hyphen). Names need
          # not be unique within a workspace.
          name:,
          # Body param: Free-text description of what the store contains, up to 1024
          # characters. Included in the agent's system prompt when the store is attached, so
          # word it to be useful to the agent.
          description: nil,
          # Body param: Arbitrary key-value tags for your own bookkeeping (such as the end
          # user a store belongs to). Up to 16 pairs; keys 1–64 characters; values up to 512
          # characters. Not visible to the agent.
          metadata: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Retrieve a memory store
        sig do
          params(
            memory_store_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsMemoryStore)
        end
        def retrieve(
          # Path parameter memory_store_id
          memory_store_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Update a memory store
        sig do
          params(
            memory_store_id: String,
            description: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            name: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsMemoryStore)
        end
        def update(
          # Path param: Path parameter memory_store_id
          memory_store_id,
          # Body param: New description for the store, up to 1024 characters. Pass an empty
          # string to clear it.
          description: nil,
          # Body param: Metadata patch. Set a key to a string to upsert it, or to null to
          # delete it. Omit the field to preserve. The stored bag is limited to 16 keys (up
          # to 64 chars each) with values up to 512 chars.
          metadata: nil,
          # Body param: New human-readable name for the store. 1–255 characters; no control
          # characters. Renaming changes the slug used for the store's `mount_path` in
          # sessions created after the update.
          name: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # List memory stores
        sig do
          params(
            created_at_gte: Time,
            created_at_lte: Time,
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[
              Anthropic::Beta::BetaManagedAgentsMemoryStore
            ]
          )
        end
        def list(
          # Query param: Return only stores whose `created_at` is at or after this time
          # (inclusive). Sent on the wire as `created_at[gte]`.
          created_at_gte: nil,
          # Query param: Return only stores whose `created_at` is at or before this time
          # (inclusive). Sent on the wire as `created_at[lte]`.
          created_at_lte: nil,
          # Query param: When `true`, archived stores are included in the results. Defaults
          # to `false` (archived stores are excluded).
          include_archived: nil,
          # Query param: Maximum number of stores to return per page. Must be between 1
          # and 100. Defaults to 20 when omitted.
          limit: nil,
          # Query param: Opaque pagination cursor (a `page_...` value). Pass the `next_page`
          # value from a previous response to fetch the next page; omit for the first page.
          page: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Delete a memory store
        sig do
          params(
            memory_store_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore)
        end
        def delete(
          # Path parameter memory_store_id
          memory_store_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Archive a memory store
        sig do
          params(
            memory_store_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsMemoryStore)
        end
        def archive(
          # Path parameter memory_store_id
          memory_store_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
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
