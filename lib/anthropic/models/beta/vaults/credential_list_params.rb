# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # @see Anthropic::Resources::Beta::Vaults::Credentials#list
        class CredentialListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute vault_id
          #   Identifier of the vault to list credentials for.
          #
          #   @return [String]
          required :vault_id, String

          # @!attribute include_archived
          #   Whether to include archived credentials in the results.
          #
          #   @return [Boolean, nil]
          optional :include_archived, Anthropic::Internal::Type::Boolean

          # @!attribute limit
          #   Maximum number of credentials to return per page. Defaults to 20, maximum 100.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute page
          #   Opaque pagination token from a previous `list_credentials` response.
          #
          #   @return [String, nil]
          optional :page, String

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

          # @!method initialize(vault_id:, include_archived: nil, limit: nil, page: nil, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::CredentialListParams} for more details.
          #
          #   @param vault_id [String] Identifier of the vault to list credentials for.
          #
          #   @param include_archived [Boolean] Whether to include archived credentials in the results.
          #
          #   @param limit [Integer] Maximum number of credentials to return per page. Defaults to 20, maximum 100.
          #
          #   @param page [String] Opaque pagination token from a previous `list_credentials` response.
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
