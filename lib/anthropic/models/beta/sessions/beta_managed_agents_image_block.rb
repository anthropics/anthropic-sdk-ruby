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

            module Type
              extend Anthropic::Internal::Type::Enum

              BASE64 = :base64
              URL = :url
              FILE = :file

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64ImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileImageSource)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock::Source} for
            # more details.
            #
            # @param type [Symbol, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :data Base64-encoded image data.
            #
            #   @option args [String] :media_type MIME type of the image (e.g., "image/png", "image/jpeg", "image/gif", "image/web
            #
            #   @option args [String] :url URL of the image to fetch.
            #
            #   @option args [String] :file_id ID of a previously uploaded file.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64ImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileImageSource]
            def self.new(type:, **args)
              case type.to_sym
              when :base64
                Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource.new(**args)
              when :url
                Anthropic::Beta::Sessions::BetaManagedAgentsURLImageSource.new(**args)
              when :file
                Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
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
