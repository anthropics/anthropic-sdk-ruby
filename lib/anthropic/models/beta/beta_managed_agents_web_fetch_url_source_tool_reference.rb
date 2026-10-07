# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWebFetchURLSourceToolReference < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool. Compared exactly, so upper and lower case letters are
        #   different.
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #   Must be "tool_reference".
        #
        #   @return [Symbol, :tool_reference]
        required :type, const: :tool_reference

        # @!method initialize(name:, type: :tool_reference)
        #   Names one tool in an only or except list.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceToolReference} for
        #   more details.
        #
        #   @param name [String] Name of the tool. Compared exactly, so upper and lower case letters are differen
        #
        #   @param type [Symbol, :tool_reference] Must be "tool_reference".
      end
    end

    BetaManagedAgentsWebFetchURLSourceToolReference = Beta::BetaManagedAgentsWebFetchURLSourceToolReference
  end
end
