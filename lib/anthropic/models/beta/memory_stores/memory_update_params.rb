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
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute memory_id
          #
          #   @return [String]
          required :memory_id, String

          # @!attribute view
          #   Query parameter for view
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
          #   `.` or `..` segments, control or format characters, and must be NFC-normalized.
          #   Paths are case-sensitive. The memory's `id` is preserved across renames. Omit to
          #   leave the path unchanged.
          #
          #   @return [String, nil]
          optional :path, String, nil?: true

          # @!attribute precondition
          #   Optimistic-concurrency precondition: the update applies only if the memory's
          #   stored `content_sha256` equals the supplied value. On mismatch, the request
          #   returns `memory_precondition_failed_error` (HTTP 409); re-read the memory and
          #   retry against the fresh state. If the precondition fails but the stored state
          #   already exactly matches the requested `content` and `path`, the server returns
          #   200 instead of 409.
          #
          #   @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition, nil]
          optional :precondition, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(memory_store_id:, memory_id:, view: nil, content: nil, path: nil, precondition: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::MemoryUpdateParams} for more details.
          #
          #   @param memory_store_id [String]
          #
          #   @param memory_id [String]
          #
          #   @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query parameter for view
          #
          #   @param content [String, nil] New UTF-8 text content for the memory. Maximum 100 kB (102,400 bytes). Omit to l
          #
          #   @param path [String, nil] New path for the memory (a rename). Must start with `/`, contain at least one no
          #
          #   @param precondition [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition] Optimistic-concurrency precondition: the update applies only if the memory's sto
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
