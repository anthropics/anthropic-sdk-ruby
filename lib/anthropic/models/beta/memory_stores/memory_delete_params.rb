# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#delete
        class MemoryDeleteParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute memory_store_id
          #   The ID of the memory store that holds the memory (`memstore_...`).
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute memory_id
          #   The ID of the memory to delete (`mem_...`).
          #
          #   @return [String]
          required :memory_id, String

          # @!attribute expected_content_sha256
          #   Delete the memory only if its current `content_sha256` equals this value, given
          #   as 64 lowercase hexadecimal characters. Omit it to delete unconditionally.
          #
          #   If the hashes differ, the request fails with HTTP status 409 and nothing is
          #   deleted.
          #
          #   @return [String, nil]
          optional :expected_content_sha256, String

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

          # @!method initialize(memory_store_id:, memory_id:, expected_content_sha256: nil, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::MemoryDeleteParams} for more details.
          #
          #   @param memory_store_id [String] The ID of the memory store that holds the memory (`memstore_...`).
          #
          #   @param memory_id [String] The ID of the memory to delete (`mem_...`).
          #
          #   @param expected_content_sha256 [String] Delete the memory only if its current `content_sha256` equals this value, given
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
