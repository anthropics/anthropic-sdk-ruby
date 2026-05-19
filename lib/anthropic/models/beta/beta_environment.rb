# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Environments#create
      class BetaEnvironment < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Environment identifier (e.g., 'env\_...')
        #
        #   @return [String]
        required :id, String

        # @!attribute archived_at
        #   RFC 3339 timestamp when environment was archived, or null if not archived
        #
        #   @return [String, nil]
        required :archived_at, String, nil?: true

        # @!attribute config
        #   Environment configuration (either Anthropic Cloud or self-hosted)
        #
        #   @return [Anthropic::Models::Beta::BetaCloudConfig, Anthropic::Models::Beta::BetaSelfHostedConfig]
        required :config, union: -> { Anthropic::Beta::BetaEnvironment::Config }

        # @!attribute created_at
        #   RFC 3339 timestamp when environment was created
        #
        #   @return [String]
        required :created_at, String

        # @!attribute description
        #   User-provided description for the environment
        #
        #   @return [String]
        required :description, String

        # @!attribute metadata
        #   User-provided metadata key-value pairs
        #
        #   @return [Hash{Symbol=>String}]
        required :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute name
        #   Human-readable name for the environment
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #   The type of object (always 'environment')
        #
        #   @return [Symbol, :environment]
        required :type, const: :environment

        # @!attribute updated_at
        #   RFC 3339 timestamp when environment was last updated
        #
        #   @return [String]
        required :updated_at, String

        # @!attribute scope
        #   The visibility scope for this environment. 'organization' means visible to all
        #   accounts. 'account' means visible only to the owning account.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaEnvironment::Scope, nil]
        optional :scope, enum: -> { Anthropic::Beta::BetaEnvironment::Scope }

        # @!method initialize(id:, archived_at:, config:, created_at:, description:, metadata:, name:, updated_at:, scope: nil, type: :environment)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaEnvironment} for more details.
        #
        #   Unified Environment resource for both cloud and self-hosted environments.
        #
        #   @param id [String] Environment identifier (e.g., 'env\_...')
        #
        #   @param archived_at [String, nil] RFC 3339 timestamp when environment was archived, or null if not archived
        #
        #   @param config [Anthropic::Models::Beta::BetaCloudConfig, Anthropic::Models::Beta::BetaSelfHostedConfig] Environment configuration (either Anthropic Cloud or self-hosted)
        #
        #   @param created_at [String] RFC 3339 timestamp when environment was created
        #
        #   @param description [String] User-provided description for the environment
        #
        #   @param metadata [Hash{Symbol=>String}] User-provided metadata key-value pairs
        #
        #   @param name [String] Human-readable name for the environment
        #
        #   @param updated_at [String] RFC 3339 timestamp when environment was last updated
        #
        #   @param scope [Symbol, Anthropic::Models::Beta::BetaEnvironment::Scope] The visibility scope for this environment. 'organization' means visible to all a
        #
        #   @param type [Symbol, :environment] The type of object (always 'environment')

        # Environment configuration (either Anthropic Cloud or self-hosted)
        #
        # @see Anthropic::Models::Beta::BetaEnvironment#config
        module Config
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # `cloud` environment configuration.
          variant :cloud, -> { Anthropic::Beta::BetaCloudConfig }

          # Configuration for self-hosted environments.
          variant :self_hosted, -> { Anthropic::Beta::BetaSelfHostedConfig }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaCloudConfig, Anthropic::Models::Beta::BetaSelfHostedConfig)]
        end

        # The visibility scope for this environment. 'organization' means visible to all
        # accounts. 'account' means visible only to the owning account.
        #
        # @see Anthropic::Models::Beta::BetaEnvironment#scope
        module Scope
          extend Anthropic::Internal::Type::Enum

          ORGANIZATION = :organization
          ACCOUNT = :account

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaEnvironment = Beta::BetaEnvironment
  end
end
