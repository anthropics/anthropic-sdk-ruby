# frozen_string_literal: true

module Anthropic
  module Models
    class WebFetchURLSourceNone < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :none]
      required :type, const: :none

      # @!method initialize(type: :none)
      #   The `url_sources` variant under which a source contributes nothing: no result of
      #   the tool filter's source, or no user input.
      #
      #   @param type [Symbol, :none]
    end
  end
end
