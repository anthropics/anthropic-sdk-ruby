# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Deployments#list
      class DeploymentListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute agent_id
        #   Filter by agent ID.
        #
        #   @return [String, nil]
        optional :agent_id, String

        # @!attribute created_at_gte
        #   Return deployments created at or after this time (inclusive).
        #
        #   @return [Time, nil]
        optional :created_at_gte, Time

        # @!attribute created_at_lte
        #   Return deployments created at or before this time (inclusive).
        #
        #   @return [Time, nil]
        optional :created_at_lte, Time

        # @!attribute include_archived
        #   When true, includes archived deployments. Default: false (exclude archived).
        #
        #   @return [Boolean, nil]
        optional :include_archived, Anthropic::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum results per page. Default 20, maximum 100.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute page
        #   Opaque pagination cursor.
        #
        #   @return [String, nil]
        optional :page, String

        # @!attribute status
        #   Filter by status: `active` or `paused`. Omit for both. To include archived
        #   deployments, use `include_archived` instead; the two cannot be combined.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentStatus, nil]
        optional :status, enum: -> { Anthropic::Beta::BetaManagedAgentsDeploymentStatus }

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

        # @!method initialize(agent_id: nil, created_at_gte: nil, created_at_lte: nil, include_archived: nil, limit: nil, page: nil, status: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::DeploymentListParams} for more details.
        #
        #   @param agent_id [String] Filter by agent ID.
        #
        #   @param created_at_gte [Time] Return deployments created at or after this time (inclusive).
        #
        #   @param created_at_lte [Time] Return deployments created at or before this time (inclusive).
        #
        #   @param include_archived [Boolean] When true, includes archived deployments. Default: false (exclude archived).
        #
        #   @param limit [Integer] Maximum results per page. Default 20, maximum 100.
        #
        #   @param page [String] Opaque pagination cursor.
        #
        #   @param status [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentStatus] Filter by status: `active` or `paused`. Omit for both. To include archived deplo
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
