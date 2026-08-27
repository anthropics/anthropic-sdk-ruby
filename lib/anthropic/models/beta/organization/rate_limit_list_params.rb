# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::RateLimits#list
        class RateLimitListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute group_type
          #   Filter by group type.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::RateLimitListParams::GroupType, nil]
          optional :group_type,
                   enum: -> { Anthropic::Beta::Organization::RateLimitListParams::GroupType },
                   nil?: true

          # @!attribute limit
          #   Maximum number of items to return per page. Ranges from `1` to `1000`.
          #
          #   When omitted, every remaining entry is returned in a single page and `next_page`
          #   is `null`.
          #
          #   @return [Integer, nil]
          optional :limit, Integer, nil?: true

          # @!attribute model
          #   Filter to the single entry containing this model. Accepts full model names and
          #   aliases. Returns 404 if the model is not found or has no rate limits for this
          #   organization.
          #
          #   @return [String, nil]
          optional :model, String, nil?: true

          # @!attribute page
          #   Opaque cursor from a previous response's `next_page`.
          #
          #   @return [String, nil]
          optional :page, String, nil?: true

          # @!method initialize(group_type: nil, limit: nil, model: nil, page: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::RateLimitListParams} for more details.
          #
          #   @param group_type [Symbol, Anthropic::Models::Beta::Organization::RateLimitListParams::GroupType, nil] Filter by group type.
          #
          #   @param limit [Integer, nil] Maximum number of items to return per page. Ranges from `1` to `1000`.
          #
          #   @param model [String, nil] Filter to the single entry containing this model. Accepts full model names and a
          #
          #   @param page [String, nil] Opaque cursor from a previous response's `next_page`.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Filter by group type.
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
