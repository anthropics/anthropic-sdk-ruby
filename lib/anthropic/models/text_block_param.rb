# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # text_block_param => {
    #   text: String,
    #   type: Anthropic::Models::TextBlockParam::Type,
    #   cache_control: Anthropic::Models::CacheControlEphemeral
    # }
    # ```
    class TextBlockParam < Anthropic::BaseModel
      # @!attribute text
      #
      #   @return [String]
      required :text, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::TextBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::TextBlockParam::Type }

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }

      # @!parse
      #   # @param text [String]
      #   # @param type [String]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   #
      #   def initialize(text:, type:, cache_control: nil, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
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
