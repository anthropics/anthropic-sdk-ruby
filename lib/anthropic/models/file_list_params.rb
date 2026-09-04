# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Files#list
    class FileListParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!attribute ids
      #   Restrict the result set to Files whose `id` is in this list. At most 100 entries
      #   (after de-duplication). Mutually exclusive with `page` and `limit`. When
      #   supplied, the response is always a single page (`next_page` is null). IDs that
      #   do not resolve to a visible File — including deleted Files — are silently
      #   omitted.
      #
      #   @return [Array<String>, nil]
      optional :ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute limit
      #   Number of items to return per page.
      #
      #   Defaults to `20`. Ranges from `1` to `1000`.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute page
      #   Opaque page cursor returned in a prior list response's `next_page`. Prefixed
      #   `page_`.
      #
      #   @return [String, nil]
      optional :page, String, nil?: true

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!method initialize(ids: nil, limit: nil, page: nil, workspace_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::FileListParams} for more details.
      #
      #   @param ids [Array<String>, nil] Restrict the result set to Files whose `id` is in this list. At most 100 entries
      #
      #   @param limit [Integer] Number of items to return per page.
      #
      #   @param page [String, nil] Opaque page cursor returned in a prior list response's `next_page`. Prefixed `pa
      #
      #   @param workspace_id [String]
      #
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
