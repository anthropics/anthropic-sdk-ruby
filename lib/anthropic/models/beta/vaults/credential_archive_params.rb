# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # @see Anthropic::Resources::Beta::Vaults::Credentials#archive
        class CredentialArchiveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute vault_id
          #   Identifier of the vault containing the credential.
          #
          #   @return [String]
          required :vault_id, String

          # @!attribute credential_id
          #   Unique identifier of the credential to archive.
          #
          #   @return [String]
          required :credential_id, String

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

          # @!method initialize(vault_id:, credential_id:, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::CredentialArchiveParams} for more details.
          #
          #   @param vault_id [String] Identifier of the vault containing the credential.
          #
          #   @param credential_id [String] Unique identifier of the credential to archive.
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
end
