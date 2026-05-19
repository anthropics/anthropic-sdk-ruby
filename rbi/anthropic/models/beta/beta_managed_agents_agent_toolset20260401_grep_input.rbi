# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentToolset20260401GrepInput =
      Beta::BetaManagedAgentsAgentToolset20260401GrepInput

    module Beta
      class BetaManagedAgentsAgentToolset20260401GrepInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentToolset20260401GrepInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Regular expression to search for.
        sig { returns(String) }
        attr_accessor :pattern

        # Optional directory root to search under. Defaults to the runner's working
        # directory.
        sig { returns(T.nilable(String)) }
        attr_reader :path

        sig { params(path: String).void }
        attr_writer :path

        # Input payload for the `grep` tool. Searches file contents for a regular
        # expression, returning matching lines.
        sig { params(pattern: String, path: String).returns(T.attached_class) }
        def self.new(
          # Regular expression to search for.
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
