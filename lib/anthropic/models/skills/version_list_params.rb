# frozen_string_literal: true

module Anthropic
  module Models
    module Skills
      # @see Anthropic::Resources::Skills::Versions#list
      class VersionListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute skill_id
        #   Unique identifier for the skill.
        #
        #   The format and length of IDs may change over time.
        #
        #   @return [String]
        required :skill_id, String

        # @!attribute limit
        #   Number of results to return per page.
        #
        #   Ranges from `1` to `1000`. Defaults to `20`.
        #
        #   @return [Integer, nil]
        optional :limit, Integer, nil?: true

        # @!attribute page
        #   Optionally set to the `next_page` token from the previous response.
        #
        #   @return [String, nil]
        optional :page, String, nil?: true

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!method initialize(skill_id:, limit: nil, page: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Skills::VersionListParams} for more details.
        #
        #   @param skill_id [String] Unique identifier for the skill.
        #
        #   @param limit [Integer, nil] Number of results to return per page.
        #
        #   @param page [String, nil] Optionally set to the `next_page` token from the previous response.
        #
        #   @param workspace_id [String]
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
