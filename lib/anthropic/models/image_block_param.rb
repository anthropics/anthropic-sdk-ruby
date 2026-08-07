# frozen_string_literal: true

module Anthropic
  module Models
    class ImageBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource]
      required :source, union: -> { Anthropic::ImageBlockParam::Source }

      # @!attribute type
      #
      #   @return [Symbol, :image]
      required :type, const: :image

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(source:, cache_control: nil, type: :image)
      #   @param source [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param type [Symbol, :image]

      # @see Anthropic::Models::ImageBlockParam#source
      module Source
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :base64, -> { Anthropic::Base64ImageSource }

        variant :url, -> { Anthropic::URLImageSource }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :data
        #
        #   @option args [Symbol, Anthropic::Models::Base64ImageSource::MediaType] :media_type
        #
        #   @option args [String] :url
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource]
        def self.new(type:, **args)
          case type.to_sym
          when :base64
            Anthropic::Base64ImageSource.new(**args)
          when :url
            Anthropic::URLImageSource.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end
  end
end
