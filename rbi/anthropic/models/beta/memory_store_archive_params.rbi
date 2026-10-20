# typed: strong

module Anthropic
  module Models
    module Beta
      class MemoryStoreArchiveParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::MemoryStoreArchiveParams,
              Anthropic::Internal::AnyHash
            )
          end

        # The ID of the memory store to archive (`memstore_...`).
        #
        # Archiving can't be undone. Archiving a store that is already archived returns it
        # unchanged.
        sig { returns(String) }
        attr_accessor :memory_store_id

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
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID of the memory store to archive (`memstore_...`).
          #
          # Archiving can't be undone. Archiving a store that is already archived returns it
          # unchanged.
          memory_store_id:,
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
