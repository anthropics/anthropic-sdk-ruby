# frozen_string_literal: true

module Anthropic
  module Models
    class WebFetchURLSourceAll < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :all]
      required :type, const: :all

      # @!method initialize(type: :all)
      #   The `url_sources` variant under which a source contributes in full: every result
      #   of the tool filter's source, or all user input.
      #
      #   @param type [Symbol, :all]
    end
  end
end
