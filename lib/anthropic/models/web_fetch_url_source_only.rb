# frozen_string_literal: true

module Anthropic
  module Models
    class WebFetchURLSourceOnly < Anthropic::Internal::Type::BaseModel
      # @!attribute tools
      #
      #   @return [Array<Anthropic::Models::WebFetchURLSourceToolReference>]
      required :tools, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::WebFetchURLSourceToolReference] }

      # @!attribute type
      #
      #   @return [Symbol, :only]
      required :type, const: :only

      # @!method initialize(tools:, type: :only)
      #   The tool filter variant under which only the named tools' results contribute.
      #
      #   @param tools [Array<Anthropic::Models::WebFetchURLSourceToolReference>]
      #   @param type [Symbol, :only]
    end
  end
end
