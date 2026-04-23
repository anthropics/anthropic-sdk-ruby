# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::MemoryStores#create
      class BetaManagedAgentsMemoryStore < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStore::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMemoryStore::Type }

        # @!attribute updated_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :updated_at, Time

        # @!attribute archived_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        optional :archived_at, Time, nil?: true

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute metadata
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!method initialize(id:, created_at:, name:, type:, updated_at:, archived_at: nil, description: nil, metadata: nil)
        #   @param id [String]
        #
        #   @param created_at [Time] A timestamp in RFC 3339 format
        #
        #   @param name [String]
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStore::Type]
        #
        #   @param updated_at [Time] A timestamp in RFC 3339 format
        #
        #   @param archived_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param description [String]
        #
        #   @param metadata [Hash{Symbol=>String}]

        # @see Anthropic::Models::Beta::BetaManagedAgentsMemoryStore#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MEMORY_STORE = :memory_store

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMemoryStore = Beta::BetaManagedAgentsMemoryStore
  end
end
