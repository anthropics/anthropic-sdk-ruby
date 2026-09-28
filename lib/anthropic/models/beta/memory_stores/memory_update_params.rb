# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#update
        class MemoryUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute memory_store_id
          #   The ID of the memory store that holds the memory (`memstore_...`).
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute memory_id
          #   The ID of the memory to update (`mem_...`).
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

          # @!attribute content
          #   New UTF-8 text content for the memory. Maximum 100 kB (102,400 bytes). Omit to
          #   leave the content unchanged (e.g., for a rename-only update).
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!attribute path
          #   New path for the memory (a rename). Must start with `/`, contain at least one
          #   non-empty segment, and be at most 1,024 bytes. Must not contain empty segments,
          #   `.` or `..` segments, control or format characters, or the Unicode line and
          #   paragraph separators (U+2028, U+2029), and must be NFC-normalized. Paths are
          #   case-sensitive. The memory's `id` is preserved across renames. Omit to leave the
          #   path unchanged.
          #
          #   @return [String, nil]
          optional :path, String, nil?: true

          # @!attribute precondition
          #   Optional optimistic-concurrency precondition. When supplied, the update applies
          #   only if the memory's current state matches; on mismatch the request returns
          #   `memory_precondition_failed_error` (HTTP 409). When omitted, the update is
          #   unconditional.
          #
          #   @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition, nil]
          optional :precondition, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition }

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

          # @!method initialize(memory_store_id:, memory_id:, view: nil, content: nil, path: nil, precondition: nil, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::MemoryUpdateParams} for more details.
          #
          #   @param memory_store_id [String] The ID of the memory store that holds the memory (`memstore_...`).
          #
          #   @param memory_id [String] The ID of the memory to update (`mem_...`).
          #
          #   @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Selects which projection of a `memory` or `memory_version` the server returns. `
          #
          #   @param content [String, nil] New UTF-8 text content for the memory. Maximum 100 kB (102,400 bytes). Omit to l
          #
          #   @param path [String, nil] New path for the memory (a rename). Must start with `/`, contain at least one no
          #
          #   @param precondition [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition] Optional optimistic-concurrency precondition. When supplied, the update applies
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
end
