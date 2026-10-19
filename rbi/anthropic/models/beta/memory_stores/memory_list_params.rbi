# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class MemoryListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::MemoryListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The ID of the memory store to list memories from (`memstore_...`).
          sig { returns(String) }
          attr_accessor :memory_store_id

          # How far below `path_prefix` to list. Defaults to `0`, which lists every memory
          # below the prefix.
          #
          # Pass `1` to list only the direct children. Deeper memories are then grouped into
          # `memory_prefix` items.
          sig { returns(T.nilable(Integer)) }
          attr_reader :depth

          sig { params(depth: Integer).void }
          attr_writer :depth

          # The maximum number of items to return per page, from 1 to 100. Defaults to 20.
          #
          # With `view=full`, a page holds at most 20 items. `memory` and `memory_prefix`
          # items both count toward the limit.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # The `next_page` value from a previous response, to get the next page. Omit it to
          # get the first page.
          sig { returns(T.nilable(String)) }
          attr_reader :page

          sig { params(page: String).void }
          attr_writer :page

          # Return only memories whose path starts with this prefix, such as `/notes/`. This
          # value appears in request URLs. Do not include secrets or personally identifiable
          # information.
          #
          # Omit it to list the whole store. The prefix must end with `/` and matches whole
          # segments, so `/notes/` matches `/notes/todo.md` but not
          # `/notes-archive/todo.md`.
          sig { returns(T.nilable(String)) }
          attr_reader :path_prefix

          sig { params(path_prefix: String).void }
          attr_writer :path_prefix

          # Whether each memory in the response includes `content`. Defaults to `basic`,
          # which sets it to `null`.
          #
          # With `full`, a page holds at most 20 items.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol
              )
            )
          end
          attr_reader :view

          sig do
            params(
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol
            ).void
          end
          attr_writer :view

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
            ).returns(T.attached_class)
          end
          def self.new(
            # The ID of the memory store to list memories from (`memstore_...`).
            memory_store_id:,
            # How far below `path_prefix` to list. Defaults to `0`, which lists every memory
            # below the prefix.
            #
            # Pass `1` to list only the direct children. Deeper memories are then grouped into
            # `memory_prefix` items.
            depth: nil,
            # The maximum number of items to return per page, from 1 to 100. Defaults to 20.
            #
            # With `view=full`, a page holds at most 20 items. `memory` and `memory_prefix`
            # items both count toward the limit.
            limit: nil,
            # The `next_page` value from a previous response, to get the next page. Omit it to
            # get the first page.
            page: nil,
            # Return only memories whose path starts with this prefix, such as `/notes/`. This
            # value appears in request URLs. Do not include secrets or personally identifiable
            # information.
            #
            # Omit it to list the whole store. The prefix must end with `/` and matches whole
            # segments, so `/notes/` matches `/notes/todo.md` but not
            # `/notes-archive/todo.md`.
            path_prefix: nil,
            # Whether each memory in the response includes `content`. Defaults to `basic`,
            # which sets it to `null`.
            #
            # With `full`, a page holds at most 20 items.
            view: nil,
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
                depth: Integer,
                limit: Integer,
                page: String,
                path_prefix: String,
                view:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
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
end
