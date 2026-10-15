# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::MemoryStores#list
      class MemoryStoreListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute created_at_gte
        #   Return only stores whose `created_at` is at or after this time (inclusive). Sent
        #   on the wire as `created_at[gte]`.
        #
        #   @return [Time, nil]
        optional :created_at_gte, Time

        # @!attribute created_at_lte
        #   Return only stores whose `created_at` is at or before this time (inclusive).
        #   Sent on the wire as `created_at[lte]`.
        #
        #   @return [Time, nil]
        optional :created_at_lte, Time

        # @!attribute include_archived
        #   When `true`, archived stores are included in the results. Defaults to `false`
        #   (archived stores are excluded).
        #
        #   @return [Boolean, nil]
        optional :include_archived, Anthropic::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum number of stores to return per page. Must be between 1 and 100. Defaults
        #   to 20 when omitted.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute page
        #   Opaque pagination cursor (a `page_...` value). Pass the `next_page` value from a
        #   previous response to fetch the next page; omit for the first page.
        #
        #   @return [String, nil]
        optional :page, String

        # @!attribute betas
        #   This endpoint is in beta: requests must send `agent-memory-2026-07-22` or
        #   `managed-agents-2026-04-01` in this header.
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

        # @!method initialize(created_at_gte: nil, created_at_lte: nil, include_archived: nil, limit: nil, page: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::MemoryStoreListParams} for more details.
        #
        #   @param created_at_gte [Time] Return only stores whose `created_at` is at or after this time (inclusive). Sent
        #
        #   @param created_at_lte [Time] Return only stores whose `created_at` is at or before this time (inclusive). Sen
        #
        #   @param include_archived [Boolean] When `true`, archived stores are included in the results. Defaults to `false` (a
        #
        #   @param limit [Integer] Maximum number of stores to return per page. Must be between 1 and 100. Defaults
        #
        #   @param page [String] Opaque pagination cursor (a `page_...` value). Pass the `next_page` value from a
        #
        #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `agent-memory-2026-07-22` or `manag
        #
        #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
