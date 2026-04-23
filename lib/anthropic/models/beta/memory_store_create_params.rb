# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::MemoryStores#create
      class MemoryStoreCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute metadata
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(name:, description: nil, metadata: nil, betas: nil, request_options: {})
        #   @param name [String]
        #
        #   @param description [String]
        #
        #   @param metadata [Hash{Symbol=>String}]
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
