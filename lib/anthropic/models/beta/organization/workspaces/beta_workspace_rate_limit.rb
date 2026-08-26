# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          # @see Anthropic::Resources::Beta::Organization::Workspaces::RateLimits#list
          class BetaWorkspaceRateLimit < Anthropic::Internal::Type::BaseModel
            # @!attribute group_type
            #   The kind of rate-limit group this entry represents. `model_group` entries apply
            #   to a family of models (listed in `models`); other values apply to an API-surface
            #   category and have `models` set to `null`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType]
            required :group_type,
                     enum: -> { Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType }

            # @!attribute limits
            #   The limiter values overridden for this group in this workspace. Limiter types
            #   without a workspace override are omitted and inherit the organization value.
            #
            #   @return [Array<Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue>]
            required :limits,
                     -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue] }

            # @!attribute models
            #   Model names this entry's limits apply to, including aliases. `null` when
            #   `group_type` is not `"model_group"`.
            #
            #   @return [Array<String>, nil]
            required :models, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute rate_limit_id
            #   The `id` of the RateLimit group this override applies to.
            #
            #   @return [String]
            required :rate_limit_id, String

            # @!attribute type
            #   Object type. Always `workspace_rate_limit` for workspace rate-limit entries.
            #
            #   @return [Symbol, :workspace_rate_limit]
            required :type, const: :workspace_rate_limit

            # @!attribute workspace_id
            #   ID of the Workspace this override applies to.
            #
            #   @return [String]
            required :workspace_id, String

            # @!method initialize(group_type:, limits:, models:, rate_limit_id:, workspace_id:, type: :workspace_rate_limit)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit} for
            #   more details.
            #
            #   @param group_type [Symbol, Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit::GroupType] The kind of rate-limit group this entry represents. `model_group` entries apply
            #
            #   @param limits [Array<Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimitValue>] The limiter values overridden for this group in this workspace. Limiter types wi
            #
            #   @param models [Array<String>, nil] Model names this entry's limits apply to, including aliases. `null` when
            #   `group\_
            #
            #   @param rate_limit_id [String] The `id` of the RateLimit group this override applies to.
            #
            #   @param workspace_id [String] ID of the Workspace this override applies to.
            #
            #   @param type [Symbol, :workspace_rate_limit] Object type. Always `workspace_rate_limit` for workspace rate-limit entries.

            # The kind of rate-limit group this entry represents. `model_group` entries apply
            # to a family of models (listed in `models`); other values apply to an API-surface
            # category and have `models` set to `null`.
            #
            # @see Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit#group_type
            module GroupType
              extend Anthropic::Internal::Type::Enum

              BATCH = :batch
              FILES = :files
              MODEL_GROUP = :model_group
              SKILLS = :skills
              TOKEN_COUNT = :token_count
              WEB_SEARCH = :web_search

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
