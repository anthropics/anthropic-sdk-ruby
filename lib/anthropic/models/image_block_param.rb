# frozen_string_literal: true

module Anthropic
  module Models
    class ImageBlockParam < Anthropic::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource]
      required :source, union: -> { Anthropic::Models::ImageBlockParam::Source }

      # @!attribute type
      #
      #   @return [Symbol, :image]
      required :type, const: :image

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }, nil?: true

      # @!parse
      #   # @param source [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   # @param type [Symbol, :image]
      #   #
      #   def initialize(source:, cache_control: nil, type: :image, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @abstract
      #
      # @example
      # ```ruby
      # case source
      # in {type: "base64", data: String, media_type: Anthropic::Models::Base64ImageSource::MediaType}
      #   # Anthropic::Models::Base64ImageSource ...
      # in {type: "url", url: String}
      #   # Anthropic::Models::URLImageSource ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case source
      # in Anthropic::Models::Base64ImageSource
      #   # ...
      # in Anthropic::Models::URLImageSource
      #   # ...
      # end
      # ```
      class Source < Anthropic::Union
        discriminator :type

        variant :base64, -> { Anthropic::Models::Base64ImageSource }

        variant :url, -> { Anthropic::Models::URLImageSource }
      end
    end
  end
end
