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
        #
        #   @return [Anthropic::Models::Beta::BetaDreamModelConfigParam, String]
        required :model, union: -> { Anthropic::Beta::DreamCreateParams::Model }

        # @!attribute instructions
        #
        #   @return [String, nil]
        optional :instructions, String, nil?: true

        # @!attribute output_behavior
        #
        #   @return [Anthropic::Models::Beta::BetaOutputBehaviorCreateNew, Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting, nil]
        optional :output_behavior, union: -> { Anthropic::Beta::BetaOutputBehavior }

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!method initialize(inputs:, model:, instructions: nil, output_behavior: nil, betas: nil, workspace_id: nil, request_options: {})
        #   @param inputs [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>]
        #
        #   @param model [Anthropic::Models::Beta::BetaDreamModelConfigParam, String]
        #
        #   @param instructions [String, nil]
        #
        #   @param output_behavior [Anthropic::Models::Beta::BetaOutputBehaviorCreateNew, Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting]
        #
        #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param workspace_id [String]
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        module Model
          extend Anthropic::Internal::Type::Union

          # Model identifier and configuration applied to every pipeline stage.
          variant -> { Anthropic::Beta::BetaDreamModelConfigParam }

          variant String

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaDreamModelConfigParam, String)]
        end
      end
    end
  end
end
