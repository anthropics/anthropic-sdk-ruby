# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Vaults#update
      class VaultUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute vault_id
        #   Unique identifier of the vault to update.
        #
        #   @return [String]
        required :vault_id, String

        # @!attribute display_name
        #   Updated human-readable name for the vault. 1-255 characters.
        #
        #   @return [String, nil]
        optional :display_name, String, nil?: true

        # @!attribute metadata
        #   Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        #   Omitted keys are preserved.
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

        # @!attribute betas
        #   This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
        #   header.
        #
        #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!attribute workspace_id
        #   Optional header to select the Workspace for this request. The value is a
        #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
        #
        #   Only needed for credentials that can act on more than one Workspace. A
        #   credential that belongs to a specific Workspace may omit it; if sent, it must
        #   match that Workspace.
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!method initialize(vault_id:, display_name: nil, metadata: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::VaultUpdateParams} for more details.
        #
        #   @param vault_id [String] Unique identifier of the vault to update.
        #
        #   @param display_name [String, nil] Updated human-readable name for the vault. 1-255 characters.
        #
        #   @param metadata [Hash{Symbol=>String, nil}, nil] Metadata patch. Set a key to a string to upsert it, or to null to delete it. Omi
        #
        #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
        #
        #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
