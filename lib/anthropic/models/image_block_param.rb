# frozen_string_literal: true

module Anthropic
  module Models
    class ImageBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Base64ImageSource, Anthropic::URLImageSource]
      required :source, union: -> { Anthropic::ImageBlockParam::Source }

      # @!attribute type
      #
      #   @return [Symbol, :image]
      required :type, const: :image

      # @!attribute cache_control
      #
      #   @return [Anthropic::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(source:, cache_control: nil, type: :image)
      #   @param source [Anthropic::Base64ImageSource, Anthropic::URLImageSource]
      #   @param cache_control [Anthropic::CacheControlEphemeral, nil]
      #   @param type [Symbol, :image]

      # @see Anthropic::ImageBlockParam#source
      module Source
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :base64, -> { Anthropic::Base64ImageSource }

        variant :url, -> { Anthropic::URLImageSource }

        # @!method self.variants
        #   @return [Array(Anthropic::Base64ImageSource, Anthropic::URLImageSource)]
      end
    end
  end
end
