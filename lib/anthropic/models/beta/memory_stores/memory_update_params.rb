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
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!attribute path
          #
          #   @return [String, nil]
          optional :path, String, nil?: true

          # @!attribute precondition
          #
          #   @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition, nil]
          optional :precondition, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(memory_store_id:, memory_id:, view: nil, content: nil, path: nil, precondition: nil, betas: nil, request_options: {})
          #   @param memory_store_id [String]
          #
          #   @param memory_id [String]
          #
          #   @param view [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryView] Query parameter for view
          #
          #   @param content [String, nil]
          #
          #   @param path [String, nil]
          #
          #   @param precondition [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition]
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
