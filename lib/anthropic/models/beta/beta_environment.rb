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
        #   `cloud` environment configuration.
        #
        #   @return [Anthropic::Models::Beta::BetaCloudConfig]
        required :config, -> { Anthropic::Beta::BetaCloudConfig }

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

        # @!method initialize(id:, archived_at:, config:, created_at:, description:, metadata:, name:, updated_at:, type: :environment)
        #   Unified Environment resource for both cloud and self-hosted environments.
        #
        #   @param id [String] Environment identifier (e.g., 'env\_...')
        #
        #   @param archived_at [String, nil] RFC 3339 timestamp when environment was archived, or null if not archived
        #
        #   @param config [Anthropic::Models::Beta::BetaCloudConfig] `cloud` environment configuration.
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
        #   @param type [Symbol, :environment] The type of object (always 'environment')
      end
    end

    BetaEnvironment = Beta::BetaEnvironment
  end
end
