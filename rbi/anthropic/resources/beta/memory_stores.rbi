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

        # CreateMemoryStore
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
          # Body param
          name:,
          # Body param
          description: nil,
          # Body param
          metadata: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # GetMemoryStore
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

        # UpdateMemoryStore
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
          # Body param
          description: nil,
          # Body param: Metadata patch. Set a key to a string to upsert it, or to null to
          # delete it. Omit the field to preserve. The stored bag is limited to 16 keys (up
          # to 64 chars each) with values up to 512 chars.
          metadata: nil,
          # Body param
          name: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # ListMemoryStores
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
          # Query param: Return stores created at or after this time (inclusive).
          created_at_gte: nil,
          # Query param: Return stores created at or before this time (inclusive).
          created_at_lte: nil,
          # Query param: Query parameter for include_archived
          include_archived: nil,
          # Query param: Query parameter for limit
          limit: nil,
          # Query param: Query parameter for page
          page: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # DeleteMemoryStore
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

        # ArchiveMemoryStore
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
