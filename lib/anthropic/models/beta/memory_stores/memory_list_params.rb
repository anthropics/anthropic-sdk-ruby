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
          #   How far below `path_prefix` to list. Defaults to `0`, which lists every memory
          #   below the prefix.
          #
          #   Pass `1` to list only the direct children. Deeper memories are then grouped into
          #   `memory_prefix` items.
          #
          #   @return [Integer, nil]
          optional :depth, Integer

          # @!attribute limit
          #   The maximum number of items to return per page, from 1 to 100. Defaults to 20.
          #
          #   With `view=full`, a page holds at most 20 items. `memory` and `memory_prefix`
          #   items both count toward the limit.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute page
          #   The `next_page` value from a previous response, to get the next page. Omit it to
          #   get the first page.
          #
          #   @return [String, nil]
          optional :page, String

          # @!attribute path_prefix
          #   Return only memories whose path starts with this prefix, such as `/notes/`. This
          #   value appears in request URLs. Do not include secrets or personally identifiable
          #   information.
          #
          #   Omit it to list the whole store. The prefix must end with `/` and matches whole
          #   segments, so `/notes/` matches `/notes/todo.md` but not
          #   `/notes-archive/todo.md`.
          #
          #   @return [String, nil]
          optional :path_prefix, String

          # @!attribute view
          #   Whether each memory in the response includes `content`. Defaults to `basic`,
          #   which sets it to `null`.
          #
          #   With `full`, a page holds at most 20 items.
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
          #   @param depth [Integer] How far below `path_prefix` to list. Defaults to `0`, which lists every memory b
          #
          #   @param limit [Integer] The maximum number of items to return per page, from 1 to 100. Defaults to 20.
          #
          #   @param page [String] The `next_page` value from a previous response, to get the next page. Omit it to
          #
          #   @param path_prefix [String] Return only memories whose path starts with this prefix, such as `/notes/`. This
          #
          #   @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Whether each memory in the response includes `content`. Defaults to `basic`, whi
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
