# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Workspaces
        # @see Anthropic::Resources::Organization::Workspaces::RateLimits#update
        class RateLimitUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute workspace_id
          #   The ID of the workspace.
          #
          #   @return [String]
          required :workspace_id, String

          # @!attribute rate_limit_id
          #   The `id` of the organization's rate-limit entry to set overrides for.
          #
          #   @return [String]
          required :rate_limit_id, String

          # @!attribute limits
          #   Limits to set or clear. Unspecified limit types are unchanged.
          #
          #   @return [Array<Anthropic::Models::Organization::Workspaces::WorkspaceRateLimitUpdateValue>]
          required :limits,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Organization::Workspaces::WorkspaceRateLimitUpdateValue] }

          # @!method initialize(workspace_id:, rate_limit_id:, limits:, request_options: {})
          #   @param workspace_id [String] The ID of the workspace.
          #
          #   @param rate_limit_id [String] The `id` of the organization's rate-limit entry to set overrides for.
          #
          #   @param limits [Array<Anthropic::Models::Organization::Workspaces::WorkspaceRateLimitUpdateValue>] Limits to set or clear. Unspecified limit types are unchanged.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
