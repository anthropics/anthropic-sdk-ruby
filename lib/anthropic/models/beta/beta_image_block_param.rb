# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaImageBlockParam < Anthropic::BaseModel
        # @!attribute source
        #
        #   @return [Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource]
        required :source, union: -> { Anthropic::Models::Beta::BetaImageBlockParam::Source }

        # @!attribute type
        #
        #   @return [Symbol, :image]
        required :type, const: :image

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!parse
        #   # @param source [Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param type [Symbol, :image]
        #   #
        #   def initialize(source:, cache_control: nil, type: :image, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @abstract
        #
        # @example
        # ```ruby
        # case source
        # in {type: "base64", data: String, media_type: Anthropic::Models::Beta::BetaBase64ImageSource::MediaType}
        #   # Anthropic::Models::Beta::BetaBase64ImageSource ...
        # in {type: "url", url: String}
        #   # Anthropic::Models::Beta::BetaURLImageSource ...
        # end
        # ```
        #
        # @example
        # ```ruby
        # case source
        # in Anthropic::Models::Beta::BetaBase64ImageSource
        #   # ...
        # in Anthropic::Models::Beta::BetaURLImageSource
        #   # ...
        # end
        # ```
        class Source < Anthropic::Union
          discriminator :type

          variant :base64, -> { Anthropic::Models::Beta::BetaBase64ImageSource }

          variant :url, -> { Anthropic::Models::Beta::BetaURLImageSource }
        end
      end
    end

    BetaImageBlockParam = Beta::BetaImageBlockParam
  end
end
