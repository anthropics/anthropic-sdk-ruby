# typed: strong

module Anthropic
  module Resources
    class Beta
      class MemoryStores
        class Memories
          # Create a Memory
          sig do
            params(
              memory_store_id: String,
              content: T.nilable(String),
              path: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory)
          end
          def create(
            # Path param: The ID of the memory store to create the memory in (`memstore_...`).
            memory_store_id,
            # Body param: The UTF-8 text content of the new memory. Pass `""` to create an
            # empty memory.
            #
            # The maximum size is 100 kB (102,400 bytes).
            content:,
            # Body param: The path of the new memory, such as `/projects/foo/notes.md`. Paths
            # are case-sensitive.
            #
            # A path starts with `/` and has 1 to 20 segments. A segment can't be empty and
            # can't be `.` or `..`. A path can't contain control characters, format
            # characters, or the line and paragraph separators U+2028 and U+2029. It must be
            # in Unicode Normalization Form C and at most 1,024 bytes long.
            path:,
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

          # Retrieve a Memory
          sig do
            params(
              memory_id: String,
              memory_store_id: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory)
          end
          def retrieve(
            # Path param: The ID of the memory to retrieve (`mem_...`).
            memory_id,
            # Path param: The ID of the memory store that holds the memory (`memstore_...`).
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

          # Update a Memory
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
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory)
          end
          def update(
            # Path param: The ID of the memory to update (`mem_...`).
            memory_id,
            # Path param: The ID of the memory store that holds the memory (`memstore_...`).
            memory_store_id:,
            # Query param: Whether a `memory` or `memory_version` in the response includes its
            # `content`. Defaults to `full` on retrieve operations and to `basic` on list,
            # create, and update operations.
            #
            # With `full`, list operations return at most 20 items per page.
            view: nil,
            # Body param: New UTF-8 text content for the memory. Maximum 100 kB (102,400
            # bytes). Omit to leave the content unchanged (e.g., for a rename-only update).
            content: nil,
            # Body param: The new path of the memory, which renames it. Omit it to keep the
            # current path.
            #
            # The memory keeps its `id`. A path starts with `/` and has 1 to 20 segments. A
            # segment can't be empty and can't be `.` or `..`. A path can't contain control
            # characters, format characters, or the line and paragraph separators U+2028 and
            # U+2029. It must be in Unicode Normalization Form C and at most 1,024 bytes long.
            # Paths are case-sensitive.
            path: nil,
            # Body param: The condition that the memory must meet for the update to apply.
            # Omit it to update unconditionally.
            #
            # If the condition fails, the request fails with HTTP status 409.
            precondition: nil,
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

          # List Memories
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
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem::Variants
              ]
            )
          end
          def list(
            # Path param: The ID of the memory store to list memories from (`memstore_...`).
            memory_store_id,
            # Query param: How far below `path_prefix` to list. Defaults to `0`, which lists
            # every memory below the prefix.
            #
            # Pass `1` to list only the direct children. Deeper memories are then grouped into
            # `memory_prefix` items.
            depth: nil,
            # Query param: The maximum number of items to return per page, from 1 to 100.
            # Defaults to 20.
            #
            # With `view=full`, a page holds at most 20 items. `memory` and `memory_prefix`
            # items both count toward the limit.
            limit: nil,
            # Query param: The `next_page` value from a previous response, to get the next
            # page. Omit it to get the first page.
            page: nil,
            # Query param: Return only memories whose path starts with this prefix, such as
            # `/notes/`. This value appears in request URLs. Do not include secrets or
            # personally identifiable information.
            #
            # Omit it to list the whole store. The prefix must end with `/` and matches whole
            # segments, so `/notes/` matches `/notes/todo.md` but not
            # `/notes-archive/todo.md`.
            path_prefix: nil,
            # Query param: Whether each memory in the response includes `content`. Defaults to
            # `basic`, which sets it to `null`.
            #
            # With `full`, a page holds at most 20 items.
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

          # Delete a Memory
          sig do
            params(
              memory_id: String,
              memory_store_id: String,
              expected_content_sha256: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory
            )
          end
          def delete(
            # Path param: The ID of the memory to delete (`mem_...`).
            memory_id,
            # Path param: The ID of the memory store that holds the memory (`memstore_...`).
            memory_store_id:,
            # Query param: Delete the memory only if its current `content_sha256` equals this
            # value, given as 64 lowercase hexadecimal characters. Omit it to delete
            # unconditionally.
            #
            # If the hashes differ, the request fails with HTTP status 409 and nothing is
            # deleted.
            expected_content_sha256: nil,
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
