# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class MemoryCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::MemoryCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The ID of the memory store to create the memory in (`memstore_...`).
          sig { returns(String) }
          attr_accessor :memory_store_id

          # UTF-8 text content for the new memory. Maximum 100 kB (102,400 bytes). Required;
          # pass `""` explicitly to create an empty memory.
          sig { returns(T.nilable(String)) }
          attr_accessor :content

          # Hierarchical path for the new memory, e.g. `/projects/foo/notes.md`. Must start
          # with `/`, contain at least one non-empty segment, and be at most 1,024 bytes.
          # Must not contain empty segments, `.` or `..` segments, control or format
          # characters, or the Unicode line and paragraph separators (U+2028, U+2029), and
          # must be NFC-normalized. Paths are case-sensitive.
          sig { returns(String) }
          attr_accessor :path

          # Selects which projection of a `memory` or `memory_version` the server returns.
          # `basic` returns the object with `content` set to `null`; `full` populates
          # `content`. When omitted, the default is endpoint-specific: retrieve operations
          # default to `full`; list, create, and update operations default to `basic`.
          # Listing with `view=full` caps `limit` at 20.
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
              content: T.nilable(String),
              path: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The ID of the memory store to create the memory in (`memstore_...`).
            memory_store_id:,
            # UTF-8 text content for the new memory. Maximum 100 kB (102,400 bytes). Required;
            # pass `""` explicitly to create an empty memory.
            content:,
            # Hierarchical path for the new memory, e.g. `/projects/foo/notes.md`. Must start
            # with `/`, contain at least one non-empty segment, and be at most 1,024 bytes.
            # Must not contain empty segments, `.` or `..` segments, control or format
            # characters, or the Unicode line and paragraph separators (U+2028, U+2029), and
            # must be NFC-normalized. Paths are case-sensitive.
            path:,
            # Selects which projection of a `memory` or `memory_version` the server returns.
            # `basic` returns the object with `content` set to `null`; `full` populates
            # `content`. When omitted, the default is endpoint-specific: retrieve operations
            # default to `full`; list, create, and update operations default to `basic`.
            # Listing with `view=full` caps `limit` at 20.
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
                content: T.nilable(String),
                path: String,
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
