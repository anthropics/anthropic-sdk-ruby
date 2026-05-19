# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentToolset20260401GrepInput < Anthropic::Internal::Type::BaseModel
        # @!attribute pattern
        #   Regular expression to search for.
        #
        #   @return [String]
        required :pattern, String

        # @!attribute path
        #   Optional directory root to search under. Defaults to the runner's working
        #   directory.
        #
        #   @return [String, nil]
        optional :path, String

        # @!method initialize(pattern:, path: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401GrepInput} for
        #   more details.
        #
        #   Input payload for the `grep` tool. Searches file contents for a regular
        #   expression, returning matching lines.
        #
        #   @param pattern [String] Regular expression to search for.
        #
        #   @param path [String] Optional directory root to search under. Defaults to the
      end
    end

    BetaManagedAgentsAgentToolset20260401GrepInput = Beta::BetaManagedAgentsAgentToolset20260401GrepInput
  end
end
