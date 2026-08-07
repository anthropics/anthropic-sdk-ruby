# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaImageBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute source
        #
        #   @return [Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource, Anthropic::Models::Beta::BetaFileImageSource]
        required :source, union: -> { Anthropic::Beta::BetaImageBlockParam::Source }

        # @!attribute type
        #
        #   @return [Symbol, :image]
        required :type, const: :image

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(source:, cache_control: nil, type: :image)
        #   @param source [Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource, Anthropic::Models::Beta::BetaFileImageSource]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :image]

        # @see Anthropic::Models::Beta::BetaImageBlockParam#source
        module Source
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :base64, -> { Anthropic::Beta::BetaBase64ImageSource }

          variant :url, -> { Anthropic::Beta::BetaURLImageSource }

          variant :file, -> { Anthropic::Beta::BetaFileImageSource }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource, Anthropic::Models::Beta::BetaFileImageSource)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :data
          #
          #   @option args [Symbol, Anthropic::Models::Beta::BetaBase64ImageSource::MediaType] :media_type
          #
          #   @option args [String] :url
          #
          #   @option args [String] :file_id
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource, Anthropic::Models::Beta::BetaFileImageSource]
          def self.new(type:, **args)
            case type.to_sym
            when :base64
              Anthropic::Beta::BetaBase64ImageSource.new(**args)
            when :url
              Anthropic::Beta::BetaURLImageSource.new(**args)
            when :file
              Anthropic::Beta::BetaFileImageSource.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaImageBlockParam = Beta::BetaImageBlockParam
  end
end
