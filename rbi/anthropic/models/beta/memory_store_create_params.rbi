# typed: strong

module Anthropic
  module Models
    module Beta
      class MemoryStoreCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::MemoryStoreCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable name for the store. Required; 1–255 characters; no control
        # characters. The mount-path slug under `/mnt/memory/` is derived from this name
        # (lowercased, non-alphanumeric runs collapsed to a hyphen). Names need not be
        # unique within a workspace.
        sig { returns(String) }
        attr_accessor :name

        # Free-text description of what the store contains, up to 1024 characters.
        # Included in the agent's system prompt when the store is attached, so word it to
        # be useful to the agent.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Arbitrary key-value tags for your own bookkeeping (such as the end user a store
        # belongs to). Up to 16 pairs; keys 1–64 characters; values up to 512 characters.
        # Not visible to the agent.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

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
            name: String,
            description: String,
            metadata: T::Hash[Symbol, String],
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable name for the store. Required; 1–255 characters; no control
          # characters. The mount-path slug under `/mnt/memory/` is derived from this name
          # (lowercased, non-alphanumeric runs collapsed to a hyphen). Names need not be
          # unique within a workspace.
          name:,
          # Free-text description of what the store contains, up to 1024 characters.
          # Included in the agent's system prompt when the store is attached, so word it to
          # be useful to the agent.
          description: nil,
          # Arbitrary key-value tags for your own bookkeeping (such as the end user a store
          # belongs to). Up to 16 pairs; keys 1–64 characters; values up to 512 characters.
          # Not visible to the agent.
          metadata: nil,
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
              name: String,
              description: String,
              metadata: T::Hash[Symbol, String],
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
