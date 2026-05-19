# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentToolset20260401GlobInput < Anthropic::Internal::Type::BaseModel
        # @!attribute pattern
        #   Doublestar glob pattern (e.g. `**/*.go`). Absolute patterns are only permitted
        #   when the runner is configured to allow them.
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
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401GlobInput} for
        #   more details.
        #
        #   Input payload for the `glob` tool. Returns paths matching a doublestar glob
        #   pattern, newest first.
        #
        #   @param pattern [String] Doublestar glob pattern (e.g. `**/*.go`). Absolute patterns
        #
        #   @param path [String] Optional directory root to search under. Defaults to the
      end
    end

    BetaManagedAgentsAgentToolset20260401GlobInput = Beta::BetaManagedAgentsAgentToolset20260401GlobInput
  end
end
