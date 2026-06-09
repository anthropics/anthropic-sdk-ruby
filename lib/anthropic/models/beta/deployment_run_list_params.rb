# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::DeploymentRuns#list
      class DeploymentRunListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute created_at_gt
        #   Return runs created strictly after this time (exclusive).
        #
        #   @return [Time, nil]
        optional :created_at_gt, Time

        # @!attribute created_at_gte
        #   Return runs created at or after this time (inclusive).
        #
        #   @return [Time, nil]
        optional :created_at_gte, Time

        # @!attribute created_at_lt
        #   Return runs created strictly before this time (exclusive).
        #
        #   @return [Time, nil]
        optional :created_at_lt, Time

        # @!attribute created_at_lte
        #   Return runs created at or before this time (inclusive).
        #
        #   @return [Time, nil]
        optional :created_at_lte, Time

        # @!attribute deployment_id
        #   Filter to a specific deployment. Omit to list across all deployments in the
        #   workspace. Filtering by a non-existent deployment_id returns 200 with empty
        #   data.
        #
        #   @return [String, nil]
        optional :deployment_id, String

        # @!attribute has_error
        #   Filter: true for runs with non-null error, false for runs with non-null
        #   session_id. Omit for all.
        #
        #   @return [Boolean, nil]
        optional :has_error, Anthropic::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum results per page. Default 20, maximum 1000.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute page
        #   Opaque pagination cursor. Pass next_page from the previous response. Invalid or
        #   expired cursors return 400.
        #
        #   @return [String, nil]
        optional :page, String

        # @!attribute trigger_type
        #   Filter runs by what triggered them. Omit to return all runs.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsTriggerType, nil]
        optional :trigger_type, enum: -> { Anthropic::Beta::BetaManagedAgentsTriggerType }

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, deployment_id: nil, has_error: nil, limit: nil, page: nil, trigger_type: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::DeploymentRunListParams} for more details.
        #
        #   @param created_at_gt [Time] Return runs created strictly after this time (exclusive).
        #
        #   @param created_at_gte [Time] Return runs created at or after this time (inclusive).
        #
        #   @param created_at_lt [Time] Return runs created strictly before this time (exclusive).
        #
        #   @param created_at_lte [Time] Return runs created at or before this time (inclusive).
        #
        #   @param deployment_id [String] Filter to a specific deployment. Omit to list across all deployments in the work
        #
        #   @param has_error [Boolean] Filter: true for runs with non-null error, false for runs with non-null
        #   session\_
        #
        #   @param limit [Integer] Maximum results per page. Default 20, maximum 1000.
        #
        #   @param page [String] Opaque pagination cursor. Pass next_page from the previous response. Invalid or
        #
        #   @param trigger_type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsTriggerType] Filter runs by what triggered them. Omit to return all runs.
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
