# typed: strong

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        class MemoryVersions
          # Retrieve a memory version
          sig do
            params(
              memory_version_id: String,
              memory_store_id: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion
            )
          end
          def retrieve(
            # Path param: Path parameter memory_version_id
            memory_version_id,
            # Path param: Path parameter memory_store_id
            memory_store_id:,
            # Query param: Query parameter for view
            view: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # List memory versions
          sig do
            params(
              memory_store_id: String,
              api_key_id: String,
              created_at_gte: Time,
              created_at_lte: Time,
              limit: Integer,
              memory_id: String,
              operation:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol,
              page: String,
              session_id: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion
              ]
            )
          end
          def list(
            # Path param: Path parameter memory_store_id
            memory_store_id,
            # Query param: Query parameter for api_key_id
            api_key_id: nil,
            # Query param: Return versions created at or after this time (inclusive).
            created_at_gte: nil,
            # Query param: Return versions created at or before this time (inclusive).
            created_at_lte: nil,
            # Query param: Query parameter for limit
            limit: nil,
            # Query param: Query parameter for memory_id
            memory_id: nil,
            # Query param: Query parameter for operation
            operation: nil,
            # Query param: Query parameter for page
            page: nil,
            # Query param: Query parameter for session_id
            session_id: nil,
            # Query param: Query parameter for view
            view: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Redact a memory version
          sig do
            params(
              memory_version_id: String,
              memory_store_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion
            )
          end
          def redact(
            # Path param: Path parameter memory_version_id
            memory_version_id,
            # Path param: Path parameter memory_store_id
            memory_store_id:,
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
