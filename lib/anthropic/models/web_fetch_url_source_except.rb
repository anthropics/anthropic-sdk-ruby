# frozen_string_literal: true

module Anthropic
  module Models
    class WebFetchURLSourceExcept < Anthropic::Internal::Type::BaseModel
      # @!attribute tools
      #
      #   @return [Array<Anthropic::Models::WebFetchURLSourceToolReference>]
      required :tools, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::WebFetchURLSourceToolReference] }

      # @!attribute type
      #
      #   @return [Symbol, :except]
      required :type, const: :except

      # @!method initialize(tools:, type: :except)
      #   The tool filter variant under which every result but the named tools'
      #   contributes.
      #
      #   @param tools [Array<Anthropic::Models::WebFetchURLSourceToolReference>]
      #   @param type [Symbol, :except]
    end
  end
end
