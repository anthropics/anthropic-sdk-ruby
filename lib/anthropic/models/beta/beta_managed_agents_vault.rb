# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Vaults#create
      class BetaManagedAgentsVault < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for the vault.
        #
        #   @return [String]
        required :id, String

        # @!attribute archived_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        required :archived_at, Time, nil?: true

        # @!attribute created_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute display_name
        #   Human-readable name for the vault.
        #
        #   @return [String]
        required :display_name, String

        # @!attribute metadata
        #   Arbitrary key-value metadata attached to the vault.
        #
        #   @return [Hash{Symbol=>String}]
        required :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsVault::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsVault::Type }

        # @!attribute updated_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :updated_at, Time

        # @!method initialize(id:, archived_at:, created_at:, display_name:, metadata:, type:, updated_at:)
        #   A vault that stores credentials for use by agents during sessions.
        #
        #   @param id [String] Unique identifier for the vault.
        #
        #   @param archived_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param created_at [Time] A timestamp in RFC 3339 format
        #
        #   @param display_name [String] Human-readable name for the vault.
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata attached to the vault.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsVault::Type]
        #
        #   @param updated_at [Time] A timestamp in RFC 3339 format

        # @see Anthropic::Models::Beta::BetaManagedAgentsVault#type
        module Type
          extend Anthropic::Internal::Type::Enum

          VAULT = :vault

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsVault = Beta::BetaManagedAgentsVault
  end
end
