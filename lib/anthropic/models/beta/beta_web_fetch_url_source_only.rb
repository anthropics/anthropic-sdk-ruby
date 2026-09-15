# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebFetchURLSourceOnly < Anthropic::Internal::Type::BaseModel
        # @!attribute tools
        #
        #   @return [Array<Anthropic::Models::Beta::BetaWebFetchURLSourceToolReference>]
        required :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaWebFetchURLSourceToolReference] }

        # @!attribute type
        #
        #   @return [Symbol, :only]
        required :type, const: :only

        # @!method initialize(tools:, type: :only)
        #   The tool filter variant under which only the named tools' results contribute.
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaWebFetchURLSourceToolReference>]
        #   @param type [Symbol, :only]
      end
    end

    BetaWebFetchURLSourceOnly = Beta::BetaWebFetchURLSourceOnly
  end
end
