# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebFetchURLSourceToolReference < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, :tool_reference]
        required :type, const: :tool_reference

        # @!method initialize(name:, type: :tool_reference)
        #   One entry of a tool filter's `tools`: it must name a tool declared in this
        #   request's `tools[]`.
        #
        #   @param name [String]
        #   @param type [Symbol, :tool_reference]
      end
    end

    BetaWebFetchURLSourceToolReference = Beta::BetaWebFetchURLSourceToolReference
  end
end
