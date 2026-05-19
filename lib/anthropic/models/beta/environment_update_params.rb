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
        #   Updated environment configuration
        #
        #   @return [Anthropic::Models::Beta::BetaCloudConfigParams, Anthropic::Models::Beta::BetaSelfHostedConfigParams, nil]
        optional :config, union: -> { Anthropic::Beta::EnvironmentUpdateParams::Config }, nil?: true

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

        # @!attribute scope
        #   The visibility scope for this environment. 'organization' makes the environment
        #   visible to all accounts. 'account' restricts visibility to the owning account
        #   only.
        #
        #   @return [Symbol, Anthropic::Models::Beta::EnvironmentUpdateParams::Scope, nil]
        optional :scope, enum: -> { Anthropic::Beta::EnvironmentUpdateParams::Scope }, nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(environment_id:, config: nil, description: nil, metadata: nil, name: nil, scope: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::EnvironmentUpdateParams} for more details.
        #
        #   @param environment_id [String]
        #
        #   @param config [Anthropic::Models::Beta::BetaCloudConfigParams, Anthropic::Models::Beta::BetaSelfHostedConfigParams, nil] Updated environment configuration
        #
        #   @param description [String, nil] Updated description of the environment
        #
        #   @param metadata [Hash{Symbol=>String, nil}] User-provided metadata key-value pairs. Set a value to null or empty string to d
        #
        #   @param name [String, nil] Updated name for the environment
        #
        #   @param scope [Symbol, Anthropic::Models::Beta::EnvironmentUpdateParams::Scope, nil] The visibility scope for this environment. 'organization' makes the environment
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Updated environment configuration
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
        # only.
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
