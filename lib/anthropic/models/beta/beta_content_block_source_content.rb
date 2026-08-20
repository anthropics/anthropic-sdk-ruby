# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaContentBlockSourceContent
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text, -> { Anthropic::Beta::BetaTextBlockParam }

        variant :image, -> { Anthropic::Beta::BetaImageBlockParam }

        module Type
          extend Anthropic::Internal::Type::Enum

          TEXT = :text
          IMAGE = :image

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaContentBlockSourceContent} for more details.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :text
        #
        #   @option args [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] :cache_control Create a cache control breakpoint at this content block.
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam, Anthropic::Models::Beta::BetaCitationWebSearchResultLocationParam, Anthropic::Models::Beta::BetaCitationSearchResultLocationParam>, nil] :citations
        #
        #   @option args [Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource, Anthropic::Models::Beta::BetaFileImageSource] :source
        #
        #   @option args [Anthropic::Models::Beta::BetaImageTransformationsParam, nil] :transformations Configures the transformations the server applies to this image before the model
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam]
        def self.new(type:, **args)
          case type.to_sym
          when :text
            Anthropic::Beta::BetaTextBlockParam.new(**args)
          when :image
            Anthropic::Beta::BetaImageBlockParam.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaContentBlockSourceContent = Beta::BetaContentBlockSourceContent
  end
end
