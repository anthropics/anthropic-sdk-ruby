# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Models#retrieve
    class ModelRetrieveParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!attribute betas
      #   Optional header to specify the beta version(s) you want to use.
      #
      #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
      optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

      # @!method initialize(betas: nil, request_options: {})
      #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
      #
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
