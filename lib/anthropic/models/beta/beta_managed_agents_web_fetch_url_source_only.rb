# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWebFetchURLSourceOnly < Anthropic::Internal::Type::BaseModel
        # @!attribute tools
        #   The tools whose results contribute. Between 1 and 128 entries, each with a
        #   different name. An empty list is rejected; use "none" to allow no tool's
        #   results.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceToolReference>]
        required :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolReference] }

        # @!attribute type
        #
        #   @return [Symbol, :only]
        required :type, const: :only

        # @!method initialize(tools:, type: :only)
        #   Only the named tools' results contribute URLs that may be fetched.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly} for more
        #   details.
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceToolReference>] The tools whose results contribute. Between 1 and 128 entries, each with a diffe
        #
        #   @param type [Symbol, :only]
      end
    end

    BetaManagedAgentsWebFetchURLSourceOnly = Beta::BetaManagedAgentsWebFetchURLSourceOnly
  end
end
