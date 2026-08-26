# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::RateLimits#list
        class BetaOrganizationRateLimit < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Stable identifier for this rate-limit group within the organization.
          #
          #   @return [String]
          required :id, String

          # @!attribute group_type
          #   The kind of rate-limit group this entry represents. `model_group` entries apply
          #   to a family of models (listed in `models`); other values apply to an API-surface
          #   category and have `models` set to `null`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimit::GroupType]
          required :group_type, enum: -> { Anthropic::Beta::Organization::BetaOrganizationRateLimit::GroupType }

          # @!attribute limits
          #   The limiter values that apply to this group.
          #
          #   @return [Array<Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitValue>]
          required :limits,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaOrganizationRateLimitValue] }

          # @!attribute models
          #   Model names this entry's limits apply to, including aliases. `null` when
          #   `group_type` is not `"model_group"`.
          #
          #   @return [Array<String>, nil]
          required :models, Anthropic::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute type
          #   Object type. Always `rate_limit` for organization rate-limit entries.
          #
          #   @return [Symbol, :rate_limit]
          required :type, const: :rate_limit

          # @!method initialize(id:, group_type:, limits:, models:, type: :rate_limit)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaOrganizationRateLimit} for more
          #   details.
          #
          #   @param id [String] Stable identifier for this rate-limit group within the organization.
          #
          #   @param group_type [Symbol, Anthropic::Models::Beta::Organization::BetaOrganizationRateLimit::GroupType] The kind of rate-limit group this entry represents. `model_group` entries apply
          #
          #   @param limits [Array<Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitValue>] The limiter values that apply to this group.
          #
          #   @param models [Array<String>, nil] Model names this entry's limits apply to, including aliases. `null` when
          #   `group\_
          #
          #   @param type [Symbol, :rate_limit] Object type. Always `rate_limit` for organization rate-limit entries.

          # The kind of rate-limit group this entry represents. `model_group` entries apply
          # to a family of models (listed in `models`); other values apply to an API-surface
          # category and have `models` set to `null`.
          #
          # @see Anthropic::Models::Beta::Organization::BetaOrganizationRateLimit#group_type
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
