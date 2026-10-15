# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Agents#list
      class AgentListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute created_at_gte
        #   Return agents created at or after this time (inclusive).
        #
        #   @return [Time, nil]
        optional :created_at_gte, Time

        # @!attribute created_at_lte
        #   Return agents created at or before this time (inclusive).
        #
        #   @return [Time, nil]
        optional :created_at_lte, Time

        # @!attribute include_archived
        #   Include archived agents in results. Defaults to false.
        #
        #   @return [Boolean, nil]
        optional :include_archived, Anthropic::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum results per page. Default 20, maximum 100.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute page
        #   Opaque pagination cursor from a previous response.
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

        # @!method initialize(created_at_gte: nil, created_at_lte: nil, include_archived: nil, limit: nil, page: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::AgentListParams} for more details.
        #
        #   @param created_at_gte [Time] Return agents created at or after this time (inclusive).
        #
        #   @param created_at_lte [Time] Return agents created at or before this time (inclusive).
        #
        #   @param include_archived [Boolean] Include archived agents in results. Defaults to false.
        #
        #   @param limit [Integer] Maximum results per page. Default 20, maximum 100.
        #
        #   @param page [String] Opaque pagination cursor from a previous response.
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
