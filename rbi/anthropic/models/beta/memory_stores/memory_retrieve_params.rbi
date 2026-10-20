# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class MemoryRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::MemoryRetrieveParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The ID of the memory store that holds the memory (`memstore_...`).
          sig { returns(String) }
          attr_accessor :memory_store_id

          # The ID of the memory to retrieve (`mem_...`).
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
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The ID of the memory store that holds the memory (`memstore_...`).
            memory_store_id:,
            # The ID of the memory to retrieve (`mem_...`).
            memory_id:,
            # Whether a `memory` or `memory_version` in the response includes its `content`.
            # Defaults to `full` on retrieve operations and to `basic` on list, create, and
            # update operations.
            #
            # With `full`, list operations return at most 20 items per page.
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
                memory_id: String,
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
