# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#create
        class BetaManagedAgentsMemory < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute content_sha256
          #
          #   @return [String]
          required :content_sha256, String

          # @!attribute content_size_bytes
          #
          #   @return [Integer]
          required :content_size_bytes, Integer

          # @!attribute created_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute memory_store_id
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute memory_version_id
          #
          #   @return [String]
          required :memory_version_id, String

          # @!attribute path
          #
          #   @return [String]
          required :path, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type }

          # @!attribute updated_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!method initialize(id:, content_sha256:, content_size_bytes:, created_at:, memory_store_id:, memory_version_id:, path:, type:, updated_at:, content: nil)
          #   @param id [String]
          #
          #   @param content_sha256 [String]
          #
          #   @param content_size_bytes [Integer]
          #
          #   @param created_at [Time] A timestamp in RFC 3339 format
          #
          #   @param memory_store_id [String]
          #
          #   @param memory_version_id [String]
          #
          #   @param path [String]
          #
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory::Type]
          #
          #   @param updated_at [Time] A timestamp in RFC 3339 format
          #
          #   @param content [String, nil]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MEMORY = :memory

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
