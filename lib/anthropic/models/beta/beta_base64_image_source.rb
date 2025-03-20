# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBase64ImageSource < Anthropic::BaseModel
        # @!attribute data
        #
        #   @return [String]
        required :data, String

        # @!attribute media_type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaBase64ImageSource::MediaType]
        required :media_type, enum: -> { Anthropic::Models::Beta::BetaBase64ImageSource::MediaType }

        # @!attribute type
        #
        #   @return [Symbol, :base64]
        required :type, const: :base64

        # @!parse
        #   # @param data [String]
        #   # @param media_type [Symbol, Anthropic::Models::Beta::BetaBase64ImageSource::MediaType]
        #   # @param type [Symbol, :base64]
        #   #
        #   def initialize(data:, media_type:, type: :base64, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        module MediaType
          extend Anthropic::Enum

          IMAGE_JPEG = :"image/jpeg"
          IMAGE_PNG = :"image/png"
          IMAGE_GIF = :"image/gif"
          IMAGE_WEBP = :"image/webp"

          finalize!

          class << self
            # @!parse
            #   # @return [Array<Symbol>]
            #   def values; end
          end
        end
      end
    end

    BetaBase64ImageSource = Beta::BetaBase64ImageSource
  end
end
