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

          # `0` (or omitted) returns all descendants below `path_prefix` (recursive). `1`
          # returns immediate children only; deeper entries roll up as `memory_prefix`
          # items. `depth=1` behaves like `ls`; omitting `depth` behaves like `find`.
          sig { returns(T.nilable(Integer)) }
          attr_reader :depth

          sig { params(depth: Integer).void }
          attr_writer :depth

          # Maximum number of items to return per page. Must be between 1 and 100. Defaults
          # to 20 when omitted. Capped at 20 when `view=full`. Both `memory` and
          # `memory_prefix` items count toward the limit.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque pagination cursor (a `page_...` value). Pass the `next_page` value from a
          # previous response to fetch the next page; omit for the first page.
          sig { returns(T.nilable(String)) }
          attr_reader :page

          sig { params(page: String).void }
          attr_writer :page

          # Optional path prefix filter. Must end with `/` (segment-aligned), e.g.,
          # `/notes/`. This value appears in request URLs. Do not include secrets or
          # personally identifiable information.
          sig { returns(T.nilable(String)) }
          attr_reader :path_prefix

          sig { params(path_prefix: String).void }
          attr_writer :path_prefix

          # Which projection of each `memory` to return. Defaults to `basic` (content
          # omitted). `full` populates `content` on each item and caps `limit` at 20; use
          # this as the bulk-read path for export and sync.
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
            # `0` (or omitted) returns all descendants below `path_prefix` (recursive). `1`
            # returns immediate children only; deeper entries roll up as `memory_prefix`
            # items. `depth=1` behaves like `ls`; omitting `depth` behaves like `find`.
            depth: nil,
            # Maximum number of items to return per page. Must be between 1 and 100. Defaults
            # to 20 when omitted. Capped at 20 when `view=full`. Both `memory` and
            # `memory_prefix` items count toward the limit.
            limit: nil,
            # Opaque pagination cursor (a `page_...` value). Pass the `next_page` value from a
            # previous response to fetch the next page; omit for the first page.
            page: nil,
            # Optional path prefix filter. Must end with `/` (segment-aligned), e.g.,
            # `/notes/`. This value appears in request URLs. Do not include secrets or
            # personally identifiable information.
            path_prefix: nil,
            # Which projection of each `memory` to return. Defaults to `basic` (content
            # omitted). `full` populates `content` on each item and caps `limit` at 20; use
            # this as the bulk-read path for export and sync.
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
