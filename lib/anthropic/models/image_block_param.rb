# frozen_string_literal: true

module Anthropic
  module Models
    class ImageBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource, Anthropic::Models::FileImageSource]
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

      # @!attribute transformations
      #   Configures the transformations the server applies to this image before the model
      #   observes it. Each key names a condition the server transforms images for; its
      #   value selects the transformation applied. Omitted keys keep their default
      #   behavior, and an empty object is equivalent to omitting the field.
      #
      #   @return [Anthropic::Models::ImageTransformationsParam, nil]
      optional :transformations, -> { Anthropic::ImageTransformationsParam }, nil?: true

      # @!method initialize(source:, cache_control: nil, transformations: nil, type: :image)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ImageBlockParam} for more details.
      #
      #   @param source [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource, Anthropic::Models::FileImageSource]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param transformations [Anthropic::Models::ImageTransformationsParam, nil] Configures the transformations the server applies to this image before the model
      #
      #   @param type [Symbol, :image]

      # @see Anthropic::Models::ImageBlockParam#source
      module Source
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :base64, -> { Anthropic::Base64ImageSource }

        variant :url, -> { Anthropic::URLImageSource }

        variant :file, -> { Anthropic::FileImageSource }

        module Type
          extend Anthropic::Internal::Type::Enum

          BASE64 = :base64
          URL = :url
          FILE = :file

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource, Anthropic::Models::FileImageSource)]

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
        #   @option args [String] :file_id
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource, Anthropic::Models::FileImageSource]
        def self.new(type:, **args)
          case type.to_sym
          when :base64
            Anthropic::Base64ImageSource.new(**args)
          when :url
            Anthropic::URLImageSource.new(**args)
          when :file
            Anthropic::FileImageSource.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end
  end
end
