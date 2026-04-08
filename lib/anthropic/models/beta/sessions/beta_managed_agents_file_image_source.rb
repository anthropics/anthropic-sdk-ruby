# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsFileImageSource < Anthropic::Internal::Type::BaseModel
          # @!attribute file_id
          #   ID of a previously uploaded file.
          #
          #   @return [String]
          required :file_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileImageSource::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource::Type }

          # @!method initialize(file_id:, type:)
          #   Image referenced by file ID.
          #
          #   @param file_id [String] ID of a previously uploaded file.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileImageSource::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileImageSource#type
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
