# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Environments#create
      class EnvironmentCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute name
        #   Human-readable name for the environment
        #
        #   @return [String]
        required :name, String

        # @!attribute config
        #   Request params for `cloud` environment configuration.
        #
        #   Fields default to null; on update, omitted fields preserve the existing value.
        #
        #   @return [Anthropic::Models::Beta::BetaCloudConfigParams, nil]
        optional :config, -> { Anthropic::Beta::BetaCloudConfigParams }, nil?: true

        # @!attribute description
        #   Optional description of the environment
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute metadata
        #   User-provided metadata key-value pairs
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(name:, config: nil, description: nil, metadata: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::EnvironmentCreateParams} for more details.
        #
        #   @param name [String] Human-readable name for the environment
        #
        #   @param config [Anthropic::Models::Beta::BetaCloudConfigParams, nil] Request params for `cloud` environment configuration.
        #
        #   @param description [String, nil] Optional description of the environment
        #
        #   @param metadata [Hash{Symbol=>String}] User-provided metadata key-value pairs
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
