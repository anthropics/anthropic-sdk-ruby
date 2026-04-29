# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#create
        class MemoryCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute memory_store_id
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute content
          #   UTF-8 text content for the new memory. Maximum 100 kB (102,400 bytes). Required;
          #   pass `""` explicitly to create an empty memory.
          #
          #   @return [String, nil]
          required :content, String, nil?: true

          # @!attribute path
          #   Hierarchical path for the new memory, e.g. `/projects/foo/notes.md`. Must start
          #   with `/`, contain at least one non-empty segment, and be at most 1,024 bytes.
          #   Must not contain empty segments, `.` or `..` segments, control or format
          #   characters, and must be NFC-normalized. Paths are case-sensitive.
          #
          #   @return [String]
          required :path, String

          # @!attribute view
          #   Query parameter for view
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView, nil]
          optional :view, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(memory_store_id:, content:, path:, view: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::MemoryCreateParams} for more details.
          #
          #   @param memory_store_id [String]
          #
          #   @param content [String, nil] UTF-8 text content for the new memory. Maximum 100 kB (102,400 bytes). Required;
          #
          #   @param path [String] Hierarchical path for the new memory, e.g. `/projects/foo/notes.md`. Must start
          #
          #   @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query parameter for view
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
