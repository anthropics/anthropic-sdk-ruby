# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::MemoryVersions#retrieve
        class BetaManagedAgentsMemoryVersion < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute memory_id
          #
          #   @return [String]
          required :memory_id, String

          # @!attribute memory_store_id
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute operation
          #   MemoryVersionOperation enum
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation]
          required :operation, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type }

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!attribute content_sha256
          #
          #   @return [String, nil]
          optional :content_sha256, String, nil?: true

          # @!attribute content_size_bytes
          #
          #   @return [Integer, nil]
          optional :content_size_bytes, Integer, nil?: true

          # @!attribute created_by
          #
          #   @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor, nil]
          optional :created_by, union: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsActor }

          # @!attribute path
          #
          #   @return [String, nil]
          optional :path, String, nil?: true

          # @!attribute redacted_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          optional :redacted_at, Time, nil?: true

          # @!attribute redacted_by
          #
          #   @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor, nil]
          optional :redacted_by, union: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsActor }

          # @!method initialize(id:, created_at:, memory_id:, memory_store_id:, operation:, type:, content: nil, content_sha256: nil, content_size_bytes: nil, created_by: nil, path: nil, redacted_at: nil, redacted_by: nil)
          #   @param id [String]
          #
          #   @param created_at [Time] A timestamp in RFC 3339 format
          #
          #   @param memory_id [String]
          #
          #   @param memory_store_id [String]
          #
          #   @param operation [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation] MemoryVersionOperation enum
          #
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type]
          #
          #   @param content [String, nil]
          #
          #   @param content_sha256 [String, nil]
          #
          #   @param content_size_bytes [Integer, nil]
          #
          #   @param created_by [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor]
          #
          #   @param path [String, nil]
          #
          #   @param redacted_at [Time, nil] A timestamp in RFC 3339 format
          #
          #   @param redacted_by [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersion#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MEMORY_VERSION = :memory_version

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
