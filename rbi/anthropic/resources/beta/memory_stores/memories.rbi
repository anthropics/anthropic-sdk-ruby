# typed: strong

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        class Memories
          # Create a memory
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
            # Body param: UTF-8 text content for the new memory. Maximum 100 kB (102,400
            # bytes). Required; pass `""` explicitly to create an empty memory.
            content:,
            # Body param: Hierarchical path for the new memory, e.g. `/projects/foo/notes.md`.
            # Must start with `/`, contain at least one non-empty segment, and be at most
            # 1,024 bytes. Must not contain empty segments, `.` or `..` segments, control or
            # format characters, and must be NFC-normalized. Paths are case-sensitive.
            path:,
            # Query param: Query parameter for view
            view: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Retrieve a memory
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

          # Update a memory
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
            # Body param: New UTF-8 text content for the memory. Maximum 100 kB (102,400
            # bytes). Omit to leave the content unchanged (e.g., for a rename-only update).
            content: nil,
            # Body param: New path for the memory (a rename). Must start with `/`, contain at
            # least one non-empty segment, and be at most 1,024 bytes. Must not contain empty
            # segments, `.` or `..` segments, control or format characters, and must be
            # NFC-normalized. Paths are case-sensitive. The memory's `id` is preserved across
            # renames. Omit to leave the path unchanged.
            path: nil,
            # Body param: Optimistic-concurrency precondition: the update applies only if the
            # memory's stored `content_sha256` equals the supplied value. On mismatch, the
            # request returns `memory_precondition_failed_error` (HTTP 409); re-read the
            # memory and retry against the fresh state. If the precondition fails but the
            # stored state already exactly matches the requested `content` and `path`, the
            # server returns 200 instead of 409.
            precondition: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # List memories
          sig do
            params(
              memory_store_id: String,
              depth: Integer,
              limit: Integer,
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
            # Query param: `0` (or omitted) returns all descendants below `path_prefix`
            # (recursive). `1` returns immediate children only; deeper entries roll up as
            # `memory_prefix` items. `depth=1` behaves like `ls`; omitting `depth` behaves
            # like `find`.
            depth: nil,
            # Query param: Maximum number of items to return per page. Must be between 1
            # and 100. Defaults to 20 when omitted. Capped at 20 when `view=full`. Both
            # `memory` and `memory_prefix` items count toward the limit.
            limit: nil,
            # Query param: Opaque pagination cursor (a `page_...` value). Pass the `next_page`
            # value from a previous response to fetch the next page; omit for the first page.
            page: nil,
            # Query param: Optional path prefix filter. Must end with `/` (segment-aligned),
            # e.g., `/notes/`. This value appears in request URLs. Do not include secrets or
            # personally identifiable information.
            path_prefix: nil,
            # Query param: Which projection of each `memory` to return. Defaults to `basic`
            # (content omitted). `full` populates `content` on each item and caps `limit` at
            # 20; use this as the bulk-read path for export and sync.
            view: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Delete a memory
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
