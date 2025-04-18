# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Models#retrieve
    class ModelRetrieveParams < Anthropic::Internal::Type::BaseModel
      # @!parse
      #   extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
