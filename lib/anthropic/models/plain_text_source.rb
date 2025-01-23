# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # plain_text_source => {
    #   data: String,
    #   media_type: Anthropic::Models::PlainTextSource::MediaType,
    #   type: Anthropic::Models::PlainTextSource::Type
    # }
    # ```
    class PlainTextSource < Anthropic::BaseModel
      # @!attribute data
      #
      #   @return [String]
      required :data, String

      # @!attribute media_type
      #
      #   @return [Symbol, Anthropic::Models::PlainTextSource::MediaType]
      required :media_type, enum: -> { Anthropic::Models::PlainTextSource::MediaType }

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::PlainTextSource::Type]
      required :type, enum: -> { Anthropic::Models::PlainTextSource::Type }

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
end
