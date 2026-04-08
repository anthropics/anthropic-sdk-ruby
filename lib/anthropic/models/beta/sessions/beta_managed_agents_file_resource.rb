# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # @see Anthropic::Resources::Beta::Sessions::Resources#add
        class BetaManagedAgentsFileResource < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute file_id
          #
          #   @return [String]
          required :file_id, String

          # @!attribute mount_path
          #
          #   @return [String]
          required :mount_path, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsFileResource::Type }

          # @!attribute updated_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :updated_at, Time

          # @!method initialize(id:, created_at:, file_id:, mount_path:, type:, updated_at:)
          #   @param id [String]
          #
          #   @param created_at [Time] A timestamp in RFC 3339 format
          #
          #   @param file_id [String]
          #
          #   @param mount_path [String]
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource::Type]
          #
          #   @param updated_at [Time] A timestamp in RFC 3339 format

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource#type
          module Type
            extend Anthropic::Internal::Type::Enum

            FILE = :file

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
