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

        # The name of the memory store, 1 to 255 characters long, without control
        # characters. Names don't have to be unique in a workspace.
        #
        # In a session, the store's directory under `/mnt/memory/` is based on this name.
        # The name is lowercased and every run of characters other than ASCII letters and
        # digits becomes one hyphen. The session's memory store resource gives the exact
        # path in `mount_path`.
        #
        # See the
        # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#how-the-agent-accesses-memory)
        # to learn more about how agents access memory stores.
        sig { returns(String) }
        attr_accessor :name

        # Free-text description of what the store contains, up to 1,024 characters.
        # Included in the agent's system prompt when the store is attached, so word it to
        # be useful to the agent.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Key-value pairs for your own use, such as the end user that the store belongs
        # to. The agent doesn't see them.
        #
        # A store has at most 16 pairs. Keys are 1 to 64 characters long and values at
        # most 512 characters.
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
          # The name of the memory store, 1 to 255 characters long, without control
          # characters. Names don't have to be unique in a workspace.
          #
          # In a session, the store's directory under `/mnt/memory/` is based on this name.
          # The name is lowercased and every run of characters other than ASCII letters and
          # digits becomes one hyphen. The session's memory store resource gives the exact
          # path in `mount_path`.
          #
          # See the
          # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#how-the-agent-accesses-memory)
          # to learn more about how agents access memory stores.
          name:,
          # Free-text description of what the store contains, up to 1,024 characters.
          # Included in the agent's system prompt when the store is attached, so word it to
          # be useful to the agent.
          description: nil,
          # Key-value pairs for your own use, such as the end user that the store belongs
          # to. The agent doesn't see them.
          #
          # A store has at most 16 pairs. Keys are 1 to 64 characters long and values at
          # most 512 characters.
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
