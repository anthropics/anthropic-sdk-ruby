# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Files#list
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

        # @!attribute scope_id
        #   Filter by scope ID. Only returns files associated with the specified scope
        #   (e.g., a session ID).
        #
        #   @return [String, nil]
        optional :scope_id, String

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
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

        # @!method initialize(ids: nil, limit: nil, page: nil, scope_id: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::FileListParams} for more details.
        #
        #   @param ids [Array<String>, nil] Restrict the result set to Files whose `id` is in this list. At most 100 entries
        #
        #   @param limit [Integer] Number of items to return per page.
        #
        #   @param page [String, nil] Opaque page cursor returned in a prior list response's `next_page`. Prefixed
        #
        #   @param scope_id [String] Filter by scope ID. Only returns files associated with the specified scope (e.g.
        #
        #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
