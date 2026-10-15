# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::MemoryStores#create
      class MemoryStoreCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute name
        #   Human-readable name for the store. Required; 1–255 characters; no control
        #   characters. The mount-path slug under `/mnt/memory/` is derived from this name
        #   (lowercased, non-alphanumeric runs collapsed to a hyphen). Names need not be
        #   unique within a workspace.
        #
        #   @return [String]
        required :name, String

        # @!attribute description
        #   Free-text description of what the store contains, up to 1024 characters.
        #   Included in the agent's system prompt when the store is attached, so word it to
        #   be useful to the agent.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute metadata
        #   Arbitrary key-value tags for your own bookkeeping (such as the end user a store
        #   belongs to). Up to 16 pairs; keys 1–64 characters; values up to 512 characters.
        #   Not visible to the agent.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

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

        # @!method initialize(name:, description: nil, metadata: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::MemoryStoreCreateParams} for more details.
        #
        #   @param name [String] Human-readable name for the store. Required; 1–255 characters; no control charac
        #
        #   @param description [String] Free-text description of what the store contains, up to 1024 characters. Include
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value tags for your own bookkeeping (such as the end user a store
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
