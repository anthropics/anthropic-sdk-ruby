# frozen_string_literal: true

module Anthropic
  module Models
    class ImageBlockParam < Anthropic::Internal::Type::BaseModel
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

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void

      # @see Anthropic::Models::ImageBlockParam#source
      module Source
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :base64, -> { Anthropic::Models::Base64ImageSource }

        variant :url, -> { Anthropic::Models::URLImageSource }

        # @!parse
        #   # @return [Array(Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource)]
        #   def self.variants; end
      end
    end
  end
end
