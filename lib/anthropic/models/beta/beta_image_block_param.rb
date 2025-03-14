# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaImageBlockParam < Anthropic::BaseModel
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

        # @!parse
        #   # @param source [Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param type [Symbol, :image]
        #   #
        #   def initialize(source:, cache_control: nil, type: :image, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @abstract
        class Source < Anthropic::Union
          discriminator :type

          variant :base64, -> { Anthropic::Models::Beta::BetaBase64ImageSource }

          variant :url, -> { Anthropic::Models::Beta::BetaURLImageSource }

          # @!parse
          #   class << self
          #     # @return [Array(Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource)]
          #     def variants; end
          #   end
        end
      end
    end

    BetaImageBlockParam = Beta::BetaImageBlockParam
  end
end
