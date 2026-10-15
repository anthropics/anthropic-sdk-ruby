# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#list
        class MemoryListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute memory_store_id
          #   The ID of the memory store to list memories from (`memstore_...`).
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute depth
          #   `0` (or omitted) returns all descendants below `path_prefix` (recursive). `1`
          #   returns immediate children only; deeper entries roll up as `memory_prefix`
          #   items. `depth=1` behaves like `ls`; omitting `depth` behaves like `find`.
          #
          #   @return [Integer, nil]
          optional :depth, Integer

          # @!attribute limit
          #   Maximum number of items to return per page. Must be between 1 and 100. Defaults
          #   to 20 when omitted. Capped at 20 when `view=full`. Both `memory` and
          #   `memory_prefix` items count toward the limit.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute page
          #   Opaque pagination cursor (a `page_...` value). Pass the `next_page` value from a
          #   previous response to fetch the next page; omit for the first page.
          #
          #   @return [String, nil]
          optional :page, String

          # @!attribute path_prefix
          #   Optional path prefix filter. Must end with `/` (segment-aligned), e.g.,
          #   `/notes/`. This value appears in request URLs. Do not include secrets or
          #   personally identifiable information.
          #
          #   @return [String, nil]
          optional :path_prefix, String

          # @!attribute view
          #   Which projection of each `memory` to return. Defaults to `basic` (content
          #   omitted). `full` populates `content` on each item and caps `limit` at 20; use
          #   this as the bulk-read path for export and sync.
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView, nil]
          optional :view, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView }

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

          # @!method initialize(memory_store_id:, depth: nil, limit: nil, page: nil, path_prefix: nil, view: nil, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::MemoryListParams} for more details.
          #
          #   @param memory_store_id [String] The ID of the memory store to list memories from (`memstore_...`).
          #
          #   @param depth [Integer] `0` (or omitted) returns all descendants below `path_prefix` (recursive). `1` re
          #
          #   @param limit [Integer] Maximum number of items to return per page. Must be between 1 and 100. Defaults
          #
          #   @param page [String] Opaque pagination cursor (a `page_...` value). Pass the `next_page` value from a
          #
          #   @param path_prefix [String] Optional path prefix filter. Must end with `/` (segment-aligned), e.g., `/notes/
          #
          #   @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Which projection of each `memory` to return. Defaults to `basic` (content omitte
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
end
