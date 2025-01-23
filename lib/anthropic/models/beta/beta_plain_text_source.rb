# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_plain_text_source => {
      #   data: String,
      #   media_type: Anthropic::Models::Beta::BetaPlainTextSource::MediaType,
      #   type: Anthropic::Models::Beta::BetaPlainTextSource::Type
      # }
      # ```
      class BetaPlainTextSource < Anthropic::BaseModel
        # @!attribute data
        #
        #   @return [String]
        required :data, String

        # @!attribute media_type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaPlainTextSource::MediaType]
        required :media_type, enum: -> { Anthropic::Models::Beta::BetaPlainTextSource::MediaType }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaPlainTextSource::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaPlainTextSource::Type }

        # @!parse
        #   # @param data [String]
        #   # @param media_type [String]
        #   # @param type [String]
        #   #
        #   def initialize(data:, media_type:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case media_type
        # in :"text/plain"
        #   # ...
        # end
        # ```
        class MediaType < Anthropic::Enum
          TEXT_PLAIN = :"text/plain"

          finalize!
        end

        # @example
        # ```ruby
        # case type
        # in :text
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          TEXT = :text

          finalize!
        end
      end
    end

    BetaPlainTextSource = Beta::BetaPlainTextSource
  end
end
