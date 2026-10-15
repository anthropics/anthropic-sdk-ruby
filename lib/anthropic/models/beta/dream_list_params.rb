# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Dreams#list
      class DreamListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute created_at_gt
        #   Return only dreams created after this time (exclusive), in RFC 3339.
        #
        #   @return [Time, nil]
        optional :created_at_gt, Time

        # @!attribute created_at_lt
        #   Return only dreams created before this time (exclusive), in RFC 3339.
        #
        #   @return [Time, nil]
        optional :created_at_lt, Time

        # @!attribute include_archived
        #   Whether to include archived dreams. Defaults to `false`.
        #
        #   @return [Boolean, nil]
        optional :include_archived, Anthropic::Internal::Type::Boolean

        # @!attribute limit
        #   The maximum number of dreams to return, from 1 to 100. Defaults to 20.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute page
        #   The cursor for the page to return, taken from `next_page` in a previous
        #   response.
        #
        #   Leave it out to get the first page.
        #
        #   @return [String, nil]
        optional :page, String

        # @!attribute statuses
        #   Return only dreams that have one of these statuses.
        #
        #   Repeat the parameter to give more than one status. Leave it out to return dreams
        #   of every status.
        #
        #   @return [Array<Symbol, Anthropic::Models::Beta::BetaDreamStatus>, nil]
        optional :statuses, -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::BetaDreamStatus] }

        # @!attribute betas
        #   This endpoint is in beta: requests must send `dreaming-2026-04-21` in this
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

        # @!method initialize(created_at_gt: nil, created_at_lt: nil, include_archived: nil, limit: nil, page: nil, statuses: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::DreamListParams} for more details.
        #
        #   @param created_at_gt [Time] Return only dreams created after this time (exclusive), in RFC 3339.
        #
        #   @param created_at_lt [Time] Return only dreams created before this time (exclusive), in RFC 3339.
        #
        #   @param include_archived [Boolean] Whether to include archived dreams. Defaults to `false`.
        #
        #   @param limit [Integer] The maximum number of dreams to return, from 1 to 100. Defaults to 20.
        #
        #   @param page [String] The cursor for the page to return, taken from `next_page` in a previous response
        #
        #   @param statuses [Array<Symbol, Anthropic::Models::Beta::BetaDreamStatus>] Return only dreams that have one of these statuses.
        #
        #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `dreaming-2026-04-21` in this heade
        #
        #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
