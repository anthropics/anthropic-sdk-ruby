# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Dreams#create
      class DreamCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute inputs
        #
        #   @return [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>]
        required :inputs, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaDreamInput] }

        # @!attribute model
        #   Model identifier and configuration applied to every pipeline stage.
        #
        #   @return [String, Anthropic::Models::Beta::BetaDreamModelConfigParam]
        required :model, union: -> { Anthropic::Beta::DreamCreateParams::Model }

        # @!attribute instructions
        #
        #   @return [String, nil]
        optional :instructions, String, nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(inputs:, model:, instructions: nil, betas: nil, request_options: {})
        #   @param inputs [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>]
        #
        #   @param model [String, Anthropic::Models::Beta::BetaDreamModelConfigParam] Model identifier and configuration applied to every pipeline stage.
        #
        #   @param instructions [String, nil]
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Model identifier and configuration applied to every pipeline stage.
        module Model
          extend Anthropic::Internal::Type::Union

          variant String

          # Model identifier and configuration applied to every pipeline stage.
          variant -> { Anthropic::Beta::BetaDreamModelConfigParam }

          # @!method self.variants
          #   @return [Array(String, Anthropic::Models::Beta::BetaDreamModelConfigParam)]
        end
      end
    end
  end
end
