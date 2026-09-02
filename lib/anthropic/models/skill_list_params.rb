# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Skills#list
    class SkillListParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!attribute limit
      #   Number of results to return per page.
      #
      #   Ranges from `1` to `1000`. Defaults to `20`.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute page
      #   Pagination token for fetching a specific page of results.
      #
      #   Pass the value from a previous response's `next_page` field to get the next page
      #   of results.
      #
      #   @return [String, nil]
      optional :page, String, nil?: true

      # @!attribute source
      #   Filter skills by source.
      #
      #   If provided, only skills from the specified source will be returned:
      #
      #   - `"custom"`: only return user-created skills
      #   - `"anthropic"`: only return Anthropic-created skills
      #
      #   @return [String, nil]
      optional :source, String, nil?: true

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!method initialize(limit: nil, page: nil, source: nil, workspace_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::SkillListParams} for more details.
      #
      #   @param limit [Integer] Number of results to return per page.
      #
      #   @param page [String, nil] Pagination token for fetching a specific page of results.
      #
      #   @param source [String, nil] Filter skills by source.
      #
      #   @param workspace_id [String]
      #
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
