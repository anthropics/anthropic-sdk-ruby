# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaImageBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute source
        #
        #   @return [Anthropic::Beta::BetaBase64ImageSource, Anthropic::Beta::BetaURLImageSource]
        required :source, union: -> { Anthropic::Beta::BetaImageBlockParam::Source }

        # @!attribute type
        #
        #   @return [Symbol, :image]
        required :type, const: :image

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(source:, cache_control: nil, type: :image)
        #   @param source [Anthropic::Beta::BetaBase64ImageSource, Anthropic::Beta::BetaURLImageSource]
        #
        #   @param cache_control [Anthropic::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :image]

        # @see Anthropic::Beta::BetaImageBlockParam#source
        module Source
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :base64, -> { Anthropic::Beta::BetaBase64ImageSource }

          variant :url, -> { Anthropic::Beta::BetaURLImageSource }

          # @!method self.variants
          #   @return [Array(Anthropic::Beta::BetaBase64ImageSource, Anthropic::Beta::BetaURLImageSource)]

          define_sorbet_constant!(:Variants) do
            T.type_alias do
              T.any(Anthropic::Beta::BetaBase64ImageSource, Anthropic::Beta::BetaURLImageSource)
            end
          end
        end
      end
    end

    BetaImageBlockParam = Beta::BetaImageBlockParam
  end
end
