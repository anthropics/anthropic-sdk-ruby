# typed: strong

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        class Memories
          # CreateMemory
          sig do
            params(
              memory_store_id: String,
              content: T.nilable(String),
              path: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory)
          end
          def create(
            # Path param: Path parameter memory_store_id
            memory_store_id,
            # Body param
            content:,
            # Body param
            path:,
            # Query param: Query parameter for view
            view: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # GetMemory
          sig do
            params(
              memory_id: String,
              memory_store_id: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory)
          end
          def retrieve(
            # Path param: Path parameter memory_id
            memory_id,
            # Path param: Path parameter memory_store_id
            memory_store_id:,
            # Query param: Query parameter for view
            view: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # UpdateMemory
          sig do
            params(
              memory_id: String,
              memory_store_id: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              content: T.nilable(String),
              path: T.nilable(String),
              precondition:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition::OrHash,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory)
          end
          def update(
            # Path param: Path parameter memory_id
            memory_id,
            # Path param: Path parameter memory_store_id
            memory_store_id:,
            # Query param: Query parameter for view
            view: nil,
            # Body param
            content: nil,
            # Body param
            path: nil,
            # Body param
            precondition: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # ListMemories
          sig do
            params(
              memory_store_id: String,
              depth: Integer,
              limit: Integer,
              order:
                Anthropic::Beta::MemoryStores::MemoryListParams::Order::OrSymbol,
              order_by: String,
              page: String,
              path_prefix: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem::Variants
              ]
            )
          end
          def list(
            # Path param: Path parameter memory_store_id
            memory_store_id,
            # Query param: Query parameter for depth
            depth: nil,
            # Query param: Query parameter for limit
            limit: nil,
            # Query param: Query parameter for order
            order: nil,
            # Query param: Query parameter for order_by
            order_by: nil,
            # Query param: Query parameter for page
            page: nil,
            # Query param: Optional path prefix filter (raw string-prefix match; include a
            # trailing slash for directory-scoped lists). This value appears in request URLs.
            # Do not include secrets or personally identifiable information.
            path_prefix: nil,
            # Query param: Query parameter for view
            view: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # DeleteMemory
          sig do
            params(
              memory_id: String,
              memory_store_id: String,
              expected_content_sha256: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory
            )
          end
          def delete(
            # Path param: Path parameter memory_id
            memory_id,
            # Path param: Path parameter memory_store_id
            memory_store_id:,
            # Query param: Query parameter for expected_content_sha256
            expected_content_sha256: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
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
end
