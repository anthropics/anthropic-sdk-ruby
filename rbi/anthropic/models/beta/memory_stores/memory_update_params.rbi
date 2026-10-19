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

          # Whether a `memory` or `memory_version` in the response includes its `content`.
          # Defaults to `full` on retrieve operations and to `basic` on list, create, and
          # update operations.
          #
          # With `full`, list operations return at most 20 items per page.
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

          # The new path of the memory, which renames it. Omit it to keep the current path.
          #
          # The memory keeps its `id`. A path starts with `/` and has 1 to 20 segments. A
          # segment can't be empty and can't be `.` or `..`. A path can't contain control
          # characters, format characters, or the line and paragraph separators U+2028 and
          # U+2029. It must be in Unicode Normalization Form C and at most 1,024 bytes long.
          # Paths are case-sensitive.
          sig { returns(T.nilable(String)) }
          attr_accessor :path

          # The condition that the memory must meet for the update to apply. Omit it to
          # update unconditionally.
          #
          # If the condition fails, the request fails with HTTP status 409.
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
            # Whether a `memory` or `memory_version` in the response includes its `content`.
            # Defaults to `full` on retrieve operations and to `basic` on list, create, and
            # update operations.
            #
            # With `full`, list operations return at most 20 items per page.
            view: nil,
            # New UTF-8 text content for the memory. Maximum 100 kB (102,400 bytes). Omit to
            # leave the content unchanged (e.g., for a rename-only update).
            content: nil,
            # The new path of the memory, which renames it. Omit it to keep the current path.
            #
            # The memory keeps its `id`. A path starts with `/` and has 1 to 20 segments. A
            # segment can't be empty and can't be `.` or `..`. A path can't contain control
            # characters, format characters, or the line and paragraph separators U+2028 and
            # U+2029. It must be in Unicode Normalization Form C and at most 1,024 bytes long.
            # Paths are case-sensitive.
            path: nil,
            # The condition that the memory must meet for the update to apply. Omit it to
            # update unconditionally.
            #
            # If the condition fails, the request fails with HTTP status 409.
            precondition: nil,
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
