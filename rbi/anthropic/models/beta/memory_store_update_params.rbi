# typed: strong

module Anthropic
  module Models
    module Beta
      class MemoryStoreUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::MemoryStoreUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # The ID of the memory store to update (`memstore_...`).
        #
        # The request fails with HTTP status 400 if the store is archived.
        sig { returns(String) }
        attr_accessor :memory_store_id

        # New description for the store, up to 1,024 characters. Pass an empty string to
        # clear it.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # Changes to apply to the memory store's metadata. Keys you leave out keep their
        # values.
        #
        # Set a key to a string to add or replace it, or to `null` to remove it. After the
        # change, the metadata can hold at most 16 key-value pairs. Keys are 1 to 64
        # characters long and values at most 512 characters.
        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_accessor :metadata

        # The new name of the memory store, 1 to 255 characters long, without control
        # characters.
        #
        # Sessions created after the change use the new name for the store's directory
        # under `/mnt/memory/`.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

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
            description: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            name: T.nilable(String),
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The ID of the memory store to update (`memstore_...`).
          #
          # The request fails with HTTP status 400 if the store is archived.
          memory_store_id:,
          # New description for the store, up to 1,024 characters. Pass an empty string to
          # clear it.
          description: nil,
          # Changes to apply to the memory store's metadata. Keys you leave out keep their
          # values.
          #
          # Set a key to a string to add or replace it, or to `null` to remove it. After the
          # change, the metadata can hold at most 16 key-value pairs. Keys are 1 to 64
          # characters long and values at most 512 characters.
          metadata: nil,
          # The new name of the memory store, 1 to 255 characters long, without control
          # characters.
          #
          # Sessions created after the change use the new name for the store's directory
          # under `/mnt/memory/`.
          name: nil,
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
              description: T.nilable(String),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              name: T.nilable(String),
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
