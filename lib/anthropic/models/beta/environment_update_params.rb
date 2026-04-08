# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Environments#update
      class EnvironmentUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute environment_id
        #
        #   @return [String]
        required :environment_id, String

        # @!attribute config
        #   Request params for `cloud` environment configuration.
        #
        #   Fields default to null; on update, omitted fields preserve the existing value.
        #
        #   @return [Anthropic::Models::Beta::BetaCloudConfigParams, nil]
        optional :config, -> { Anthropic::Beta::BetaCloudConfigParams }, nil?: true

        # @!attribute description
        #   Updated description of the environment
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute metadata
        #   User-provided metadata key-value pairs. Set a value to null or empty string to
        #   delete the key.
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String, nil?: true]

        # @!attribute name
        #   Updated name for the environment
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(environment_id:, config: nil, description: nil, metadata: nil, name: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::EnvironmentUpdateParams} for more details.
        #
        #   @param environment_id [String]
        #
        #   @param config [Anthropic::Models::Beta::BetaCloudConfigParams, nil] Request params for `cloud` environment configuration.
        #
        #   @param description [String, nil] Updated description of the environment
        #
        #   @param metadata [Hash{Symbol=>String, nil}] User-provided metadata key-value pairs. Set a value to null or empty string to d
        #
        #   @param name [String, nil] Updated name for the environment
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
