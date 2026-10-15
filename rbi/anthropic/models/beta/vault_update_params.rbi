# typed: strong

module Anthropic
  module Models
    module Beta
      class VaultUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::VaultUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier of the vault to update.
        sig { returns(String) }
        attr_accessor :vault_id

        # Updated human-readable name for the vault. 1-255 characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :display_name

        # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        # Omitted keys are preserved.
        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_accessor :metadata

        # This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
        # header.
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
            vault_id: String,
            display_name: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier of the vault to update.
          vault_id:,
          # Updated human-readable name for the vault. 1-255 characters.
          display_name: nil,
          # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
          # Omitted keys are preserved.
          metadata: nil,
          # This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
          # header.
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
              vault_id: String,
              display_name: T.nilable(String),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
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
