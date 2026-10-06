# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWebFetchURLSourceExcept < Anthropic::Internal::Type::BaseModel
        # @!attribute tools
        #   The tools whose results do not contribute. Between 1 and 128 entries, each with
        #   a different name. An empty list is rejected; use "all" to leave out no tool's
        #   results.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceToolReference>]
        required :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolReference] }

        # @!attribute type
        #
        #   @return [Symbol, :except]
        required :type, const: :except

        # @!method initialize(tools:, type: :except)
        #   Every tool's results contribute URLs that may be fetched, except the named
        #   tools' results.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept} for more
        #   details.
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceToolReference>] The tools whose results do not contribute. Between 1 and 128 entries, each with
        #
        #   @param type [Symbol, :except]
      end
    end

    BetaManagedAgentsWebFetchURLSourceExcept = Beta::BetaManagedAgentsWebFetchURLSourceExcept
  end
end
