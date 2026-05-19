# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentToolset20260401BashInput < Anthropic::Internal::Type::BaseModel
        # @!attribute command
        #   Shell command to execute. Omit only when `restart` is true.
        #
        #   @return [String, nil]
        optional :command, String

        # @!attribute restart
        #   When true, restart the persistent bash session instead of running a command.
        #   Subsequent calls without `restart` will run against the fresh session.
        #
        #   @return [Boolean, nil]
        optional :restart, Anthropic::Internal::Type::Boolean

        # @!attribute timeout_ms
        #   Per-call timeout in milliseconds. Defaults to the runner-wide tool timeout when
        #   omitted or zero.
        #
        #   @return [Integer, nil]
        optional :timeout_ms, Integer

        # @!method initialize(command: nil, restart: nil, timeout_ms: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401BashInput} for
        #   more details.
        #
        #   Input payload for the `bash` tool of the `agent_toolset_20260401` toolset. All
        #   fields are optional; a normal invocation supplies `command`, while
        #   `restart=true` (with no `command`) reboots the runner-side bash session.
        #
        #   @param command [String] Shell command to execute. Omit only when `restart` is true.
        #
        #   @param restart [Boolean] When true, restart the persistent bash session instead of
        #
        #   @param timeout_ms [Integer] Per-call timeout in milliseconds. Defaults to the
      end
    end

    BetaManagedAgentsAgentToolset20260401BashInput = Beta::BetaManagedAgentsAgentToolset20260401BashInput
  end
end
