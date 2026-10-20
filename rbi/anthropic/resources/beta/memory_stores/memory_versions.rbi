# typed: strong

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        class MemoryVersions
          # Retrieve a Memory Version
          sig do
            params(
              memory_version_id: String,
              memory_store_id: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion
            )
          end
          def retrieve(
            # Path param: The ID of the memory version to retrieve (`memver_...`).
            memory_version_id,
            # Path param: The ID of the memory store that holds the version (`memstore_...`).
            memory_store_id:,
            # Query param: Whether a `memory` or `memory_version` in the response includes its
            # `content`. Defaults to `full` on retrieve operations and to `basic` on list,
            # create, and update operations.
            #
            # With `full`, list operations return at most 20 items per page.
            view: nil,
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

          # List Memory Versions
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
              service_account_id: String,
              session_id: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion
              ]
            )
          end
          def list(
            # Path param: The ID of the memory store whose version history to list
            # (`memstore_...`).
            memory_store_id,
            # Query param: Return only versions written with the API key that has this ID.
            api_key_id: nil,
            # Query param: Return versions created at or after this time (inclusive).
            created_at_gte: nil,
            # Query param: Return versions created at or before this time (inclusive).
            created_at_lte: nil,
            # Query param: The maximum number of versions to return per page, from 1 to 100.
            # Defaults to 20.
            #
            # With `view=full`, a page holds at most 20 versions.
            limit: nil,
            # Query param: Return only versions of the memory with this ID (`mem_...`).
            #
            # The filter still works after the memory is deleted. While that memory's versions
            # are retained, the results include the version whose `operation` is `deleted`.
            memory_id: nil,
            # Query param: Return only versions that record this kind of change.
            operation: nil,
            # Query param: The `next_page` value from a previous response, to get the next
            # page. Omit it to get the first page.
            page: nil,
            # Query param: Return only versions written by the service account with this ID
            # (`svac_...`).
            service_account_id: nil,
            # Query param: Return only versions written by the session with this ID.
            session_id: nil,
            # Query param: Whether a `memory` or `memory_version` in the response includes its
            # `content`. Defaults to `full` on retrieve operations and to `basic` on list,
            # create, and update operations.
            #
            # With `full`, list operations return at most 20 items per page.
            view: nil,
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

          # Redact a Memory Version
          sig do
            params(
              memory_version_id: String,
              memory_store_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion
            )
          end
          def redact(
            # Path param: The ID of the memory version to redact (`memver_...`).
            memory_version_id,
            # Path param: The ID of the memory store that holds the version (`memstore_...`).
            memory_store_id:,
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

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
