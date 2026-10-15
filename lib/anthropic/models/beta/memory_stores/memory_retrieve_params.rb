# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#retrieve
        class MemoryRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute memory_store_id
          #   The ID of the memory store that holds the memory (`memstore_...`).
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute memory_id
          #   The ID of the memory to retrieve (`mem_...`).
          #
          #   @return [String]
          required :memory_id, String

          # @!attribute view
          #   Selects which projection of a `memory` or `memory_version` the server returns.
          #   `basic` returns the object with `content` set to `null`; `full` populates
          #   `content`. When omitted, the default is endpoint-specific: retrieve operations
          #   default to `full`; list, create, and update operations default to `basic`.
          #   Listing with `view=full` caps `limit` at 20.
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

          # @!method initialize(memory_store_id:, memory_id:, view: nil, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::MemoryRetrieveParams} for more details.
          #
          #   @param memory_store_id [String] The ID of the memory store that holds the memory (`memstore_...`).
          #
          #   @param memory_id [String] The ID of the memory to retrieve (`mem_...`).
          #
          #   @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Selects which projection of a `memory` or `memory_version` the server returns. `
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
