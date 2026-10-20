# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::MemoryStores#create
      class MemoryStoreCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute name
        #   The name of the memory store, 1 to 255 characters long, without control
        #   characters. Names don't have to be unique in a workspace.
        #
        #   In a session, the store's directory under `/mnt/memory/` is based on this name.
        #   The name is lowercased and every run of characters other than ASCII letters and
        #   digits becomes one hyphen. The session's memory store resource gives the exact
        #   path in `mount_path`.
        #
        #   See the
        #   [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#how-the-agent-accesses-memory)
        #   to learn more about how agents access memory stores.
        #
        #   @return [String]
        required :name, String

        # @!attribute description
        #   Free-text description of what the store contains, up to 1,024 characters.
        #   Included in the agent's system prompt when the store is attached, so word it to
        #   be useful to the agent.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute metadata
        #   Key-value pairs for your own use, such as the end user that the store belongs
        #   to. The agent doesn't see them.
        #
        #   A store has at most 16 pairs. Keys are 1 to 64 characters long and values at
        #   most 512 characters.
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
        #   @param name [String] The name of the memory store, 1 to 255 characters long, without control characte
        #
        #   @param description [String] Free-text description of what the store contains, up to 1,024 characters. Includ
        #
        #   @param metadata [Hash{Symbol=>String}] Key-value pairs for your own use, such as the end user that the store belongs to
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
