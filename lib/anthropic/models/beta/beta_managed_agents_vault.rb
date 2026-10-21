# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Vaults#create
      class BetaManagedAgentsVault < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The unique ID of the vault (`vlt_...`).
        #
        #   @return [String]
        required :id, String

        # @!attribute archived_at
        #   When the vault was archived. Null if not archived.
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
        #   @return [Symbol, :vault]
        required :type, const: :vault

        # @!attribute updated_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :updated_at, Time

        # @!method initialize(id:, archived_at:, created_at:, display_name:, metadata:, updated_at:, type: :vault)
        #   A vault that stores credentials for use by agents during sessions.
        #
        #   @param id [String] The unique ID of the vault (`vlt_...`).
        #
        #   @param archived_at [Time, nil] When the vault was archived. Null if not archived.
        #
        #   @param created_at [Time] A timestamp in RFC 3339 format
        #
        #   @param display_name [String] Human-readable name for the vault.
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata attached to the vault.
        #
        #   @param updated_at [Time] A timestamp in RFC 3339 format
        #
        #   @param type [Symbol, :vault]
      end
    end

    BetaManagedAgentsVault = Beta::BetaManagedAgentsVault
  end
end
