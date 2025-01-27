# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_plain_text_source => {
      #   data: String,
      #   media_type: :"text/plain",
      #   type: :text
      # }
      # ```
      class BetaPlainTextSource < Anthropic::BaseModel
        # @!attribute data
        #
        #   @return [String]
        required :data, String

        # @!attribute media_type
        #
        #   @return [Symbol, :"text/plain"]
        required :media_type, const: :"text/plain"

        # @!attribute type
        #
        #   @return [Symbol, :text]
        required :type, const: :text

        # @!parse
        #   # @param data [String]
        #   # @param media_type [Symbol, :"text/plain"]
        #   # @param type [Symbol, :text]
        #   #
        #   def initialize(data:, media_type: :"text/plain", type: :text, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaPlainTextSource = Beta::BetaPlainTextSource
  end
end
