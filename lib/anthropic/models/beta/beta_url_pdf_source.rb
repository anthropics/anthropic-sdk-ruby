# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaURLPDFSource < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :url]
        required :type, const: :url

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!parse
        #   # @param url [String]
        #   # @param type [Symbol, :url]
        #   #
        #   def initialize(url:, type: :url, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaURLPDFSource = Beta::BetaURLPDFSource
  end
end
