# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebFetchURLSourceExcept < Anthropic::Internal::Type::BaseModel
        # @!attribute tools
        #
        #   @return [Array<Anthropic::Models::Beta::BetaWebFetchURLSourceToolReference>]
        required :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaWebFetchURLSourceToolReference] }

        # @!attribute type
        #
        #   @return [Symbol, :except]
        required :type, const: :except

        # @!method initialize(tools:, type: :except)
        #   The tool filter variant under which every result but the named tools'
        #   contributes.
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaWebFetchURLSourceToolReference>]
        #   @param type [Symbol, :except]
      end
    end

    BetaWebFetchURLSourceExcept = Beta::BetaWebFetchURLSourceExcept
  end
end
