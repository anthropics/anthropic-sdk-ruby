# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class MemoryUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::MemoryUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The ID of the memory store that holds the memory (`memstore_...`).
          sig { returns(String) }
          attr_accessor :memory_store_id

          # The ID of the memory to update (`mem_...`).
          sig { returns(String) }
          attr_accessor :memory_id

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

          # New UTF-8 text content for the memory. Maximum 100 kB (102,400 bytes). Omit to
          # leave the content unchanged (e.g., for a rename-only update).
          sig { returns(T.nilable(String)) }
          attr_accessor :content

          # New path for the memory (a rename). Must start with `/`, contain at least one
          # non-empty segment, and be at most 1,024 bytes. Must not contain empty segments,
          # `.` or `..` segments, control or format characters, or the Unicode line and
          # paragraph separators (U+2028, U+2029), and must be NFC-normalized. Paths are
          # case-sensitive. The memory's `id` is preserved across renames. Omit to leave the
          # path unchanged.
          sig { returns(T.nilable(String)) }
          attr_accessor :path

          # Optional optimistic-concurrency precondition. When supplied, the update applies
          # only if the memory's current state matches; on mismatch the request returns
          # `memory_precondition_failed_error` (HTTP 409). When omitted, the update is
          # unconditional.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition
              )
            )
          end
          attr_reader :precondition

          sig do
            params(
              precondition:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition::OrHash
            ).void
          end
          attr_writer :precondition

          # Optional header to specify the beta version(s) you want to use.
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
              memory_id: String,
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
            ).returns(T.attached_class)
          end
          def self.new(
            # The ID of the memory store that holds the memory (`memstore_...`).
            memory_store_id:,
            # The ID of the memory to update (`mem_...`).
            memory_id:,
            # Selects which projection of a `memory` or `memory_version` the server returns.
            # `basic` returns the object with `content` set to `null`; `full` populates
            # `content`. When omitted, the default is endpoint-specific: retrieve operations
            # default to `full`; list, create, and update operations default to `basic`.
            # Listing with `view=full` caps `limit` at 20.
            view: nil,
            # New UTF-8 text content for the memory. Maximum 100 kB (102,400 bytes). Omit to
            # leave the content unchanged (e.g., for a rename-only update).
            content: nil,
            # New path for the memory (a rename). Must start with `/`, contain at least one
            # non-empty segment, and be at most 1,024 bytes. Must not contain empty segments,
            # `.` or `..` segments, control or format characters, or the Unicode line and
            # paragraph separators (U+2028, U+2029), and must be NFC-normalized. Paths are
            # case-sensitive. The memory's `id` is preserved across renames. Omit to leave the
            # path unchanged.
            path: nil,
            # Optional optimistic-concurrency precondition. When supplied, the update applies
            # only if the memory's current state matches; on mismatch the request returns
            # `memory_precondition_failed_error` (HTTP 409). When omitted, the update is
            # unconditional.
            precondition: nil,
            # Optional header to specify the beta version(s) you want to use.
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
                memory_id: String,
                view:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
                content: T.nilable(String),
                path: T.nilable(String),
                precondition:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition,
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
