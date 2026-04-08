# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsImageBlock < Anthropic::Internal::Type::BaseModel
          # @!attribute source
          #   Union type for image source variants.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64ImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileImageSource]
          required :source, union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::Source }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::Type }

          # @!method initialize(source:, type:)
          #   Image content specified directly as base64 data or as a reference via a URL.
          #
          #   @param source [Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64ImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileImageSource] Union type for image source variants.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock::Type]

          # Union type for image source variants.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock#source
          module Source
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Base64-encoded image data.
            variant :base64, -> { Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource }

            # Image referenced by URL.
            variant :url, -> { Anthropic::Beta::Sessions::BetaManagedAgentsURLImageSource }

            # Image referenced by file ID.
            variant :file, -> { Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64ImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileImageSource)]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock#type
          module Type
            extend Anthropic::Internal::Type::Enum

            IMAGE = :image

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
