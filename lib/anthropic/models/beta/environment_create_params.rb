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
        #   Environment configuration
        #
        #   @return [Anthropic::Models::Beta::BetaCloudConfigParams, Anthropic::Models::Beta::BetaSelfHostedConfigParams, nil]
        optional :config, union: -> { Anthropic::Beta::EnvironmentCreateParams::Config }, nil?: true

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

        # @!attribute scope
        #   The visibility scope for this environment. 'organization' makes the environment
        #   visible to all accounts. 'account' restricts visibility to the owning account
        #   only. Only applicable for self-hosted environments. If not specified, defaults
        #   based on organization type.
        #
        #   @return [Symbol, Anthropic::Models::Beta::EnvironmentCreateParams::Scope, nil]
        optional :scope, enum: -> { Anthropic::Beta::EnvironmentCreateParams::Scope }, nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(name:, config: nil, description: nil, metadata: nil, scope: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::EnvironmentCreateParams} for more details.
        #
        #   @param name [String] Human-readable name for the environment
        #
        #   @param config [Anthropic::Models::Beta::BetaCloudConfigParams, Anthropic::Models::Beta::BetaSelfHostedConfigParams, nil] Environment configuration
        #
        #   @param description [String, nil] Optional description of the environment
        #
        #   @param metadata [Hash{Symbol=>String}] User-provided metadata key-value pairs
        #
        #   @param scope [Symbol, Anthropic::Models::Beta::EnvironmentCreateParams::Scope, nil] The visibility scope for this environment. 'organization' makes the environment
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Environment configuration
        module Config
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Request params for `cloud` environment configuration.
          #
          # Fields default to null; on update, omitted fields preserve the
          # existing value.
          variant :cloud, -> { Anthropic::Beta::BetaCloudConfigParams }

          # Request params for `self_hosted` environment configuration.
          variant :self_hosted, -> { Anthropic::Beta::BetaSelfHostedConfigParams }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaCloudConfigParams, Anthropic::Models::Beta::BetaSelfHostedConfigParams)]
        end

        # The visibility scope for this environment. 'organization' makes the environment
        # visible to all accounts. 'account' restricts visibility to the owning account
        # only. Only applicable for self-hosted environments. If not specified, defaults
        # based on organization type.
        module Scope
          extend Anthropic::Internal::Type::Enum

          ORGANIZATION = :organization
          ACCOUNT = :account

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
