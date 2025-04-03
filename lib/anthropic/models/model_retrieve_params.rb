# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Models#retrieve
    class ModelRetrieveParams < Anthropic::BaseModel
      # @!parse
      #   extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!parse
      #   # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(request_options: {}, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
