# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaImageBlockParam < Anthropic::Internal::Type::BaseModel
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

        # @!method initialize(source:, cache_control: nil, type: :image)
        #   @param source [Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource]
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   @param type [Symbol, :image]

        # @see Anthropic::Models::Beta::BetaImageBlockParam#source
        module Source
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :base64, -> { Anthropic::Models::Beta::BetaBase64ImageSource }

          variant :url, -> { Anthropic::Models::Beta::BetaURLImageSource }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource)]
        end
      end
    end

    BetaImageBlockParam = Beta::BetaImageBlockParam
  end
end
