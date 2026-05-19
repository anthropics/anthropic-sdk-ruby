# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolset20260401GlobInput =
      Beta::BetaManagedAgentsAgentToolset20260401GlobInput

    module Beta
      class BetaManagedAgentsAgentToolset20260401GlobInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401GlobInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Doublestar glob pattern (e.g. `**/*.go`). Absolute patterns are only permitted
        # when the runner is configured to allow them.
        sig { returns(String) }
        attr_accessor :pattern

        # Optional directory root to search under. Defaults to the runner's working
        # directory.
        sig { returns(T.nilable(String)) }
        attr_reader :path

        sig { params(path: String).void }
        attr_writer :path

        # Input payload for the `glob` tool. Returns paths matching a doublestar glob
        # pattern, newest first.
        sig { params(pattern: String, path: String).returns(T.attached_class) }
        def self.new(
          # Doublestar glob pattern (e.g. `**/*.go`). Absolute patterns are only permitted
          # when the runner is configured to allow them.
          pattern:,
          # Optional directory root to search under. Defaults to the runner's working
          # directory.
          path: nil
        )
        end

        sig { override.returns({ pattern: String, path: String }) }
        def to_hash
        end
      end
    end
  end
end
