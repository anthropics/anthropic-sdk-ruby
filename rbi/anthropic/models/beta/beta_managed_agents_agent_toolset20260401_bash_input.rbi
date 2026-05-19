# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolset20260401BashInput =
      Beta::BetaManagedAgentsAgentToolset20260401BashInput

    module Beta
      class BetaManagedAgentsAgentToolset20260401BashInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401BashInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Shell command to execute. Omit only when `restart` is true.
        sig { returns(T.nilable(String)) }
        attr_reader :command

        sig { params(command: String).void }
        attr_writer :command

        # When true, restart the persistent bash session instead of running a command.
        # Subsequent calls without `restart` will run against the fresh session.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :restart

        sig { params(restart: T::Boolean).void }
        attr_writer :restart

        # Per-call timeout in milliseconds. Defaults to the runner-wide tool timeout when
        # omitted or zero.
        sig { returns(T.nilable(Integer)) }
        attr_reader :timeout_ms

        sig { params(timeout_ms: Integer).void }
        attr_writer :timeout_ms

        # Input payload for the `bash` tool of the `agent_toolset_20260401` toolset. All
        # fields are optional; a normal invocation supplies `command`, while
        # `restart=true` (with no `command`) reboots the runner-side bash session.
        sig do
          params(
            command: String,
            restart: T::Boolean,
            timeout_ms: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Shell command to execute. Omit only when `restart` is true.
          command: nil,
          # When true, restart the persistent bash session instead of running a command.
          # Subsequent calls without `restart` will run against the fresh session.
          restart: nil,
          # Per-call timeout in milliseconds. Defaults to the runner-wide tool timeout when
          # omitted or zero.
          timeout_ms: nil
        )
        end

        sig do
          override.returns(
            { command: String, restart: T::Boolean, timeout_ms: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
